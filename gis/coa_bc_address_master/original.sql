SELECT DISTINCT
	address_locations.objectid,
	address_locations.civicaddress_id,
	address_locations.address_x,
	address_locations.address_y,
	address_locations.address_full,
	ST_X(ST_TRANSFORM(address_locations.shape,4326)) AS longitude,
	ST_Y(ST_TRANSFORM(address_locations.shape,4326)) AS lattitude,
	address_locations.address_number,
	address_locations.address_unit,
	address_locations.address_street_prefix,
	address_locations.address_street_name,
	address_locations.address_street_type,
	address_locations.address_street_postdirection,
	coagis.coa_zip_code.po_name as address_city,
	address_locations.address_commcode,
	address_locations.address_zipcode,
	address_locations.location_type,
	address_locations.address_change_date,
	'ADDR'::text as maximo_type,
	address_locations.civicaddress_id::int as maximo_seq_num,
	('ADDR' || address_locations.civicaddress_id::int ) as asset_code,
	water_districts.mrc as mrc,
	water_districts.mrc as water_district,
	public_works_districts.truckday as trash_pickup_day,
	CASE
		WHEN active_jurisdictions.jurisdiction_type IS NULL
		THEN 'Buncombe County'
		ELSE active_jurisdictions.jurisdiction_type
	END,
	address_locations.centerline_id::bigint as centerline_id,
	address_locations.location_id as location_id,
	address_locations.parent_location_id as parent_location_id,
	coagis.bc_property.pinnum as property_pinnum,
	coagis.bc_property.pin as property_pin,
	coagis.bc_property.pinext as property_pinext,
	coagis.bc_property.nmptype as property_nmptype,
	coagis.bc_property.oldpinnum as property_oldpinnum,
	coagis.bc_property.updatedate as property_update_date,
	coagis.bc_property.reason as property_update_reason,
	coagis.bc_property.deeddate as property_deeddate,
	coagis.bc_property.taxyear as property_taxyear,
	coagis.bc_property.deedurl as property_deedurl,
	coagis.bc_property.platurl as property_platurl,
	coagis.bc_property.propcard as property_propcardurl,
	coagis.bc_property.acreage as property_acreage,
	coagis.bc_property.class as property_class,
	coagis.bc_property.improved as property_improved,
	coagis.bc_property.exempt as property_exempt,
	coagis.bc_property.priced as property_priced,
	coagis.bc_property.totalmarketvalue as property_totalmarketvalue,
	coagis.bc_property.appraisedvalue as property_appraisedvalue,
	coagis.bc_property.taxvalue as property_taxvalue,
	coagis.bc_property.landuse as property_landuse,
	coagis.bc_property.neighborhoodcode as property_neighborhoodcode,
	coagis.bc_property.landvalue as property_landvalue,
	coagis.bc_property.buildingvalue as property_buildingvalue,
	coagis.bc_property.improvementvalue as property_improvementvalue,
	coagis.bc_property.appraisalarea as property_appraisalarea,
	coagis.bc_property.condounit as property_condounit,
	coagis.bc_property.condobuilding as property_condobuilding,
	coagis.bc_property.subname as property_subname,
	coagis.bc_property.sublot as property_sublot,
	coagis.bc_property.subblock as property_subblock,
	coagis.bc_property.subsect as property_subsect,
	coagis.bc_property.township as property_township,
	coagis.bc_property.stamps as property_stamps,
	coagis.bc_property.instrument as property_instrument,
	coagis.bc_property.firedistrict as property_firedistrict,
	coagis.bc_property.schooldistrict as property_schooldistrict,
	coagis.bc_property_pinnum_formatted_owner_names.formatted_owner_name as owner_name,
	coagis.bc_property.housenumber as owner_house_number,
	coagis.bc_property.numbersuffix as owner_number_suffix,
	coagis.bc_property.direction as owner_direction,
	coagis.bc_property.streetname as owner_street_name,
	coagis.bc_property.streettype as owner_street_type,
	coagis.bc_property.careof as owner_careof,
	coagis.bc_property.address as owner_address,
	coagis.bc_property.cityname as owner_cityname,
	coagis.bc_property.state as owner_state,
	coagis.bc_property.zipcode as owner_zipcode,
	coagis.bc_property.accountnumber as owner_account_number,
	address_locations.shape
