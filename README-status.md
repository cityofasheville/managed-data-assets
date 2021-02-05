

## table changes
coa_districts_water: different rows in postgres and postgis Solution, pull from wh

capital_projects_master: drop column communication_plan <= ALL NULL
coa_asheville_nieghborhoods: drop columns st_area_shape_ st_length_shape_ <= ALL NULL
coa_cip_project_polygons: reorder columns
coa_cip_project_points: add 8 columns:
	gdb_geomattr_data bytea
	project_number varchar(50)
	inspector varchar(50)
	warranty_end timestamp
	project_link varchar(300)
	project_description varchar(1000)
	map_link varchar(300)
	department varchar(30)
coa_cip_project_lines: reorder columns

(SOLVED: These do not exist in DB, they are PostGIS. I have recreated with views and GIS functions.)
coa_national_register_properties:  drop columns st_area_shape_ st_length_shape_ 
coa_zoning_overlays             : drop columns st_area_shape_ st_length_shape_

general_ledger_parameters: add 6 columns:
	excludeunpostedcredits bool 
	createcfwdbua bool 
	departmentsegment bpchar(1) 
	functionsegment bpchar(1) 
	multiennialstartyear int4 
	multiennialclosesallowed int4 NULL

pr_employee_info: drop column:
	hire_date timestamp (  but data is all null -> hire_date_last )
                add 15 columns:
    gender bpchar(1) 
	race bpchar(2) 
	eth_hispanic varchar(1) 
	eth_amer_ind varchar(1) 
	eth_asian varchar(1) 
	eth_black varchar(1) 
	eth_hawaiin varchar(1) 
	eth_white varchar(1) 
	hire_date_original timestamp 
	hire_date_last timestamp 
	term_date_last timestamp 
	years_of_service_est numeric(8,2) 
	age numeric(8,2) 
	age_at_hire numeric(8,2) 
	age_at_term numeric(8,2)

coa_active_jurisdictions: drop column gdb_geomattr_data but data is all null (could create view with null?)

bc_property(steepslope): reorder columns

bc_property: drop gdb_geomattr_data but data is all null (could create view with null?)
bc_location: add gdb_geomattr_data






## problems

### (MySQL) Maria DB not implemented
coa_computer_assets.ms1





## AFTER TESTING:
Make changes to tables in internal

 change all internal2. to internal.
 change 3 steepslope tables from mdastore1 to steepslope connection (bc_incorporated_areas, coa_active_jurisdictions, bc_property)
 change bc2. to bc.
 change smarking2. to smarking.