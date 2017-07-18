-- Update zoning
UPDATE ericjackson.coa_bc_address_master
SET 
 zoning = zoningupdate.zoning_district
FROM (
	SELECT 
		ericjackson.coa_bc_address_master.civicaddress_id,
		ericjackson.coa_bc_address_master.property_pinnum,
		CASE
			WHEN zoning_districts.zoning_district IS NULL
			THEN 'No Zoning'
			ELSE zoning_districts.zoning_district
		END
	FROM 
		ericjackson.coa_bc_address_master
	LEFT JOIN (
		SELECT
					bc_property.pinnum,
					string_agg(coa_districts_zoning.districts, ','  order by coa_districts_zoning.districts) as zoning_district
		FROM coagis.bc_property, coagis.coa_districts_zoning
		WHERE st_intersects(coagis.coa_districts_zoning.shape,coagis.bc_property.shape)
		GROUP BY coagis.bc_property.pinnum
	) as zoning_districts
	ON
		ericjackson.coa_bc_address_master.property_pinnum = zoning_districts.pinnum
 ) as zoningupdate
 where ericjackson.coa_bc_address_master.civicaddress_id = zoningupdate.civicaddress_id;
