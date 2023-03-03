# managed-data-assets
City of Asheville managed data assets.
[Bedrock](https://github.com/cityofasheville/bedrock2) reads these files.

## File Formats
A subdir exists for each asset. Each subdir has two files, the Asset file (assetname.json) and the ETL file (assetname.etl.json). Other helper files may also be included, such as SQL scripts.
For more information see [README_file_formats.md](https://github.com/cityofasheville/managed-data-assets/blob/production/README_file_formats.md).
Also see [Formats in Bedrock Repo](https://github.com/cityofasheville/bedrock2/blob/production/docs/etl_formats.md)


## NEW: Assets copied to database
Instead of the Github Action copy to S3, we will now use a command line script scripts/load_assets.py to load
the database. This is intended as a temporary solution until we get the API/web front end.

## Github Actions (old method)
Pushing to production branch runs a Github action.

1. Changes are pushed to S3.
1. The S3 file /run/all_assets.json is created.

Three secrets are held in the GitHub repo, under Settings/Secrets/Actions.
- AWS_S3_BUCKET
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

The Github Action runs from the file [.github/workflows/preprocess.yml](https://github.com/cityofasheville/managed-data-assets/blob/production/.github/workflows/preprocess.yml) , 
which calls the Python script [.github/workflows/preprocess_asset/preprocess_asset.py](https://github.com/cityofasheville/managed-data-assets/blob/production/.github/workflows/preprocess_assets/preprocess_assets.py)