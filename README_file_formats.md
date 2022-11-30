
A subdir exists for each asset. Each asset includes:

- The **Asset** file should have at least these fields:
    ```
    {
        "name": "assetname",
        "location": "mdastore1",
        "active": true,
        "depends": []
    }
    ```
    "Depends" is an array of other assetnames which must be created before this asset can be created.


- The **ETL** files have several variations. Here is an example.
 
    ```
    {
        "run_group": "daily",
        "tasks": [
            {
                "type": "table_copy",
                "source_location": {
                    "connection": "bedrock-googlesheets",
                    "filename": "Companies",
                    "spreadsheetid": "1FxxxxxxxxxRA",
                    "range": "Companies!A5:B"
                },
                "target_location": {
                    "connection": "pubrecdb1/mdastore1/dbadmin",
                    "schemaname": "internal",
                    "tablename": "companies"
                },
                "active": true
            }
        ]
    }
    ```

    - Run_group tells Bedrock when to run the ETL task.
    - The ETL job can have multiple tasks. For example, it might copy a table and then run an SQL script.
    - Task Types:
        - **table_copy** Includes fields
            - "type": "table_copy"
            - "source_location": {}
            - "target_location": {}
            - "active": true
        Source_location and target_location are where the data is copied from and to. They might be database tables, files or spreadsheets. Each location will have the field "connection". This is a lookup for the secrets needed to retrieve the data, such as database passwords. Database connections are named in the format server/database/user. Connections also have multiple types, which changes which other fields need to be included in this section. For example:
                - Database tables or views require:
                    - "schemaname": "",
                    - "tablename": ""
                - Database optional fields:
                    "append_serial": "objectid" (target)
                    "sortasc": "fieldname", (source)
                    "sortdesc": "fieldname", (source)
                    "fixedwidth_noquotes": true (source)
                    "copy_since" : {  (To copy only the latest data between 2 db tables add this)
                        "num_weeks": 1,
                        "column_to_filter": "column_name"
                    }
                - Google Sheet connections require:
                    - "filename": "",
                    - "spreadsheetid": "",
                    - "range": ""

        - **sql** Includes fields
            - "type": "sql"
            - "file": "sql-file-to-run.sql",
            - "active": true 
        File is a filename in the same directory with the ETL file.


        - **file_copy** Includes fields
            - "type": "file_copy"
            - "source_location": {}
            - "target_location": {}
            - "active": true

            File connections need these fields:

            - "connection": "",
            - "filename": "",
            - "path": ""

        - **table_copy_since** Use table_copy to only copies the latest data from a larger table. Works from and to databases only.
            Deletes out any records from target table with column_to_filter (a date column) num_weeks back, and loads them with 
            the same time period from the source table.

            {
                "type": "table_copy",
                "source_location": {
                    "connection": "bedrock-googlesheets",
                    "filename": "Companies",
                    "spreadsheetid": "1FxxxxxxxxxRA",
                    "range": "Companies!A5:B"
                },
                "target_location": {
                    "connection": "pubrecdb1/mdastore1/dbadmin",
                    "schemaname": "internal",
                    "tablename": "companies"
                },
                "copy_since" : {
                    "num_weeks": 1,
                    "column_to_filter": "ACTIVITY_TIME"
                }
                "active": true
            }
