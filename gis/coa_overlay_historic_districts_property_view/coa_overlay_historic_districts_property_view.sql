-- View: amd.coa_overlay_historic_districts_property_view

-- DROP VIEW amd.coa_overlay_historic_districts_property_view;

CREATE OR REPLACE VIEW amd.coa_overlay_historic_districts_property_view AS
 SELECT DISTINCT bc_property.shape,
    bc_property.objectid,
    bc_property.pinnum,
    bc_property.owner
   FROM amd.bc_property,
    amd.coa_zoning_overlays
  WHERE coa_zoning_overlays.overlay_type::text = 'HISTORIC DISTRICTS'::text AND coa_zoning_overlays.status::text = 'CURRENT'::text AND st_intersects(bc_property.shape, coa_zoning_overlays.shape)
  ORDER BY bc_property.shape, bc_property.objectid, bc_property.pinnum, bc_property.owner;

ALTER TABLE amd.coa_overlay_historic_districts_property_view
    OWNER TO coapgdbo;

