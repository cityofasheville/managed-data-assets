-- internal2.bc_civicaddress_table definition

-- Drop table

-- DROP TABLE internal2.bc_civicaddress_table;

CREATE TABLE internal2.bc_civicaddress_table (
	objectid int4 NOT NULL,
	civicaddress_id numeric(38,8) NOT NULL,
	location_id numeric(38,8) NULL,
	street_number int4 NOT NULL,
	unit varchar(4) NULL,
	unit_type int4 NULL,
	street_prefix varchar(2) NULL,
	street_name varchar(30) NOT NULL,
	street_type varchar(4) NULL,
	street_postdirection varchar(2) NULL,
	full_civic_address varchar(40) NOT NULL,
	create_date timestamp NULL,
	change_date timestamp NULL,
	user_id varchar(8) NOT NULL,
	postal_code int4 NULL,
	commcode varchar(4) NULL,
	street_dupe varchar(3) NULL,
	pinext varchar(5) NULL
);


-- internal2.bc_location definition

-- Drop table

-- DROP TABLE internal2.bc_location;

CREATE TABLE internal2.bc_location (
	objectid int4 NULL,
	location_id numeric(38,8) NULL,
	locationtype int4 NULL,
	civicaddress_id numeric(38,8) NULL,
	parent_location_id numeric(38,8) NULL,
	building_id numeric(38,8) NULL,
	centerline_id numeric(38,8) NULL,
	user_id varchar(8) NULL,
	esn int2 NULL,
	x_coord numeric(38,8) NULL,
	y_coord numeric(38,8) NULL,
	commcode varchar(4) NULL,
	primary_structure int2 NULL,
	create_date timestamp NULL,
	change_date timestamp NULL,
	parcel_id varchar(10) NULL,
	shape geometry NULL
);


-- internal2.bc_property definition

-- Drop table

-- DROP TABLE internal2.bc_property;

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
CREATE INDEX i438deedbook ON internal2.bc_property USING btree (deedbook) WITH (fillfactor='75');
CREATE INDEX i438deedpage ON internal2.bc_property USING btree (deedpage) WITH (fillfactor='75');
CREATE INDEX i438owner ON internal2.bc_property USING btree (owner) WITH (fillfactor='75');
CREATE INDEX i438pinnum ON internal2.bc_property USING btree (pinnum) WITH (fillfactor='75');
CREATE INDEX i438subname ON internal2.bc_property USING btree (subname) WITH (fillfactor='75');
CREATE UNIQUE INDEX r264_sde_rowid_uk ON internal2.bc_property USING btree (objectid) WITH (fillfactor='75');


-- internal2.bc_property_account_master definition

-- Drop table

-- DROP TABLE internal2.bc_property_account_master;

CREATE TABLE internal2.bc_property_account_master (
	am_account_no int4 NULL,
	am_owner_type varchar(3) NULL,
	am_last_name varchar(80) NULL,
	am_first_name varchar(35) NULL,
	am_middle_name varchar(35) NULL,
	am_name_suffix varchar(5) NULL,
	am_address1 varchar(35) NULL,
	am_address2 varchar(35) NULL,
	am_address3 varchar(50) NULL,
	am_city varchar(20) NULL,
	am_state varchar(2) NULL,
	am_zip varchar(5) NULL,
	am_zip_plus4 varchar(4) NULL,
	am_foreign_address_flag varchar(1) NULL,
	am_foreign_country varchar(20) NULL,
	am_foreign_zip varchar(10) NULL,
	am_exempt_account_flag varchar(1) NULL,
	am_bad_address_flag varchar(1) NULL,
	am_bypass_postal_flag varchar(1) NULL,
	am_last_update_date timestamp NULL,
	am_last_update_user varchar(3) NULL,
	pkam_account_no int4 NOT NULL,
	CONSTRAINT bc_property_account_master_pkey PRIMARY KEY (pkam_account_no)
);


-- internal2.bc_property_pinnum_formatted_owner_names definition

-- Drop table

-- DROP TABLE internal2.bc_property_pinnum_formatted_owner_names;

CREATE TABLE internal2.bc_property_pinnum_formatted_owner_names (
	pinnum text NOT NULL,
	formatted_owner_name text NULL,
	CONSTRAINT bc_property_pinnum_formatted_owner_names_pkey PRIMARY KEY (pinnum)
);


