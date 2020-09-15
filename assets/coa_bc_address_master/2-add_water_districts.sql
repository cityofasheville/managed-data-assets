-- Update mrc and water_district
UPDATE r_it.coa_bc_address_master
SET 
	mrc = water_districts.mrc,
	water_district = water_districts.mrc
FROM (
	SELECT DISTINCT
		r_it.bc_location.location_id, 
		r_it.coa_districts_water.mrc
	FROM
		r_it.bc_location
	LEFT JOIN 
		r_it.coa_districts_water
	ON
		st_contains(r_it.coa_districts_water.shape,r_it.bc_location.shape)
) AS water_districts 
WHERE r_it.coa_bc_address_master.location_id = water_districts.location_id;
