-- internal.bc_location definition

-- Drop table

-- DROP TABLE internal.bc_location;

CREATE TABLE internal.bc_location (
	objectid int4 NULL,
	location_id float8 NULL,
	locationtype int4 NULL,
	civicaddress_id float8 NULL,
	parent_location_id float8 NULL,
	building_id float8 NULL,
	centerline_id float8 NULL,
	user_id varchar(8) NULL,
	esn int2 NULL,
	x_coord float8 NULL,
	y_coord float8 NULL,
	commcode varchar(4) NULL,
	primary_structure int2 NULL,
	create_date timestamp NULL,
	change_date timestamp NULL,
	parcel_id varchar(10) NULL,
	shape tiger.geometry NULL
);
CREATE INDEX a52_ix1 ON internal.bc_location USING gist (shape);
CREATE INDEX r61_sde_rowid_uk ON internal.bc_location USING btree (objectid) WITH (fillfactor='75');

-- internal2.bc_location definition

-- Drop table

-- DROP TABLE internal.bc_location CASCADE;

CREATE TABLE internal.bc_location (
	objectid int4 NOT NULL,
	location_id float8 NULL,
	locationtype int4 NULL,
	civicaddress_id float8 NULL,
	parent_location_id float8 NULL,
	building_id float8 NULL,
	centerline_id float8 NULL,
	user_id bpchar(8) NULL,
	esn int2 NULL,
	x_coord float8 NULL,
	y_coord float8 NULL,
	commcode bpchar(4) NULL,
	primary_structure int2 NULL,
	create_date date NULL,
	change_date date NULL,
	parcel_id bpchar(10) NULL,
	shape tiger.geometry(POINT, 2264) NULL,
	gdb_geomattr_data bytea NULL
);
CREATE INDEX a52_ix1 ON internal.bc_location USING gist (shape);

--------
-- internal.coa_bc_address_test source

