-- Update zoning in coa_bc_address_master2
UPDATE r_it.coa_bc_address_master
SET zoning = zoningupdate.zoning_district,
	zoning_links = zoningupdate.zoning_links
FROM (
	SELECT 
  r_it.coa_bc_address_master.civicaddress_id,
  r_it.coa_bc_address_master.property_pinnum,
  CASE
    WHEN zoning_districts.zoning_district IS NULL
    THEN 'No Zoning'
    ELSE zoning_districts.zoning_district
  end,
  zoning_districts.zoning_links
	FROM r_it.coa_bc_address_master
	LEFT JOIN (
		SELECT bc_property.pinnum, 
		string_agg(coa_districts_zoning.districts || 
			CASE coa_districts_zoning.type 
			WHEN 'CZ' THEN ' CZ' 
			WHEN 'CUP' THEN ' CUP' 
			ELSE '' END , ','  
			order by coa_districts_zoning.districts) as zoning_district,
		string_agg(coa_districts_zoning.hyperlink, ','  
			order by coa_districts_zoning.districts) as zoning_links	
		FROM r_it.bc_property, r_it.coa_districts_zoning
		WHERE st_intersects(r_it.coa_districts_zoning.shape,r_it.bc_property.shape)
		GROUP BY r_it.bc_property.pinnum
	) as zoning_districts
	ON
		r_it.coa_bc_address_master.property_pinnum = zoning_districts.pinnum
 ) as zoningupdate
 where r_it.coa_bc_address_master.civicaddress_id = zoningupdate.civicaddress_id;
