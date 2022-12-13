import os
import json
import sys
import psycopg2
import boto3
from botocore.exceptions import ClientError


def get_db_config():
    bedrock_user = "nopubrecdb1/bedrock/bedrock_user"
    region_name = "us-east-1"

    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )
    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=bedrock_user
        )
    except ClientError as e:
        raise e
    return get_secret_value_response['SecretString']


db_config = json.loads(get_db_config())

print(db_config)

conn = psycopg2.connect(
    host=db_config['host'],
    dbname=db_config['database'],
    password=db_config['password'],
    user=db_config['username']
  )
cur = conn.cursor()

# clear out old data
sql = f'''
  truncate table bedrock.assets;
  truncate table bedrock.dependencies;
  truncate table bedrock.etl;
  truncate table bedrock.tasks;
'''
cur.execute(sql)

assets_directory = '../assets'
for asset_name in os.listdir(assets_directory):
  # each asset
  print('Processing ', asset_name)
  d = os.path.join(assets_directory, asset_name)
  if os.path.isdir(d):
    for file in os.listdir(d):
      if file == asset_name + '.json':
        # configFile
        with open(os.path.join(d, file), 'r') as ff:
          config = json.load(ff)
          sql = f'''
            insert into bedrock.assets
            (asset_name, description, location, active)
            values(%s, %s, %s, %s);
          '''
          cur.execute(sql,
          (asset_name, config["description"], config["location"], config["active"]
          ))
          dependencies = config['depends']
          
          if dependencies:
            # print("deps:", item, dependencies)
            for depend in dependencies:
              sql = f'''
              insert into bedrock.dependencies(asset_name, dependency)
              values(%s, %s);
              '''
              cur.execute(sql, (asset_name, depend))
      elif file == asset_name + '.etl.json':
        # etlFile
        with open(os.path.join(d, file), 'r') as ff:
          etl = json.load(ff)
          sql = f'''
          insert into bedrock.etl(asset_name, run_group, active)
          values(%s, %s, %s);
          '''
          cur.execute(sql,(asset_name, etl['run_group'], "true"))
          tasks = etl['tasks']
          for seq_number, task in enumerate(tasks):
            type = task['type']
            if 'description' in task:
              description = task['description']
            else:
              description = None
            if type == "table_copy" or type == "file_copy":
              # table_copy / file_copy
              sql = f'''
              insert into bedrock.tasks(asset_name, seq_number, description, type, active, source, target, configuration)
              values(%s, %s, %s, %s, %s, %s, %s, %s);
              '''
              cur.execute(sql, (asset_name, seq_number, description, type, task['active'], 
              json.dumps(task['source_location']), json.dumps(task['target_location']), None))
            elif type == "sql":
              # sql
              sql_filename = task['file']
              with open(os.path.join(d, sql_filename), 'r') as sqlfile:
                sqlstring = sqlfile.read()
              sql = f'''
              insert into bedrock.tasks(asset_name, seq_number, description, type, active, source, target, configuration)
              values(%s, %s, %s, %s, %s, %s, %s, %s);
              '''
              cur.execute(sql, (asset_name, seq_number, description, type, task['active'], 
              None, json.dumps({ "connection": task['connection'] }), sqlstring))
            else:
              # everything else
              sql = f'''
              insert into bedrock.tasks(asset_name, seq_number, description, type, active, source, target, configuration)
              values(%s, %s, %s, %s, %s, %s, %s, %s);
              '''
              cur.execute(sql, (asset_name, seq_number, description, type, task['active'], 
              None, json.dumps(task), None))

    # nm = cur.fetchone()[0] # probably can skip this, but maybe to double check


conn.commit()
cur.close()
conn.close()
