truncate public.coa_bc_address_master;

insert into public.coa_bc_address_master (
  objectid,
  civicaddress_id,
  address_x,
  address_y,
  address_full,
  longitude_wgs,
  latitude_wgs,
  address_number,
  address_unit,
  unit_type,
  address_street_prefix,
  address_street_name,
  address_street_type,
  address_street_postdirection,
  address_city,
  address_commcode,
  address_zipcode,
  location_type,
  address_change_date,
  maximo_type,
  maximo_seq_num,
  asset_code,
  jurisdiction_type,
  centerline_id,
  location_id,
  parent_location_id,
  property_pinnum,
  property_pin,
  property_pinext,
  property_nmptype,
  property_oldpinnum,
  property_update_date,
  property_update_reason,
  property_deeddate,
  property_taxyear,
  property_deedurl,
  property_platurl,
  property_propcardurl,
  property_acreage,
  property_class,
  property_improved,
  property_exempt,
  property_priced,
  property_totalmarketvalue,
  property_appraisedvalue,
  property_taxvalue,
  property_landuse,
  property_neighborhoodcode,
  property_landvalue,
  property_buildingvalue,
  property_improvementvalue,
  property_appraisalarea,
  property_condounit,
  property_condobuilding,
  property_subname,
  property_sublot,
  property_subblock,
  property_subsect,
  property_township,
  property_stamps,
  property_instrument,
  property_firedistrict,
  property_schooldistrict,
  owner_name,
  owner_house_number,
  owner_number_suffix,
  owner_direction,
  owner_street_name,
  owner_street_type,
  owner_careof,
  owner_address,
  owner_cityname,
  owner_state,
  owner_zipcode,
  owner_account_number,
  shape
)
  SELECT DISTINCT
        address_locations.objectid,
        address_locations.civicaddress_id,
        address_locations.address_x,
        address_locations.address_y,
        address_locations.address_full,
        ST_X(ST_TRANSFORM(address_locations.shape,4326)) AS longitude_wgs,
        ST_Y(ST_TRANSFORM(address_locations.shape,4326)) AS latitude_wgs,
        address_locations.address_number,
        address_locations.address_unit,
        address_locations.unit_type,
        address_locations.address_street_prefix,
        address_locations.address_street_name,
        address_locations.address_street_type,
        address_locations.address_street_postdirection,
        public.coa_zip_code.po_name as address_city,
        address_locations.address_commcode,
        address_locations.address_zipcode,
        address_locations.location_type,
        address_locations.address_change_date,
        'ADDR'::text as maximo_type,
        address_locations.civicaddress_id::int as maximo_seq_num,
        ('ADDR' || address_locations.civicaddress_id::int ) as asset_code,
        CASE
                WHEN active_jurisdictions.jurisdiction_type IS NULL
                THEN 'Buncombe County'
                ELSE active_jurisdictions.jurisdiction_type
        END,
        address_locations.centerline_id::bigint as centerline_id,
        address_locations.location_id as location_id,
        address_locations.parent_location_id as parent_location_id,
        public.bc_property.pinnum as property_pinnum,
        public.bc_property.pin as property_pin,
        public.bc_property.pinext as property_pinext,
        public.bc_property.nmptype as property_nmptype,
        public.bc_property.oldpinnum as property_oldpinnum,
        public.bc_property.updatedate as property_update_date,
        public.bc_property.reason as property_update_reason,
        public.bc_property.deeddate as property_deeddate,
        public.bc_property.taxyear as property_taxyear,
        public.bc_property.deedurl as property_deedurl,
        public.bc_property.platurl as property_platurl,
        public.bc_property.propcard as property_propcardurl,
        public.bc_property.acreage as property_acreage,
        public.bc_property.class as property_class,
        public.bc_property.improved as property_improved,
        public.bc_property.exempt as property_exempt,
        public.bc_property.priced as property_priced,
        public.bc_property.totalmarketvalue as property_totalmarketvalue,
        public.bc_property.appraisedvalue as property_appraisedvalue,
        public.bc_property.taxvalue as property_taxvalue,
        public.bc_property.landuse as property_landuse,
        public.bc_property.neighborhoodcode as property_neighborhoodcode,
        public.bc_property.landvalue as property_landvalue,
        public.bc_property.buildingvalue as property_buildingvalue,
        public.bc_property.improvementvalue as property_improvementvalue,
        public.bc_property.appraisalarea as property_appraisalarea,
        public.bc_property.condounit as property_condounit,
        public.bc_property.condobuilding as property_condobuilding,
        public.bc_property.subname as property_subname,
        public.bc_property.sublot as property_sublot,
        public.bc_property.subblock as property_subblock,
        public.bc_property.subsect as property_subsect,
        public.bc_property.township as property_township,
        public.bc_property.stamps as property_stamps,
        public.bc_property.instrument as property_instrument,
        public.bc_property.firedistrict as property_firedistrict,
        public.bc_property.schooldistrict as property_schooldistrict,
        public.bc_property_pinnum_formatted_owner_names.formatted_owner_name as owner_name,
        public.bc_property.housenumber as owner_house_number,
        public.bc_property.numbersuffix as owner_number_suffix,
        public.bc_property.direction as owner_direction,
        public.bc_property.streetname as owner_street_name,
        public.bc_property.streettype as owner_street_type,
        public.bc_property.careof as owner_careof,
        public.bc_property.address as owner_address,
        public.bc_property.cityname as owner_cityname,
        public.bc_property.state as owner_state,
        public.bc_property.zipcode as owner_zipcode,
        public.bc_property.accountnumber as owner_account_number,
        address_locations.shape