-- internal2.coa_active_jurisdictions definition

-- Drop table

-- DROP TABLE internal2.coa_active_jurisdictions;

CREATE TABLE internal2.coa_active_jurisdictions (
	objectid int4 NOT NULL,
	areaname varchar(50) NULL,
	acres numeric(38,8) NULL,
	sqmiles numeric(38,8) NULL,
	cityname varchar(9) NULL,
	edit_date timestamp NULL,
	edit_by varchar(100) NULL,
	jurisdiction_type varchar(150) NULL,
	"label" varchar(50) NULL,
	shape geometry NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_coa_active_jurisdictions PRIMARY KEY (objectid)
);
CREATE INDEX a259_ix1 ON internal2.coa_active_jurisdictions USING gist (shape);





-- internal2.coa_districts_public_works definition

-- Drop table

-- DROP TABLE internal2.coa_districts_public_works;

CREATE TABLE internal2.coa_districts_public_works (
	objectid int4 NOT NULL,
	truckday varchar(10) NULL,
	truck_num int2 NULL,
	brushtruck_num int2 NULL,
	sweep_district varchar(10) NULL,
	recdistrict varchar(2) NULL,
	recday varchar(10) NULL,
	"comments" varchar(100) NULL,
	edit_date timestamp NULL,
	edit_by varchar(100) NULL,
	shape geometry NULL,
	brushweek varchar(25) NULL,
	uniqueid varchar(24) NULL,
	trash_dist varchar(24) NULL,
	brush_dist varchar(24) NULL,
	brush_week varchar(24) NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_coa_districts_public_works PRIMARY KEY (objectid)
);
CREATE INDEX a295_ix1 ON internal2.coa_districts_public_works USING gist (shape);


-- internal2.coa_districts_water definition

-- Drop table

-- DROP TABLE internal2.coa_districts_water;

CREATE TABLE internal2.coa_districts_water (
	objectid int4 NOT NULL,
	id numeric(10) NULL,
	district varchar(10) NULL,
	mrc varchar(3) NULL,
	edit_date timestamp NULL,
	edit_by varchar(100) NULL,
	shape geometry NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_coa_districts_water PRIMARY KEY (objectid)
);
CREATE INDEX a244_ix1 ON internal2.coa_districts_water USING gist (shape);


-- internal2.coa_districts_zoning definition

-- Drop table

-- DROP TABLE internal2.coa_districts_zoning;

CREATE TABLE internal2.coa_districts_zoning (
	objectid int4 NOT NULL,
	"date" timestamp NULL,
	districts varchar(50) NULL,
	ordinance varchar(50) NULL,
	hyperlink varchar(254) NULL,
	overlay_type varchar(150) NULL,
	status varchar(50) NULL,
	"type" varchar(50) NULL,
	notes varchar(50) NULL,
	squaremile numeric(38,8) NULL,
	acreage numeric(38,8) NULL,
	edit_date timestamp NULL,
	edit_by varchar(100) NULL,
	gdb_geomattr_data bytea NULL,
	shape geometry NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_coa_districts_zoning PRIMARY KEY (objectid)
);
CREATE INDEX a599_ix1 ON internal2.coa_districts_zoning USING gist (shape);
CREATE UNIQUE INDEX r690_sde_rowid_uk ON internal2.coa_districts_zoning USING btree (objectid) WITH (fillfactor='75');


-- internal2.coa_zip_code definition

-- Drop table

-- DROP TABLE internal2.coa_zip_code;

CREATE TABLE internal2.coa_zip_code (
	objectid int4 NOT NULL,
	bc_zipcode int4 NULL,
	bc_zipco_1 int4 NULL,
	zip varchar(5) NULL,
	po_name varchar(28) NULL,
	state varchar(2) NULL,
	sumblkpop int4 NULL,
	pop2000 int4 NULL,
	citycode varchar(4) NULL,
	edit_date timestamp NULL,
	edit_by varchar(100) NULL,
	shape geometry NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_coa_zip_code PRIMARY KEY (objectid)
);
CREATE INDEX a287_ix1 ON internal2.coa_zip_code USING gist (shape);


-- internal2.coa_bc_address_master definition

-- Drop table

-- DROP TABLE internal2.coa_bc_address_master;

