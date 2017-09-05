-- Update zoning
UPDATE amd.coa_bc_address_master
SET 
 zoning = zoningupdate.zoning_district
FROM (
	SELECT 
		amd.coa_bc_address_master.civicaddress_id,
		amd.coa_bc_address_master.property_pinnum,
		CASE
			WHEN zoning_districts.zoning_district IS NULL
			THEN 'No Zoning'
			ELSE zoning_districts.zoning_district
		END
	FROM 
		amd.coa_bc_address_master
	LEFT JOIN (
		SELECT
					bc_property.pinnum,
					string_agg(coa_districts_zoning.districts, ','  order by coa_districts_zoning.districts) as zoning_district
		FROM amd.bc_property, amd.coa_districts_zoning
		WHERE st_intersects(amd.coa_districts_zoning.shape,amd.bc_property.shape)
		GROUP BY amd.bc_property.pinnum
	) as zoning_districts
	ON
		amd.coa_bc_address_master.property_pinnum = zoning_districts.pinnum
 ) as zoningupdate
 where amd.coa_bc_address_master.civicaddress_id = zoningupdate.civicaddress_id;