CREATE OR REPLACE VIEW internal.coa_bc_address_test
AS SELECT DISTINCT address_locations.objectid,
    address_locations.civicaddress_id,
    address_locations.address_x,
    address_locations.address_y,
    address_locations.address_full,
    st_x(st_transform(address_locations.shape, 4326)) AS longitude_wgs,
    st_y(st_transform(address_locations.shape, 4326)) AS latitude_wgs,
    address_locations.address_number,
    address_locations.address_unit,
    address_locations.unit_type,
    address_locations.address_street_prefix,
    address_locations.address_street_name,
    address_locations.address_street_type,
    address_locations.address_street_postdirection,
    coa_zip_code.po_name AS address_city,
    address_locations.address_commcode,
    address_locations.address_zipcode,
    address_locations.location_type,
    address_locations.address_change_date,
    'ADDR'::text AS maximo_type,
    address_locations.civicaddress_id AS maximo_seq_num,
    'ADDR'::text || address_locations.civicaddress_id AS asset_code,
        CASE
            WHEN active_jurisdictions.jurisdiction_type IS NULL THEN 'Buncombe County'::character varying
            ELSE active_jurisdictions.jurisdiction_type
        END AS jurisdiction_type,
    address_locations.centerline_id,
    address_locations.location_id,
    address_locations.parent_location_id,
    bc_property.pinnum AS property_pinnum,
    bc_property.pin AS property_pin,
    bc_property.pinext AS property_pinext,
    bc_property.nmptype AS property_nmptype,
    bc_property.oldpinnum AS property_oldpinnum,
    bc_property.updatedate AS property_update_date,
    bc_property.reason AS property_update_reason,
    bc_property.deeddate AS property_deeddate,
    bc_property.taxyear AS property_taxyear,
    bc_property.deedurl AS property_deedurl,
    bc_property.platurl AS property_platurl,
    bc_property.propcard AS property_propcardurl,
    bc_property.acreage AS property_acreage,
    bc_property.class AS property_class,
    bc_property.improved AS property_improved,
    bc_property.exempt AS property_exempt,
    bc_property.priced AS property_priced,
    bc_property.totalmarketvalue AS property_totalmarketvalue,
    bc_property.appraisedvalue AS property_appraisedvalue,
    bc_property.taxvalue AS property_taxvalue,
    bc_property.landuse AS property_landuse,
    bc_property.neighborhoodcode AS property_neighborhoodcode,
    bc_property.landvalue AS property_landvalue,
    bc_property.buildingvalue AS property_buildingvalue,
    bc_property.improvementvalue AS property_improvementvalue,
    bc_property.appraisalarea AS property_appraisalarea,
    bc_property.condounit AS property_condounit,
    bc_property.condobuilding AS property_condobuilding,
    bc_property.subname AS property_subname,
    bc_property.sublot AS property_sublot,
    bc_property.subblock AS property_subblock,
    bc_property.subsect AS property_subsect,
    bc_property.township AS property_township,
    bc_property.stamps AS property_stamps,
    bc_property.instrument AS property_instrument,
    bc_property.firedistrict AS property_firedistrict,
    bc_property.schooldistrict AS property_schooldistrict,
    bc_property_pinnum_formatted_owner_names.formatted_owner_name AS owner_name,
    bc_property.housenumber AS owner_house_number,
    bc_property.numbersuffix AS owner_number_suffix,
    bc_property.direction AS owner_direction,
    bc_property.streetname AS owner_street_name,
    bc_property.streettype AS owner_street_type,
    bc_property.careof AS owner_careof,
    bc_property.address AS owner_address,
    bc_property.cityname AS owner_cityname,
    bc_property.state AS owner_state,
    bc_property.zipcode AS owner_zipcode,
    bc_property.accountnumber AS owner_account_number,
    address_locations.shape
   FROM ( SELECT DISTINCT row_number() OVER () AS objectid,
            bc_civicaddress_table.civicaddress_id::integer AS civicaddress_id,
            bc_location.x_coord AS address_x,
            bc_location.y_coord AS address_y,
            bc_location.locationtype AS location_type,
            bc_civicaddress_table.full_civic_address AS address_full,
            bc_civicaddress_table.street_number AS address_number,
            bc_civicaddress_table.unit AS address_unit,
            bc_civicaddress_table.unit_type,
            bc_civicaddress_table.street_prefix AS address_street_prefix,
            bc_civicaddress_table.street_name AS address_street_name,
            bc_civicaddress_table.street_type AS address_street_type,
            bc_civicaddress_table.street_postdirection AS address_street_postdirection,
            bc_civicaddress_table.commcode AS address_commcode,
            bc_civicaddress_table.postal_code AS address_zipcode,
            bc_civicaddress_table.change_date AS address_change_date,
            bc_location.centerline_id::bigint AS centerline_id,
            bc_civicaddress_table.location_id,
                CASE
                    WHEN bc_location.parent_location_id = 0::double precision THEN NULL::double precision
                    ELSE bc_location.parent_location_id
                END AS parent_location_id,
            bc_civicaddress_table.pinext,
            bc_location.shape
           FROM internal.bc_civicaddress_table
             LEFT JOIN internal.bc_location ON bc_civicaddress_table.civicaddress_id = bc_location.civicaddress_id
          WHERE bc_civicaddress_table.civicaddress_id <> 0::double precision) address_locations
     LEFT JOIN ( SELECT tmp.location_id,
            tmp.pin,
            tmp.rn
           FROM ( SELECT DISTINCT bc_location.location_id,
                    bc_property_1.pin,
                    row_number() OVER (PARTITION BY bc_location.location_id ORDER BY bc_property_1.pin) AS rn
                   FROM internal.bc_location
                     LEFT JOIN internal.bc_property bc_property_1 ON st_contains(bc_property_1.shape, bc_location.shape)) tmp
          WHERE tmp.rn = 1) property_location ON address_locations.location_id = property_location.location_id
     LEFT JOIN internal.bc_property ON property_location.pin::text = bc_property.pin::text AND address_locations.pinext::text = bc_property.pinext::text
     LEFT JOIN internal.bc_property_pinnum_formatted_owner_names ON (property_location.pin::text || address_locations.pinext::text) = bc_property_pinnum_formatted_owner_names.pinnum::text
     LEFT JOIN internal.coa_zip_code ON address_locations.address_zipcode = coa_zip_code.zip::integer
     LEFT JOIN ( SELECT DISTINCT bc_location.location_id,
            coa_active_jurisdictions.jurisdiction_type
           FROM internal.bc_location
             LEFT JOIN internal.coa_active_jurisdictions ON st_contains(coa_active_jurisdictions.shape, bc_location.shape)) active_jurisdictions ON address_locations.location_id = active_jurisdictions.location_id
  ORDER BY address_locations.objectid;