-- Update mrc and water_district
UPDATE internal2.coa_bc_address_master
SET 
	mrc = water_districts.mrc,
	water_district = water_districts.mrc
FROM (
	SELECT DISTINCT
		internal2.bc_location.location_id, 
		internal2.coa_districts_water.mrc
	FROM
		internal2.bc_location
	LEFT JOIN 
		internal2.coa_districts_water
	ON
		st_contains(internal2.coa_districts_water.shape,internal2.bc_location.shape)
) AS water_districts 
WHERE internal2.coa_bc_address_master.location_id = water_districts.location_id;
