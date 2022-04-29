# managed-data-assets
All City of Asheville managed data assets

Pushing to production branch automatically pushes changes to S3 using Github actions.
To register these changes in Bedrock, create the /run/all_assets.json file by running from Bedrock Docker: 'bedrock preprocess -o s3'
