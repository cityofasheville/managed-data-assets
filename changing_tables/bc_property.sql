DROP TABLE internal2.bc_property cascade;
CREATE TABLE internal2.bc_property (
	objectid int4 NOT NULL,
	pinnum varchar(50) NULL,
	pin varchar(15) NULL,
	pinext varchar(50) NULL,
	"owner" varchar(50) NULL,
	nmptype varchar(150) NULL,
	taxyear varchar(50) NULL,
	condounit varchar(50) NULL,
	condobuilding varchar(50) NULL,
	deedbook varchar(50) NULL,
	deedpage varchar(50) NULL,
	platbook varchar(50) NULL,
	platpage varchar(50) NULL,
	subname varchar(50) NULL,
	sublot varchar(50) NULL,
	subblock varchar(50) NULL,
	subsect varchar(50) NULL,
	updatedate varchar(50) NULL,
	housenumber varchar(50) NULL,
	numbersuffix varchar(50) NULL,
	direction varchar(50) NULL,
	streetname varchar(50) NULL,
	streettype varchar(50) NULL,
	township varchar(50) NULL,
	acreage numeric(38,8) NULL,
	accountnumber varchar(50) NULL,
	deeddate varchar(50) NULL,
	stamps numeric(38,8) NULL,
	instrument varchar(50) NULL,
	reason varchar(50) NULL,
	county varchar(50) NULL,
	city varchar(50) NULL,
	firedistrict varchar(50) NULL,
	schooldistrict varchar(50) NULL,
	careof varchar(50) NULL,
	address varchar(50) NULL,
	cityname varchar(50) NULL,
	state varchar(50) NULL,
	zipcode varchar(50) NULL,
	"class" varchar(50) NULL,
	improved varchar(50) NULL,
	exempt varchar(50) NULL,
	priced varchar(50) NULL,
	totalmarketvalue numeric(38,8) NULL,
	appraisedvalue numeric(38,8) NULL,
	taxvalue numeric(38,8) NULL,
	landuse varchar(50) NULL,
	neighborhoodcode varchar(50) NULL,
	landvalue numeric(38,8) NULL,
	buildingvalue numeric(38,8) NULL,
	improvementvalue numeric(38,8) NULL,
	appraisalarea varchar(50) NULL,
	state_route varchar(50) NULL,
	state_route_suffix varchar(50) NULL,
	propcard varchar(150) NULL,
	oldpinnum varchar(50) NULL,
	citystatezip varchar(50) NULL,
	shape geometry NULL,
	deedurl varchar(254) NULL,
	platurl varchar(254) NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_bc_property PRIMARY KEY (objectid)
);
CREATE INDEX a251_ix1 ON internal2.bc_property USING gist (shape);

--------------------------
-- simplicity.v_simplicity_properties source

CREATE OR REPLACE VIEW simplicity.v_simplicity_properties
AS SELECT a.pin,
    a.pinext,
    a.pinnum,
    b.address_full AS address,
    a.exempt,
    a.acreage,
    a.owner,
    b.address_city AS cityname,
    b.address_zipcode AS zipcode,
    a.totalmarketvalue,
    a.appraisedvalue,
    a.taxvalue,
    a.landvalue,
    a.buildingvalue,
    a.propcard,
    a.deedurl,
    a.platurl,
    a.appraisalarea,
    b.nbrhd_name AS neighborhoodcode,
    a.shape,
    b.civicaddress_id,
    b.latitude_wgs,
    b.longitude_wgs,
    b.zoning,
    b.jurisdiction_type,
    b.owner_address,
    b.location_type,
    st_astext(st_transform(a.shape, 4326)) AS polygon,
    b.historic_district,
    b.local_landmark
   FROM internal2.bc_property a
     LEFT JOIN internal2.coa_bc_address_master b ON a.pin::text = b.property_pin::text AND a.pinext::text = b.property_pinext::text
  WHERE b.location_type = 1 OR b.location_type = 0 OR b.location_type = 4;

CREATE OR REPLACE FUNCTION simplicity.get_properties_along_streets(cid numeric[], ldist numeric)
 RETURNS SETOF simplicity.v_simplicity_properties
 LANGUAGE plpgsql
AS $function$

DECLARE
    r simplicity.v_simplicity_properties%rowtype;
BEGIN
	for i in 1..array_length(cid,1) loop
    	FOR r IN
    		SELECT A.pin,
                    A.pinext,
                    A.pinnum,
                    A.address,
                    A.exempt,
                    A.acreage,
                    A.owner,
                    A.cityname,
                    A.zipcode,
                    A.totalmarketvalue,
                    A.appraisedvalue,
                    A.taxvalue,
                    A.landvalue,
                    A.buildingvalue,
                    A.propcard,
                    A.deedurl,
                    A.platurl,
                    A.appraisalarea,
                    A.neighborhoodcode,
                    A.shape,
                    A.civicaddress_id,
                    A.latitude_wgs,
                    A.longitude_wgs,
                    A.zoning,
					A.jurisdiction_type,
                    A.owner_address,
                    A.location_type,
                    A.polygon,
					A.historic_district,
					A.local_landmark
            FROM simplicity.v_simplicity_properties AS A
            LEFT JOIN internal2.bc_street AS B
            ON ST_DWithin(B.shape, A.shape, ldist)
            WHERE B.centerline_id = cid[i]
		LOOP
			RETURN NEXT r; -- return current row of SELECT
        END LOOP;
    END LOOP;
    RETURN;
