### new format?
```json
{
  "run_group": "monthly",
  "tasks": [
    {
      "type": "table_copy",
      "source_location": {
        "aggregate": [
          "asset_name": "#SOGBenchmark"
        ]
      },
      "target_location": {
        "asset_name": "performance_measures"
      }   
    }
    "active": true
  ],
}
```