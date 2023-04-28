Aggregates (asset group) don't solve the idempotent problem with NC Benchmarking.

I need hundreds of table_copy actions as one big transaction.

temp table?


new transacription prob: table_copy as one step might time out
related to current challenge: multi steps - coa_bc_address_master


Eric says:
Ha! Was just telling Cameron about the Bedrock conversation this morning and stumbled on the use case for my double hashtag. And it might help with the transaction thing in some way.

Right now we have 257 NC Benchmark metrics, but they're grouped into 9 different departments, each with its own spreadsheet. So probably the way to code the overall asset_group is to make it an asset_group of asset_groups, with the deeper-level groups defined, e.g., by #ncbenchmark#fire
While it doesn't solve the transaction problem, it does give us a way to at least break things up more naturally into sub-jobs that won't exceed lambda runtime limits

We still have the existing transaction issue and it would be better if a table-copy of an asset_group automatically broke the job up according to sub-asset_groups on its own rather than encoding it explicitly in the ETL tasks, so still need to think that all through