END

$function$
;

CREATE OR REPLACE FUNCTION simplicity.get_properties_by_neighborhood(cid character varying[])
 RETURNS SETOF simplicity.v_simplicity_properties
 LANGUAGE plpgsql
AS $function$

DECLARE
    r simplicity.v_simplicity_properties%rowtype;
BEGIN
	for i in 1..array_length(cid,1) loop
    	FOR r IN
    		SELECT a.pin,
                A.pinext,
                A.pinnum,
                A.address,
                A.exempt,
                A.acreage,
                A.owner,
                A.cityname,
                A.zipcode,
                A.totalmarketvalue,
                A.appraisedvalue,
                A.taxvalue,
                A.landvalue,
                A.buildingvalue,
                A.propcard,
                A.deedurl,
                A.platurl,
                A.appraisalarea,
                A.neighborhoodcode,
                A.shape,
                A.civicaddress_id,
                A.latitude_wgs,
                A.longitude_wgs,
                A.zoning,
				A.jurisdiction_type,
                A.owner_address,
                A.location_type,
                A.polygon,
				A.historic_district,
				A.local_landmark
            FROM simplicity.v_simplicity_properties AS A
            LEFT JOIN internal2.coa_asheville_neighborhoods AS B
            ON ST_Intersects(B.shape, A.shape)
            -- ON ST_Contains(B.shape, ST_Transform(ST_SetSRID(ST_Point(A.longitude_wgs, A.latitude_wgs),4326),2264))            
            WHERE B.nbhd_id = cid[i]
		LOOP
			RETURN NEXT r; -- return current row of SELECT
        END LOOP;
    END LOOP;
    RETURN;
END

$function$
;

-----------
-- internal2.coa_bc_address_test source

CREATE OR REPLACE VIEW internal2.coa_bc_address_test
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
           FROM internal2.bc_civicaddress_table
             LEFT JOIN internal2.bc_location ON bc_civicaddress_table.civicaddress_id = bc_location.civicaddress_id
          WHERE bc_civicaddress_table.civicaddress_id <> 0::double precision) address_locations
     LEFT JOIN ( SELECT tmp.location_id,
            tmp.pin,
            tmp.rn
           FROM ( SELECT DISTINCT bc_location.location_id,
                    bc_property_1.pin,
                    row_number() OVER (PARTITION BY bc_location.location_id ORDER BY bc_property_1.pin) AS rn
                   FROM internal2.bc_location
                     LEFT JOIN internal2.bc_property bc_property_1 ON st_contains(bc_property_1.shape, bc_location.shape)) tmp
          WHERE tmp.rn = 1) property_location ON address_locations.location_id = property_location.location_id
     LEFT JOIN internal2.bc_property ON property_location.pin::text = bc_property.pin::text AND address_locations.pinext::text = bc_property.pinext::text
     LEFT JOIN internal2.bc_property_pinnum_formatted_owner_names ON (property_location.pin::text || address_locations.pinext::text) = bc_property_pinnum_formatted_owner_names.pinnum::text
     LEFT JOIN internal2.coa_zip_code ON address_locations.address_zipcode = coa_zip_code.zip::integer
     LEFT JOIN ( SELECT DISTINCT bc_location.location_id,
            coa_active_jurisdictions.jurisdiction_type
           FROM internal2.bc_location
             LEFT JOIN internal2.coa_active_jurisdictions ON st_contains(coa_active_jurisdictions.shape, bc_location.shape)) active_jurisdictions ON address_locations.location_id = active_jurisdictions.location_id
  ORDER BY address_locations.objectid;


-- internal2.coa_overlay_historic_districts_property_view source

CREATE OR REPLACE VIEW internal2.coa_overlay_historic_districts_property_view
AS SELECT DISTINCT bc_property.shape,
    bc_property.objectid,
    bc_property.pinnum,
    bc_property.owner,
    coa_zoning_overlays.name AS historic_district_name
   FROM internal2.bc_property,
    internal2.coa_zoning_overlays
  WHERE coa_zoning_overlays.overlay_type::text = 'HISTORIC DISTRICTS'::text AND coa_zoning_overlays.status::text = 'CURRENT'::text AND st_intersects(bc_property.shape, coa_zoning_overlays.shape)
  ORDER BY bc_property.shape, bc_property.objectid, bc_property.pinnum, bc_property.owner;

-- internal2.coa_overlay_historic_districts_property_view source

CREATE OR REPLACE VIEW internal2.coa_overlay_historic_districts_property_view
AS SELECT coa_overlay_historic_districts_property_view.shape,
    coa_overlay_historic_districts_property_view.objectid,
    coa_overlay_historic_districts_property_view.pinnum,
    coa_overlay_historic_districts_property_view.owner,
    coa_overlay_historic_districts_property_view.historic_district_name
   FROM internal2.coa_overlay_historic_districts_property_view;
