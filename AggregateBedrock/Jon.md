## Rename asset/location to asset_group/asset
``` json
{
  "asset": "coa_mwbe_vendors",  //eric says groups go in asset table
  "location": null,
  "type": "nonaggregate",
  "active": true,
  "description": "List of MWBE vendors registered in Munis (not necessarily certified)",
  "depends": [
    "abi_potential_vendors"  //group dependents are the assets
    "coa_mwbe_vendors.vendors-default",
    "coa_mwbe_vendors.vendors-by-code"
  ]
}

{
  "asset_name": "coa_mwbe_vendors.vendors-default",
  "filename": "abi_outreach_vendors",
  "connection": "bedrock-googlesheets",
  "spreadsheetid": "1lm_LdZS6yhniDEuVGyaj3vdD7ACU8Eo_pCkmNr81TvA",
  "range": "Vendors!A2:Z"
}

{
  "asset_name": "coa_mwbe_vendors.vendors-by-code",
  "filename": "abi_outreach_vendors",
  "connection": "bedrock-googlesheets",
  "spreadsheetid": "1lm_LdZS6yhniDEuVGyaj3vdD7ACU8Eo_pCkmNr81TvA",
  "range": "Vendors By Commodity Code!A2:Z"
}





{
  "run_group": "daily",
  "tasks": [
    {
      "type": "table_copy",
      "source_location": {
        "asset_name": "coa_mwbe_vendors.vendors-default"
      },
      "target_location": {
        "asset_name": "coa_mwbe_vendors.vendors-by-code",
        "append": false
      },
      "active": true
    }
  ]
}
```


  "name": "ad_info",
  "location": {
      "connection": "pubrecdb1/mdastore1/dbadmin",
      "schemaname": "internal",
      "tablename": "ad_info"
    },
  "active": true,
  "type": "table",
  "description": "Active Directory info",
  "depends": [],
  "tags": [],