FROM
--Address attributes and the locations
(
        -- Combine the bc_civic_address_table atrribute data with address locations stored in bc_location
        SELECT DISTINCT
                row_number() over () as objectid,
                public.bc_civicaddress_table.civicaddress_id::int as civicaddress_id,
                public.bc_location.x_coord as address_x,
                public.bc_location.y_coord as address_y,
                public.bc_location.locationtype as location_type,
                public.bc_civicaddress_table.full_civic_address as address_full,
                public.bc_civicaddress_table.street_number as address_number,
                public.bc_civicaddress_table.unit as address_unit,
                public.bc_civicaddress_table.unit_type as unit_type,
                public.bc_civicaddress_table.street_prefix as address_street_prefix,
                public.bc_civicaddress_table.street_name as address_street_name,
                public.bc_civicaddress_table.street_type as address_street_type,
                public.bc_civicaddress_table.street_postdirection as address_street_postdirection,
                public.bc_civicaddress_table.commcode as address_commcode,
                public.bc_civicaddress_table.postal_code as address_zipcode,
                public.bc_civicaddress_table.change_date as address_change_date,
                public.bc_location.centerline_id::bigint as centerline_id,
                public.bc_civicaddress_table.location_id as location_id,
                CASE
                        WHEN public.bc_location.parent_location_id = 0
                        THEN NULL
                        ELSE public.bc_location.parent_location_id
                END,
                public.bc_civicaddress_table.pinext as pinext,
                public.bc_location.shape as shape
        FROM
                public.bc_civicaddress_table
        LEFT JOIN
                public.bc_location
        ON
                public.bc_civicaddress_table.location_id = public.bc_location.location_id
        WHERE public.bc_civicaddress_table.civicaddress_id != 0
) as address_locations
-- Get the pin from bc_property spatially if an address location is contained by the property boundary.
-- (The parcel_id field in bc_location should be the same is the pin in bc_property, but is not consistent, 
-- so we need to use the pin from bc_property instead. )
-- 5/20/2018: adding the row_number() bit to pick only the first, if there are multiple matches. Due to an
-- error at the County, there were a couple properties overlapping other properties. Note that there WILL
-- be multiple matches in the below BECAUSE of the row_number() - all matches with same pin, different pinext.
-- To test whether there are actual errors, delete the row_number() and see if there are distinct pins for the
-- same location_id (this is a validation test in the bc_property MDA).
LEFT JOIN
(
        SELECT location_id, pin, rn from (
                SELECT DISTINCT
                        public.bc_location.location_id,
                        public.bc_property.pin,
                        row_number() over (partition by location_id ORDER BY pin) as rn
                FROM
                        public.bc_location
                LEFT JOIN
                        public.bc_property
                ON
                        st_contains(public.bc_property.shape,public.bc_location.shape)
        ) AS tmp WHERE rn = 1
) as property_location -- 133258 rows retrieved, 102508 distinct pins
ON
        address_locations.location_id = property_location.location_id
-- Get property attributes: Use the pin and pinext join bc_property to the address locations
LEFT JOIN
        public.bc_property
ON
        property_location.pin = bc_property.pin
        AND
        address_locations.pinext = bc_property.pinext
-- Get the property owners name with proper formatting: Use the pin and pinext join bc_property_pinnum_formatted_owner_names to the address locations
LEFT JOIN
        public.bc_property_pinnum_formatted_owner_names
ON
        property_location.pin ||  address_locations.pinext = public.bc_property_pinnum_formatted_owner_names.pinnum
-- Get the address city name from the zip code table
LEFT JOIN
        public.coa_zip_code
ON
        address_locations.address_zipcode = public.coa_zip_code.zip::int
-- Get jurisdication information for an address location
-- (See CASE statement in SELECT statement above for more details.)
LEFT JOIN
(
        SELECT DISTINCT
                public.bc_location.location_id,
                public.coa_active_jurisdictions.jurisdiction_type
        FROM
                public.bc_location
        LEFT JOIN
                public.coa_active_jurisdictions
        ON
                st_contains(public.coa_active_jurisdictions.shape,public.bc_location.shape)
) as active_jurisdictions
ON
        address_locations.location_id = active_jurisdictions.location_id
order by objectid asc
