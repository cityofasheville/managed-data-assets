## NC Benchmarking

### Assets
 
```json
{
  "name": "PerformanceMeasure"
  "type": "table",
  "depends": [
    "#SOGBenchmark"  // dynamic dependency
  ],
}
```

```json
{
  "name": "SOGBenchmark"
  "type": "aggregation",
  "aggregates": [    // <=???
    "purchased_water_volume",
    "finished_water_volume",
    "billed_water_volume",
    "max_water_turbidity",
  ],
}
```

```json
{
  "name": "purchased_water_volume",
  "type": "spreadsheet",
  "active": true,
  "description": "Water purchased from other sources, in millions of gallons per day (MGD).",
  "short_name":	"purchased_water_volume",
  "display_name":	"MGD of Purchased Water",
  "type":	"pm",
  "department":	"Water",
  "contact":"Brenna Cook",
  "contact_email":	"bcook@ashevillenc.gov",
  "period":	"fiscal_year",
  "units":	"mgd",
  "notes":	"",
  "service_category":	"Water production and distribution system",
  "strategic_category":	"A Clean & Healthy Environment, A Well-Planned & Livable Community",
  "tags":	"SOGBenchmark",    // <=???
  "dependencies": []
}
```


## Notes
noop clutters our data