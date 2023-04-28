## NC Benchmarking

### ETL

```json
{
  "run_group": "monthly",
  "tasks": [
    {
      "type": "table_copy",
      "source_locations": [
        {
          "filename": "water_sog_benchmarks",
          "connection": "bedrock-googlesheets",
          "spreadsheetid": "1m2xD4JyH4BEBey_ybsEgrvYopsl0PjWNmY_PEv3l6D",
          "range": "A2:D",
          "sheets" [
            "purchased_water_volume",
            "finished_water_volume",
            "billed_water_volume",
            "max_water_turbidity",
            "etc"
          ]
        },
        {
          "etc": "etc"
        }
      ],
      "target_location": {
        "connection": "pubrecdb1/mdastore1/dbadmin",
        "schemaname": "internal",
        "tablename": "performance_measures"
      }   
    }
    "active": true
  ],
}
```

## note
Each sheet name would be used as the short_name in the table

## steps
It can't just call other etl types:
- clear table (sql)
- append each (table_copy) Note: dbs dont have append option yet
because that would break the promise of no halfway loads.