-- Update mrc and water_district
UPDATE public.coa_bc_address_master
SET 
	mrc = water_districts.mrc,
	water_district = water_districts.mrc
FROM (
	SELECT DISTINCT
		public.bc_location.location_id, 
		public.coa_districts_water.mrc
	FROM
		public.bc_location
	LEFT JOIN 
		public.coa_districts_water
	ON
		st_contains(public.coa_districts_water.shape,public.bc_location.shape)
) AS water_districts 
WHERE public.coa_bc_address_master.location_id = water_districts.location_id;
