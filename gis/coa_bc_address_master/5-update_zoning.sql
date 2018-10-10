-- Update zoning
UPDATE public.coa_bc_address_master
SET 
 zoning = zoningupdate.zoning_district
FROM (
	SELECT 
		public.coa_bc_address_master.civicaddress_id,
		public.coa_bc_address_master.property_pinnum,
		CASE
			WHEN zoning_districts.zoning_district IS NULL
			THEN 'No Zoning'
			ELSE zoning_districts.zoning_district
		END
	FROM 
		public.coa_bc_address_master
	LEFT JOIN (
		SELECT
					bc_property.pinnum,
					string_agg(coa_districts_zoning.districts, ','  order by coa_districts_zoning.districts) as zoning_district
		FROM public.bc_property, public.coa_districts_zoning
		WHERE st_intersects(public.coa_districts_zoning.shape,public.bc_property.shape)
		GROUP BY public.bc_property.pinnum
	) as zoning_districts
	ON
		public.coa_bc_address_master.property_pinnum = zoning_districts.pinnum
 ) as zoningupdate
 where public.coa_bc_address_master.civicaddress_id = zoningupdate.civicaddress_id;