FROM
--Address attributes and the locations
(
	-- Combine the bc_civic_address_table atrribute data with address locations stored in bc_location
	SELECT DISTINCT
		row_number() over () as objectid,
		coagis.bc_civicaddress_table.civicaddress_id::int as civicaddress_id,
		coagis.bc_location.x_coord as address_x,
		coagis.bc_location.y_coord as address_y,
		coagis.bc_civicaddress_table.full_civic_address as address_full,
		coagis.bc_civicaddress_table.street_number as address_number,
		coagis.bc_civicaddress_table.unit as address_unit,
		coagis.bc_civicaddress_table.street_prefix as address_street_prefix,
		coagis.bc_civicaddress_table.street_name as address_street_name,
		coagis.bc_civicaddress_table.street_type as address_street_type,
		coagis.bc_civicaddress_table.street_postdirection as address_street_postdirection,
		coagis.bc_civicaddress_table.commcode as address_commcode,
		coagis.bc_civicaddress_table.postal_code as address_zipcode,
		coagis.bc_civicaddress_table.unit_type as location_type,
		coagis.bc_civicaddress_table.change_date as address_change_date,
		coagis.bc_location.centerline_id::bigint as centerline_id,
		coagis.bc_civicaddress_table.location_id as location_id,
		CASE
			WHEN coagis.bc_location.parent_location_id = 0
			THEN NULL
			ELSE coagis.bc_location.parent_location_id
		END,
		coagis.bc_civicaddress_table.pinext as pinext,
		coagis.bc_location.shape as shape
	FROM 
		coagis.bc_civicaddress_table
	LEFT JOIN
		coagis.bc_location
	ON
		coagis.bc_civicaddress_table.location_id = coagis.bc_location.location_id
	WHERE coagis.bc_civicaddress_table.civicaddress_id != 0
) as address_locations
-- Get the pin from bc_property spatially if an address location is contained by the property boundary. 
-- (The parcel_id field in bc_location should be the same is the pin in bc_property, but is not consistent, so we need to use the pin from bc_property instead. )
LEFT JOIN
(
	SELECT DISTINCT
		coagis.bc_location.location_id, 
		coagis.bc_property.pin
	FROM
		coagis.bc_location
	LEFT JOIN 
		coagis.bc_property
	ON
		st_contains(coagis.bc_property.shape,coagis.bc_location.shape)
) as property_location -- 133258 rows retrieved, 102508 distinct pins
ON 
	address_locations.location_id = property_location.location_id
-- Get property attributes: Use the pin and pinext join bc_property to the address locations
LEFT JOIN 
	coagis.bc_property
ON 
	property_location.pin = bc_property.pin 
	AND 
	address_locations.pinext = bc_property.pinext
-- Get the property owners name with proper formatting: Use the pin and pinext join bc_property_pinnum_formatted_owner_names to the address locations
LEFT JOIN 
	coagis.bc_property_pinnum_formatted_owner_names
ON 
	property_location.pin ||  address_locations.pinext = coagis.bc_property_pinnum_formatted_owner_names.pinnum
-- Get the address city name from the zip code table
LEFT JOIN 
	coagis.coa_zip_code
ON 
	address_locations.address_zipcode = coagis.coa_zip_code.zip::int
-- Get jurisdication information for an address location
-- (See CASE statement in SELECT statement above for more details.)
LEFT JOIN
(
	SELECT DISTINCT
		coagis.bc_location.location_id, 
		coagis.coa_active_jurisdictions.jurisdiction_type
	FROM
		coagis.bc_location
	LEFT JOIN 
		coagis.coa_active_jurisdictions
	ON
		st_contains(coagis.coa_active_jurisdictions.shape,coagis.bc_location.shape)
) as active_jurisdictions 
ON 
	address_locations.location_id = active_jurisdictions.location_id
-- Get water service area information for an address location
LEFT JOIN
(
	SELECT DISTINCT
		coagis.bc_location.location_id, 
		coagis.coa_districts_water.mrc
	FROM
		coagis.bc_location
	LEFT JOIN 
		coagis.coa_districts_water
	ON
		st_contains(coagis.coa_districts_water.shape,coagis.bc_location.shape)
) as water_districts 
ON 
	address_locations.location_id = water_districts.location_id
-- Get trash pickup information for an address location
LEFT JOIN
(
	SELECT DISTINCT
		coagis.bc_location.location_id, 
		coagis.coa_districts_public_works.truckday
	FROM
		coagis.bc_location
	LEFT JOIN 
		coagis.coa_districts_public_works
	ON
		st_contains(coagis.coa_districts_public_works.shape,coagis.bc_location.shape)
) as public_works_districts 
ON 
	address_locations.location_id = public_works_districts.location_id