CREATE TABLE internal2.coa_bc_address_master (
	objectid int4 NOT NULL,
	civicaddress_id int4 NULL,
	address_x numeric(38,8) NULL,
	address_y numeric(38,8) NULL,
	address_full varchar(40) NULL,
	address_number int4 NULL,
	address_unit varchar(4) NULL,
	address_street_prefix varchar(2) NULL,
	address_street_name varchar(30) NULL,
	address_street_type varchar(4) NULL,
	address_street_postdirection varchar(2) NULL,
	address_city varchar(28) NULL,
	address_commcode varchar(4) NULL,
	address_zipcode int4 NULL,
	location_type int4 NULL,
	address_change_date timestamp NULL,
	maximo_type varchar(30) NULL,
	maximo_seq_num int4 NULL,
	asset_code varchar(50) NULL,
	mrc varchar(8) NULL,
	water_district varchar(8) NULL,
	trash_pickup_day varchar(10) NULL,
	jurisdiction_type varchar(150) NULL,
	zoning varchar(200) NULL,
	river_district varchar(200) NULL,
	centerline_id numeric(19) NULL,
	location_id numeric(19) NULL,
	parent_location_id numeric(19) NULL,
	property_pinnum varchar(15) NULL,
	property_pin varchar(15) NULL,
	property_pinext varchar(50) NULL,
	property_nmptype varchar(150) NULL,
	property_oldpinnum varchar(50) NULL,
	property_update_date varchar(50) NULL,
	property_update_reason varchar(50) NULL,
	property_deeddate varchar(50) NULL,
	property_taxyear varchar(50) NULL,
	property_deedurl varchar(254) NULL,
	property_platurl varchar(254) NULL,
	property_propcardurl varchar(150) NULL,
	property_acreage numeric(38,8) NULL,
	property_class varchar(50) NULL,
	property_improved varchar(50) NULL,
	property_exempt varchar(50) NULL,
	property_priced varchar(50) NULL,
	property_totalmarketvalue numeric(38,2) NULL,
	property_appraisedvalue numeric(38,2) NULL,
	property_taxvalue numeric(38,2) NULL,
	property_landuse varchar(50) NULL,
	property_neighborhoodcode varchar(50) NULL,
	property_landvalue numeric(38,2) NULL,
	property_buildingvalue numeric(38,2) NULL,
	property_improvementvalue numeric(38,2) NULL,
	property_appraisalarea varchar(50) NULL,
	property_condounit varchar(50) NULL,
	property_condobuilding varchar(50) NULL,
	property_subname varchar(50) NULL,
	property_sublot varchar(50) NULL,
	property_subblock varchar(50) NULL,
	property_subsect varchar(50) NULL,
	property_township varchar(50) NULL,
	property_stamps numeric(38,8) NULL,
	property_instrument varchar(50) NULL,
	property_firedistrict varchar(50) NULL,
	property_schooldistrict varchar(50) NULL,
	owner_name text NULL,
	owner_house_number varchar(50) NULL,
	owner_number_suffix varchar(50) NULL,
	owner_direction varchar(50) NULL,
	owner_street_name varchar(50) NULL,
	owner_street_type varchar(50) NULL,
	owner_careof varchar(50) NULL,
	owner_address varchar(50) NULL,
	owner_cityname varchar(50) NULL,
	owner_state varchar(50) NULL,
	owner_zipcode varchar(50) NULL,
	owner_account_number varchar(50) NULL,
	longitude_wgs numeric(38,8) NULL,
	latitude_wgs numeric(38,8) NULL,
	recycling_pickup_district varchar(2) NULL,
	recycling_pickup_day varchar(10) NULL,
	gdb_geomattr_data bytea NULL,
	unit_type int4 NULL,
	nbrhd_id varchar(10) NULL,
	nbrhd_name varchar(25) NULL,
	brushweek varchar(2) NULL,
	historic_district varchar(100) NULL,
	local_landmark varchar(50) NULL,
	shape tiger.geometry NULL,
	zoning_links text NULL
);
CREATE INDEX a23_ix1 ON internal2.coa_bc_address_master USING gist (shape);
CREATE UNIQUE INDEX r31_sde_rowid_uk ON internal2.coa_bc_address_master USING btree (objectid) WITH (fillfactor='75');
CREATE INDEX search ON internal2.coa_bc_address_master USING btree (address_number, address_street_name, address_street_type, address_street_prefix, address_zipcode, address_commcode, address_unit);