SELECT 
coa.objectid, bak.objectid,
coa.civicaddress_id, bak.civicaddress_id,
coa.address_x, bak.address_x,
coa.address_y, bak.address_y,
coa.address_full, bak.address_full,
coa.address_number, bak.address_number,
coa.address_unit, bak.address_unit,
coa.address_street_prefix, bak.address_street_prefix,
coa.address_street_name, bak.address_street_name,
coa.address_street_type, bak.address_street_type,
coa.address_street_postdirection, bak.address_street_postdirection,
coa.address_city, bak.address_city,
coa.address_commcode, bak.address_commcode,
coa.address_zipcode, bak.address_zipcode,
coa.location_type, bak.location_type,
coa.address_change_date, bak.address_change_date,
coa.maximo_type, bak.maximo_type,
coa.maximo_seq_num, bak.maximo_seq_num,
coa.asset_code, bak.asset_code,
coa.mrc, bak.mrc,
coa.water_district, bak.water_district,
coa.trash_pickup_day, bak.trash_pickup_day,
coa.jurisdiction_type, bak.jurisdiction_type,
coa.zoning, bak.zoning,
coa.river_district, bak.river_district,
coa.centerline_id, bak.centerline_id,
coa.location_id, bak.location_id,
coa.parent_location_id, bak.parent_location_id,
coa.property_pinnum, bak.property_pinnum,
coa.property_pin, bak.property_pin,
coa.property_pinext, bak.property_pinext,
coa.property_nmptype, bak.property_nmptype,
coa.property_oldpinnum, bak.property_oldpinnum,
coa.property_update_date, bak.property_update_date,
coa.property_update_reason, bak.property_update_reason,
coa.property_deeddate, bak.property_deeddate,
coa.property_taxyear, bak.property_taxyear,
coa.property_deedurl, bak.property_deedurl,
coa.property_platurl, bak.property_platurl,
coa.property_propcardurl, bak.property_propcardurl,
coa.property_acreage, bak.property_acreage,
coa.property_class, bak.property_class,
coa.property_improved, bak.property_improved,
coa.property_exempt, bak.property_exempt,
coa.property_priced, bak.property_priced,
coa.property_totalmarketvalue, bak.property_totalmarketvalue,
coa.property_appraisedvalue, bak.property_appraisedvalue,
coa.property_taxvalue, bak.property_taxvalue,
coa.property_landuse, bak.property_landuse,
coa.property_neighborhoodcode, bak.property_neighborhoodcode,
coa.property_landvalue, bak.property_landvalue,
coa.property_buildingvalue, bak.property_buildingvalue,
coa.property_improvementvalue, bak.property_improvementvalue,
coa.property_appraisalarea, bak.property_appraisalarea,
coa.property_condounit, bak.property_condounit,
coa.property_condobuilding, bak.property_condobuilding,
coa.property_subname, bak.property_subname,
coa.property_sublot, bak.property_sublot,
coa.property_subblock, bak.property_subblock,
coa.property_subsect, bak.property_subsect,
coa.property_township, bak.property_township,
coa.property_stamps, bak.property_stamps,
coa.property_instrument, bak.property_instrument,
coa.property_firedistrict, bak.property_firedistrict,
coa.property_schooldistrict, bak.property_schooldistrict,
coa.owner_name, bak.owner_name,
coa.owner_house_number, bak.owner_house_number,
coa.owner_number_suffix, bak.owner_number_suffix,
coa.owner_direction, bak.owner_direction,
coa.owner_street_name, bak.owner_street_name,
coa.owner_street_type, bak.owner_street_type,
coa.owner_careof, bak.owner_careof,
coa.owner_address, bak.owner_address,
coa.owner_cityname, bak.owner_cityname,
coa.owner_state, bak.owner_state,
coa.owner_zipcode, bak.owner_zipcode,
coa.owner_account_number, bak.owner_account_number,
coa.longitude_wgs, bak.longitude_wgs,
coa.latitude_wgs, bak.latitude_wgs,
coa.recycling_pickup_district, bak.recycling_pickup_district,
coa.recycling_pickup_day, bak.recycling_pickup_day,
coa.gdb_geomattr_data, bak.gdb_geomattr_data,
coa.unit_type, bak.unit_type,
coa.nbrhd_id, bak.nbrhd_id,
coa.nbrhd_name, bak.nbrhd_name,
coa.brushweek, bak.brushweek,
coa.historic_district, bak.historic_district,
coa.local_landmark, bak.local_landmark,
coa.shape, bak.shape,
coa.zoning_links, bak.zoning_links,
FROM internal.coa_bc_address_master coa
left join internal.coa_bc_bak bak
