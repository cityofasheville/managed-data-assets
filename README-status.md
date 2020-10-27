# Dirs: 
assets                 This is the working dir that gets used in the program
other_locations        So far I am only porting jobs that go to MDA Store
problems               
successfully_tested
todo

## table changes
capital_projects_master: drop column communication_plan
coa_asheville_nieghborhoods: drop columns st_area_shape_ st_length_shape_
coa_cip_project_polygons, coa_cip_project_points, coa_cip_project_lines: All three of these tables have multiple changes (geo columns mostly?)
coa_national_register_properties: drop columns st_area_shape_ st_length_shape_

## defunct
coa_districts_zoning_test
coa_computer_assets.pub

## *.future files - have temp workarounds (eg pulling from mdastore1)
### We can't access Buncombe network from AWS yet
bc_civicaddress_table
bc_location
bc_property_account_master

### Maria DB not implemented
coa_computer_assets.pub
coa_computer_assets.ms1