-- internal.coa_cip_project_lines definition

-- Drop table

DROP TABLE internal.coa_cip_project_lines;

CREATE TABLE internal.coa_cip_project_lines (
	objectid int4 NOT NULL,
	gis_id varchar(20) NULL,
	projecttype varchar(50) NULL,
	projectclass varchar(50) NULL,
	subclass varchar(50) NULL,
	sitetype varchar(20) NULL,
	projectname varchar(100) NULL,
	locationdescription varchar(256) NULL,
	complete varchar(20) NULL,
	edit_by varchar(100) NULL,
	edit_date varchar(50) NULL,
	gdb_geomattr_data bytea NULL,
	shape tiger.geometry NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264))
);
CREATE INDEX a459_ix1 ON internal.coa_cip_project_lines USING gist (shape);
CREATE UNIQUE INDEX r475_sde_rowid_uk ON internal.coa_cip_project_lines USING btree (objectid) WITH (fillfactor='75');


-- internal.coa_cip_project_points definition

-- Drop table

DROP TABLE internal.coa_cip_project_points;

CREATE TABLE internal.coa_cip_project_points (
	objectid int4 NOT NULL,
	gis_id varchar(20) NULL,
	projecttype varchar(50) NULL,
	projectclass varchar(50) NULL,
	subclass varchar(50) NULL,
	sitetype varchar(20) NULL,
	projectname varchar(100) NULL,
	locationdescription varchar(256) NULL,
	complete varchar(50) NULL,
	gdb_geomattr_data bytea NULL,
	shape tiger.geometry NULL,
	edit_date varchar(50) NULL,
	edit_by varchar(100) NULL,
	project_number varchar(50) NULL,
	inspector varchar(50) NULL,
	warranty_end timestamp NULL,
	project_link varchar(300) NULL,
	project_description varchar(1000) NULL,
	map_link varchar(300) NULL,
	department varchar(30) NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264))
);
CREATE INDEX a457_ix1 ON internal.coa_cip_project_points USING gist (shape);
CREATE UNIQUE INDEX r473_sde_rowid_uk ON internal.coa_cip_project_points USING btree (objectid) WITH (fillfactor='75');


-- internal.coa_cip_project_polygons definition

-- Drop table

DROP TABLE internal.coa_cip_project_polygons;

CREATE TABLE internal.coa_cip_project_polygons (
	objectid int4 NOT NULL,
	gis_id varchar(20) NULL,
	projecttype varchar(50) NULL,
	projectclass varchar(50) NULL,
	subclass varchar(50) NULL,
	sitetype varchar(20) NULL,
	projectname varchar(100) NULL,
	locationdescription varchar(256) NULL,
	complete varchar(20) NULL,
	gdb_geomattr_data bytea NULL,
	shape tiger.geometry NULL,
	edit_by varchar(100) NULL,
	edit_date varchar(50) NULL,
	CONSTRAINT enforce_srid_shape CHECK ((st_srid(shape) = 2264))
);
CREATE INDEX a458_ix1 ON internal.coa_cip_project_polygons USING gist (shape);
CREATE UNIQUE INDEX r474_sde_rowid_uk ON internal.coa_cip_project_polygons USING btree (objectid) WITH (fillfactor='75');

----------------------------
before
----------------------------

-- internal.coa_cip_project_lines definition

-- Drop table

-- DROP TABLE internal.coa_cip_project_lines;

CREATE TABLE internal.coa_cip_project_lines (
	objectid int4 NULL,
	gis_id varchar(20) NULL,
	projecttype varchar(50) NULL,
	projectclass varchar(50) NULL,
	subclass varchar(50) NULL,
	sitetype varchar(20) NULL,
	projectname varchar(100) NULL,
	locationdescription varchar(256) NULL,
	complete varchar(50) NULL,
	gdb_geomattr_data bytea NULL,
	edit_by varchar(100) NULL,
	edit_date varchar(50) NULL,
	shape tiger.geometry NULL
);
CREATE INDEX a54_ix1 ON internal.coa_cip_project_lines USING gist (shape);
CREATE UNIQUE INDEX r65_sde_rowid_uk ON internal.coa_cip_project_lines USING btree (objectid) WITH (fillfactor='75');


-- internal.coa_cip_project_points definition

-- Drop table

-- DROP TABLE internal.coa_cip_project_points;

CREATE TABLE internal.coa_cip_project_points (
	objectid int4 NULL,
	gis_id varchar(20) NULL,
	projecttype varchar(50) NULL,
	projectclass varchar(50) NULL,
	subclass varchar(50) NULL,
	sitetype varchar(20) NULL,
	projectname varchar(100) NULL,
	locationdescription varchar(256) NULL,
	complete varchar(50) NULL,
	edit_date varchar(50) NULL,
	edit_by varchar(100) NULL,
	shape tiger.geometry NULL
);
CREATE INDEX a55_ix1 ON internal.coa_cip_project_points USING gist (shape);
CREATE UNIQUE INDEX r66_sde_rowid_uk ON internal.coa_cip_project_points USING btree (objectid) WITH (fillfactor='75');


-- internal.coa_cip_project_polygons definition

-- Drop table

-- DROP TABLE internal.coa_cip_project_polygons;

CREATE TABLE internal.coa_cip_project_polygons (
	objectid int4 NULL,
	gis_id varchar(20) NULL,
	projecttype varchar(50) NULL,
	projectclass varchar(50) NULL,
	subclass varchar(50) NULL,
	sitetype varchar(20) NULL,
	projectname varchar(100) NULL,
	locationdescription varchar(256) NULL,
	complete varchar(20) NULL,
	gdb_geomattr_data bytea NULL,
	edit_by varchar(100) NULL,
	edit_date varchar(50) NULL,
	shape tiger.geometry NULL
);
CREATE INDEX a56_ix1 ON internal.coa_cip_project_polygons USING gist (shape);
CREATE UNIQUE INDEX r67_sde_rowid_uk ON internal.coa_cip_project_polygons USING btree (objectid) WITH (fillfactor='75');


