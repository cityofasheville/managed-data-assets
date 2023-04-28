```json
{
  "name": "coa_mwbe_vendors",
  "location": [
    {
      "name": "vendors-default",
      "filename": "abi_outreach_vendors",
      "connection": "bedrock-googlesheets",
      "spreadsheetid": "1lm_LdZS6yhniDEuVGyaj3vdD7ACU8Eo_pCkmNr81TvA",
      "range": "Vendors!A2:Z"
    },
    {
      "name": "vendors-by-code",
      "filename": "abi_outreach_vendors",
      "connection": "bedrock-googlesheets",
      "spreadsheetid": "1lm_LdZS6yhniDEuVGyaj3vdD7ACU8Eo_pCkmNr81TvA",
      "range": "Vendors By Commodity Code!A2:Z"
    }
  ],
  "active": true,
  "type": "spreadsheet",
  "description": "List of MWBE vendors registered in Munis (not necessarily certified)",
  "depends": ["abi_potential_vendors"],
  "objects": []
}

{
  "run_group": "daily",
  "tasks": [
    {
      "type": "table_copy",
      "source_location": {
        ...
      },
      "target_location": {
        "asset": {
          "asset_name": null, // optional
          "location_name": "vendors-default"
        },
        "append": false
      },
      "active": true
    },
    ...
}
```

# 
```json
      "target_location": {
        "asset_name": null, // optional
        "location_name": "vendors-default",
        "append": false
      },
```