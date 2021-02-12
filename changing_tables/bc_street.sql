
-- select * from internal.bc_street limit 10

-- Drop table

DROP TABLE internal.bc_street cascade;

CREATE TABLE internal.bc_street (
	objectid int4 NOT NULL,
	centerline_id numeric(38,8) NULL,
	road_class int4 NULL,
	street_prefix varchar(2) NULL,
	street_name varchar(30) NULL,
	street_type varchar(4) NULL,
	street_postdirection varchar(2) NULL,
	street_dupe varchar(1) NULL,
	full_street_name varchar(32) NULL,
	speed_limit int4 NULL,
	lane_count int4 NULL,
	left_from_address int4 NULL,
	left_to_address int4 NULL,
	right_from_address int4 NULL,
	right_to_address int4 NULL,
	user_id varchar(8) NULL,
	create_date timestamp NULL,
	change_date timestamp NULL,
	lesn int4 NULL,
	resn int4 NULL,
	lzip int4 NULL,
	rzip int4 NULL,
	lcommcode varchar(4) NULL,
	rcommcode varchar(4) NULL,
	route_id varchar(20) NULL,
	maximo_type varchar(30) NULL,
	maximo_seq_num int4 NULL,
	asset_code varchar(50) NULL,
	mrc varchar(8) NULL,
	min_range int4 NULL,
	max_range int4 NULL,
	shape geometry(MULTILINESTRING, 2264) NULL,
	gdb_geomattr_data bytea NULL, ------------------
	oneway int2 NULL,
	fromelevation int2 NULL,
	toelevation int2 NULL,
	CONSTRAINT pk_bc_street PRIMARY KEY (objectid)
);
CREATE INDEX a253_ix1 ON internal.bc_street USING gist (shape);

CREATE OR REPLACE VIEW "open".bc_street
AS SELECT bc_street.objectid,
    bc_street.centerline_id,
    bc_street.road_class,
    bc_street.street_prefix,
    bc_street.street_name,
    bc_street.street_type,
    bc_street.street_postdirection,
    bc_street.street_dupe,
    bc_street.full_street_name,
    bc_street.speed_limit,
    bc_street.lane_count,
    bc_street.left_from_address,
    bc_street.left_to_address,
    bc_street.right_from_address,
    bc_street.right_to_address,
    bc_street.user_id,
    bc_street.create_date,
    bc_street.change_date,
    bc_street.lesn,
    bc_street.resn,
    bc_street.lzip,
    bc_street.rzip,
    bc_street.lcommcode,
    bc_street.rcommcode,
    bc_street.route_id,
    bc_street.maximo_type,
    bc_street.maximo_seq_num,
    bc_street.asset_code,
    bc_street.mrc,
    bc_street.min_range,
    bc_street.max_range
   FROM internal.bc_street;

------------------------------
CREATE OR REPLACE VIEW simplicity.v_simplicity_streets
AS SELECT a.centerline_id,
    a.full_street_name,
    a.lzip AS left_zipcode,
    a.rzip AS right_zipcode,
    a.left_from_address,
    a.right_from_address,
    a.left_to_address,
    a.right_to_address,
    st_astext(st_transform(a.shape, 4326)) AS line
   FROM internal.bc_street a;
grant select on simplicity.v_simplicity_streets to simplicity_reader;
------------------------------
CREATE OR REPLACE FUNCTION simplicity.get_search_streets(lstreetname character varying[], lzipcode integer[])
 RETURNS SETOF simplicity.v_simplicity_streets
 LANGUAGE plpgsql
AS $function$

DECLARE
    r simplicity.v_simplicity_streets%rowtype;
BEGIN
	for i in 1..array_length(lstreetname,1) loop
    	FOR r IN (
                select centerline_id, full_street_name, lzip as left_zipcode, rzip as right_zipcode,
						left_from_address, right_from_address,
						left_to_address, right_to_address,																					
            			st_astext(st_transform(shape, 4326)) AS line
                from internal.bc_street 
                where street_name = lstreetname[i]
                and   (lzip = lzipcode[i] OR rzip = lzipcode[i])
            )
		LOOP
			RETURN NEXT r; -- return current row of SELECT
        END LOOP;
    END LOOP;
    RETURN;
END

$function$
;   
grant execute on FUNCTION simplicity.get_search_streets(lstreetname character varying[], lzipcode integer[]) to simplicity_reader;
-- or go back...


-- DROP TABLE internal.bc_street;
/*
CREATE TABLE internal.bc_street (
	objectid int4 NOT NULL,
	centerline_id numeric(38,8) NOT NULL,
	road_class int4 NULL,
	street_prefix varchar(2) NULL,
	street_name varchar(30) NOT NULL,
	street_type varchar(4) NULL,
	street_postdirection varchar(2) NULL,
	street_dupe varchar(1) NULL,
	full_street_name varchar(32) NOT NULL,
	speed_limit int4 NULL,
	lane_count int4 NULL,
	left_from_address int4 NOT NULL,
	left_to_address int4 NOT NULL,
	right_from_address int4 NOT NULL,
	right_to_address int4 NOT NULL,
	user_id varchar(8) NOT NULL,
	create_date timestamp NULL,
	change_date timestamp NULL,
	lesn int2 NULL,
	resn int2 NULL,
	lzip int4 NULL,
	rzip int4 NULL,
	lcommcode varchar(4) NULL,
	rcommcode varchar(4) NULL,
	route_id varchar(20) NULL,
	maximo_type varchar(30) NULL,
	maximo_seq_num int4 NULL,
	asset_code varchar(50) NULL,
	mrc varchar(8) NULL,
	min_range int4 NULL,
	max_range int4 NULL,
	shape tiger.geometry NULL,
	oneway int2 NULL,
	fromelevation int2 NULL,
	toelevation int2 NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264)),
	CONSTRAINT pk_bc_street PRIMARY KEY (objectid)
);
CREATE INDEX a256_ix1 ON internal.bc_street USING gist (shape);
CREATE UNIQUE INDEX r269_sde_rowid_uk ON internal.bc_street USING btree (objectid) WITH (fillfactor='75');
*/