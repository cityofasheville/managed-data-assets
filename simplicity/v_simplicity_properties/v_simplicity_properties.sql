-- View: amd.v_simplicity_properties

-- DROP VIEW amd.v_simplicity_properties;

CREATE OR REPLACE VIEW amd.v_simplicity_properties AS
 SELECT a.pin,
    a.pinext,
    a.pinnum,
    a.address,
    a.exempt,
    a.acreage,
    a.owner,
    a.cityname,
    a.zipcode,
    a.totalmarketvalue,
    a.appraisedvalue,
    a.taxvalue,
    a.landvalue,
    a.buildingvalue,
    a.propcard,
    a.deedurl,
    a.platurl,
    a.appraisalarea,
    a.neighborhoodcode,
    a.shape,
    b.civicaddress_id,
    b.lattitude,
    b.longitude,
    b.zoning,
    b.owner_address
   FROM amd.bc_property a
     LEFT JOIN amd.coa_bc_address_master b ON a.pin::text = b.property_pin::text AND a.pinext::text = b.property_pinext::text;
  


