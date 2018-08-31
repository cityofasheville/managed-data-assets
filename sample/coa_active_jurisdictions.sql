-- Table: amd.coa_active_jurisdictions

-- DROP TABLE amd.coa_active_jurisdictions;

CREATE TABLE amd.coa_active_jurisdictions
(
    objectid integer NOT NULL,
    areaname character varying(50) COLLATE pg_catalog."default",
    acres numeric(38,8),
    sqmiles numeric(38,8),
    cityname character varying(9) COLLATE pg_catalog."default",
    edit_date timestamp without time zone,
    edit_by character varying(100) COLLATE pg_catalog."default",
    jurisdiction_type character varying(150) COLLATE pg_catalog."default",
    label character varying(50) COLLATE pg_catalog."default",
    gdb_geomattr_data bytea,
    shape geometry(Geometry,2264),
    CONSTRAINT enforce_srid_shape CHECK (st_srid(shape) = 2264)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE amd.coa_active_jurisdictions
    OWNER to amd;

GRANT SELECT ON TABLE amd.coa_active_jurisdictions TO sde;

GRANT ALL ON TABLE amd.coa_active_jurisdictions TO amd;

-- Index: a31_ix1

-- DROP INDEX amd.a31_ix1;

CREATE INDEX a31_ix1
    ON amd.coa_active_jurisdictions USING gist
    (shape)
    TABLESPACE pg_default;

-- Index: r39_sde_rowid_uk

-- DROP INDEX amd.r39_sde_rowid_uk;

CREATE UNIQUE INDEX r39_sde_rowid_uk
    ON amd.coa_active_jurisdictions USING btree
    (objectid)
    WITH (FILLFACTOR=75)
    TABLESPACE pg_default;
  