-- Update mrc and water_district
UPDATE ericjackson.coa_bc_address_master
SET 
	mrc = water_districts.mrc,
	water_district = water_districts.mrc
FROM (
	SELECT DISTINCT
		coagis.bc_location.location_id, 
		coagis.coa_districts_water.mrc
	FROM
		coagis.bc_location
	LEFT JOIN 
		coagis.coa_districts_water
	ON
		st_contains(coagis.coa_districts_water.shape,coagis.bc_location.shape)
) AS water_districts 
WHERE ericjackson.coa_bc_address_master.location_id = water_districts.location_id;
