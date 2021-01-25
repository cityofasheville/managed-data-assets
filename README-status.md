

## table changes
capital_projects_master: drop column communication_plan
coa_asheville_nieghborhoods: drop columns st_area_shape_ st_length_shape_
coa_cip_project_polygons, coa_cip_project_points, coa_cip_project_lines: All three of these tables have multiple changes (geo columns mostly?)
coa_national_register_properties: drop columns st_area_shape_ st_length_shape_
coa_zoning_overlays             : drop columns st_area_shape_ st_length_shape_
general_ledger_parameters: many changes
pr_employee_info: many new fields, hire_date renamed
coa_active_jurisdictions: field order? drop column gdb_geomattr_data
bc_property(steepslope): reorder columns
bc_property: drop gdb_geomattr_data
bc_location: add gdb_geomattr_datas






## problems

### (MySQL) Maria DB not implemented
coa_computer_assets.ms1





## AFTER TESTING:
Make changes to tables in internal

 change all internal2. to internal.
 change 3 steepslope tables from mdastore1 to steepslope connection (bc_incorporated_areas, coa_active_jurisdictions, bc_property)
 change bc2. to bc.
 change smarking2. to smarking.