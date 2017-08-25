-- Update mrc and water_district
UPDATE amd.coa_bc_address_master
SET 
	mrc = water_districts.mrc,
	water_district = water_districts.mrc
FROM (
	SELECT DISTINCT
		amd.bc_location.location_id, 
		amd.coa_districts_water.mrc
	FROM
		amd.bc_location
	LEFT JOIN 
		amd.coa_districts_water
	ON
		st_contains(amd.coa_districts_water.shape,amd.bc_location.shape)
) AS water_districts 
WHERE amd.coa_bc_address_master.location_id = water_districts.location_id;
