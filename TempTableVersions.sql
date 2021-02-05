
-- GIS Warehouse views used in Temp Table Versions
-- bedrock.bedrock_coa_national_register_properties source

CREATE OR REPLACE VIEW bedrock.bedrock_coa_national_register_properties
AS SELECT coa_national_register_properties.objectid,
    coa_national_register_properties.id,
    coa_national_register_properties.name,
    coa_national_register_properties.area_type,
    coa_national_register_properties.edit_date,
    coa_national_register_properties.edit_by,
    st_area(coa_national_register_properties.shape) AS st_area_shape_,
    st_length(coa_national_register_properties.shape) AS st_length_shape_,
    coa_national_register_properties.nr_pdfs,
    coa_national_register_properties.shape
   FROM coa_national_register_properties;


-- bedrock.bedrock_coa_zoning_overlays source

CREATE OR REPLACE VIEW bedrock.bedrock_coa_zoning_overlays
AS SELECT coa_zoning_overlays.objectid,
    coa_zoning_overlays.name,
    coa_zoning_overlays.label,
    coa_zoning_overlays.narrative,
    coa_zoning_overlays.date,
    coa_zoning_overlays.zoning_district,
    coa_zoning_overlays.ordinance,
    coa_zoning_overlays.calculated_acreage,
    coa_zoning_overlays.edit_date,
    coa_zoning_overlays.edit_by,
    coa_zoning_overlays.overlay_type,
    coa_zoning_overlays.status,
    st_area(coa_zoning_overlays.shape) AS st_area_shape_,
    st_length(coa_zoning_overlays.shape) AS st_length_shape_,
    coa_zoning_overlays.shape
   FROM coa_zoning_overlays;

-------------------------------------------------   
-- Edit DB Views used in Temp Table Versions
-- bedrock.bc_property source

CREATE OR REPLACE VIEW bedrock.bc_property
AS SELECT bc_property.objectid,
    bc_property.pinnum,
    bc_property.pin,
    bc_property.pinext,
    bc_property.owner,
    bc_property.nmptype,
    bc_property.taxyear,
    bc_property.condounit,
    bc_property.condobuilding,
    bc_property.deedbook,
    bc_property.deedpage,
    bc_property.platbook,
    bc_property.platpage,
    bc_property.subname,
    bc_property.sublot,
    bc_property.subblock,
    bc_property.subsect,
    bc_property.updatedate,
    bc_property.housenumber,
    bc_property.numbersuffix,
    bc_property.direction,
    bc_property.streetname,
    bc_property.streettype,
    bc_property.township,
    bc_property.acreage,
    bc_property.accountnumber,
    bc_property.deeddate,
    bc_property.stamps,
    bc_property.instrument,
    bc_property.reason,
    bc_property.county,
    bc_property.city,
    bc_property.firedistrict,
    bc_property.schooldistrict,
    bc_property.careof,
    bc_property.address,
    bc_property.cityname,
    bc_property.state,
    bc_property.zipcode,
    bc_property.class,
    bc_property.improved,
    bc_property.exempt,
    bc_property.priced,
    bc_property.totalmarketvalue,
    bc_property.appraisedvalue,
    bc_property.taxvalue,
    bc_property.landuse,
    bc_property.neighborhoodcode,
    bc_property.landvalue,
    bc_property.buildingvalue,
    bc_property.improvementvalue,
    bc_property.appraisalarea,
    bc_property.state_route,
    bc_property.state_route_suffix,
    bc_property.propcard,
    bc_property.oldpinnum,
    bc_property.citystatezip,
    bc_property.deedurl,
    bc_property.platurl,
    NULL::unknown AS gdb_geomattr_data,
    bc_property.shape
   FROM bc_property;


-- bedrock.coa_active_jurisdictions source

CREATE OR REPLACE VIEW bedrock.coa_active_jurisdictions
AS SELECT coa_active_jurisdictions.objectid,
    coa_active_jurisdictions.areaname,
    coa_active_jurisdictions.acres,
    coa_active_jurisdictions.sqmiles,
    coa_active_jurisdictions.cityname,
    coa_active_jurisdictions.edit_date,
    coa_active_jurisdictions.edit_by,
    coa_active_jurisdictions.jurisdiction_type,
    coa_active_jurisdictions.label,
    NULL::unknown AS gdb_geomattr_data,
    coa_active_jurisdictions.shape
   FROM coa_active_jurisdictions;


-- bedrock.coa_asheville_neighborhoods source

CREATE OR REPLACE VIEW bedrock.coa_asheville_neighborhoods
AS SELECT coa_asheville_neighborhoods.objectid,
    coa_asheville_neighborhoods.name,
    coa_asheville_neighborhoods.nbhd_id,
    coa_asheville_neighborhoods.abbreviation,
    coa_asheville_neighborhoods.narrative,
    coa_asheville_neighborhoods.edit_date,
    coa_asheville_neighborhoods.edit_by,
    st_area(coa_asheville_neighborhoods.shape) AS st_area_shape_,
    st_length(coa_asheville_neighborhoods.shape) AS st_length_shape_,
    coa_asheville_neighborhoods.shape
   FROM coa_asheville_neighborhoods;

