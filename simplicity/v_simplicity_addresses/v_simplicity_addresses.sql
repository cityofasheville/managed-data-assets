-- View: amd.v_simplicity_addresses

-- DROP VIEW amd.v_simplicity_addresses;

CREATE OR REPLACE VIEW amd.v_simplicity_addresses AS
 SELECT civicaddress_id, address_full, address_city, address_zipcode, 
        address_number, address_unit, address_street_prefix, address_street_name, 
        latitude_wgs, longitude_wgs,
        trash_pickup_day, recycling_pickup_district, recycling_pickup_day, 
        zoning, owner_name, owner_address, owner_cityname, owner_state, 
        owner_zipcode, property_pin, property_pinext, centerline_id, jurisdiction_type 
 FROM amd.coa_bc_address_master
 WHERE location_type = 1
 

