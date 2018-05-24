SET search_path TO amd, public, topology, sde;

DROP TABLE IF EXISTS coa_bc_address_master;

-- Table: amd.coa_bc_address_master

-- DROP TABLE amd.coa_bc_address_master;

CREATE TABLE amd.coa_bc_address_master
(
    objectid integer NOT NULL,
    civicaddress_id integer,
    address_x numeric(38,8),
    address_y numeric(38,8),
    address_full character varying(40) COLLATE pg_catalog."default",
    address_number integer,
    address_unit character varying(4) COLLATE pg_catalog."default",
    address_street_prefix character varying(2) COLLATE pg_catalog."default",
    address_street_name character varying(30) COLLATE pg_catalog."default",
    address_street_type character varying(4) COLLATE pg_catalog."default",
    address_street_postdirection character varying(2) COLLATE pg_catalog."default",
    address_city character varying(28) COLLATE pg_catalog."default",
    address_commcode character varying(4) COLLATE pg_catalog."default",
    address_zipcode integer,
    location_type integer,
    address_change_date timestamp without time zone,
    maximo_type character varying(30) COLLATE pg_catalog."default",
    maximo_seq_num integer,
    asset_code character varying(50) COLLATE pg_catalog."default",
    mrc character varying(8) COLLATE pg_catalog."default",
    water_district character varying(8) COLLATE pg_catalog."default",
    trash_pickup_day character varying(10) COLLATE pg_catalog."default",
    jurisdiction_type character varying(150) COLLATE pg_catalog."default",
    zoning character varying(200) COLLATE pg_catalog."default",
    river_district character varying(200) COLLATE pg_catalog."default",
    centerline_id numeric(19,0),
    location_id numeric(19,0),
    parent_location_id numeric(19,0),
    property_pinnum character varying(15) COLLATE pg_catalog."default",
    property_pin character varying(15) COLLATE pg_catalog."default",
    property_pinext character varying(50) COLLATE pg_catalog."default",
    property_nmptype character varying(150) COLLATE pg_catalog."default",
    property_oldpinnum character varying(50) COLLATE pg_catalog."default",
    property_update_date character varying(50) COLLATE pg_catalog."default",
    property_update_reason character varying(50) COLLATE pg_catalog."default",
    property_deeddate character varying(50) COLLATE pg_catalog."default",
    property_taxyear character varying(50) COLLATE pg_catalog."default",
    property_deedurl character varying(254) COLLATE pg_catalog."default",
    property_platurl character varying(254) COLLATE pg_catalog."default",
    property_propcardurl character varying(150) COLLATE pg_catalog."default",
    property_acreage numeric(38,8),
    property_class character varying(50) COLLATE pg_catalog."default",
    property_improved character varying(50) COLLATE pg_catalog."default",
    property_exempt character varying(50) COLLATE pg_catalog."default",
    property_priced character varying(50) COLLATE pg_catalog."default",
    property_totalmarketvalue numeric(38,2),
    property_appraisedvalue numeric(38,2),
    property_taxvalue numeric(38,2),
    property_landuse character varying(50) COLLATE pg_catalog."default",
    property_neighborhoodcode character varying(50) COLLATE pg_catalog."default",
    property_landvalue numeric(38,2),
    property_buildingvalue numeric(38,2),
    property_improvementvalue numeric(38,2),
    property_appraisalarea character varying(50) COLLATE pg_catalog."default",
    property_condounit character varying(50) COLLATE pg_catalog."default",
    property_condobuilding character varying(50) COLLATE pg_catalog."default",
    property_subname character varying(50) COLLATE pg_catalog."default",
    property_sublot character varying(50) COLLATE pg_catalog."default",
    property_subblock character varying(50) COLLATE pg_catalog."default",
    property_subsect character varying(50) COLLATE pg_catalog."default",
    property_township character varying(50) COLLATE pg_catalog."default",
    property_stamps numeric(38,8),
    property_instrument character varying(50) COLLATE pg_catalog."default",
    property_firedistrict character varying(50) COLLATE pg_catalog."default",
    property_schooldistrict character varying(50) COLLATE pg_catalog."default",
    owner_name text COLLATE pg_catalog."default",
    owner_house_number character varying(50) COLLATE pg_catalog."default",
    owner_number_suffix character varying(50) COLLATE pg_catalog."default",
    owner_direction character varying(50) COLLATE pg_catalog."default",
    owner_street_name character varying(50) COLLATE pg_catalog."default",
    owner_street_type character varying(50) COLLATE pg_catalog."default",
    owner_careof character varying(50) COLLATE pg_catalog."default",
    owner_address character varying(50) COLLATE pg_catalog."default",
    owner_cityname character varying(50) COLLATE pg_catalog."default",
    owner_state character varying(50) COLLATE pg_catalog."default",
    owner_zipcode character varying(50) COLLATE pg_catalog."default",
    owner_account_number character varying(50) COLLATE pg_catalog."default",
    longitude_wgs numeric(38,8),
    latitude_wgs numeric(38,8),
    recycling_pickup_district character varying(2) COLLATE pg_catalog."default",
    recycling_pickup_day character varying(10) COLLATE pg_catalog."default",
    gdb_geomattr_data bytea,
    shape geometry(Geometry,2264),
    unit_type integer,
    nbrhd_id character varying(10) COLLATE pg_catalog."default",
    nbrhd_name character varying(25) COLLATE pg_catalog."default",
    brushweek character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT enforce_srid_shape CHECK (st_srid(shape) = 2264)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE amd.coa_bc_address_master
    OWNER to amd;

GRANT SELECT ON TABLE amd.coa_bc_address_master TO sde;

GRANT ALL ON TABLE amd.coa_bc_address_master TO amd;

-- Index: a23_ix1

-- DROP INDEX amd.a23_ix1;

CREATE INDEX a23_ix1
    ON amd.coa_bc_address_master USING gist
    (shape)
    TABLESPACE pg_default;

-- Index: r31_sde_rowid_uk

-- DROP INDEX amd.r31_sde_rowid_uk;

CREATE UNIQUE INDEX r31_sde_rowid_uk
    ON amd.coa_bc_address_master USING btree
    (objectid)
    WITH (FILLFACTOR=75)
    TABLESPACE pg_default;

-- Index: search

-- DROP INDEX amd.search;

CREATE INDEX search
    ON amd.coa_bc_address_master USING btree
    (address_number, address_street_name COLLATE pg_catalog."default", address_street_type COLLATE pg_catalog."default", address_street_prefix COLLATE pg_catalog."default", address_zipcode, address_commcode COLLATE pg_catalog."default", address_unit COLLATE pg_catalog."default")
    TABLESPACE pg_default;
    