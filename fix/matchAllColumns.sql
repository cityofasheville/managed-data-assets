-- ^ (.*) => case when i.$1 = ii.$1 then 1 else 0 end as "$1", i.$1, ii.$1,
-- ^ (.*) => case when i.$1 = ii.$1 then 1 else 0 end as "$1",

SELECT
case when i.objectid = ii.objectid then 1 else 0 end as "objectid",
case when i.civicaddress_id = ii.civicaddress_id then 1 else 0 end as "civicaddress_id",
case when i.address_x = ii.address_x then 1 else 0 end as "address_x",
case when i.address_y = ii.address_y then 1 else 0 end as "address_y",
case when i.address_full = ii.address_full then 1 else 0 end as "address_full",
case when i.address_number = ii.address_number then 1 else 0 end as "address_number",
case when i.address_unit = ii.address_unit then 1 else 0 end as "address_unit",
case when i.address_street_prefix = ii.address_street_prefix then 1 else 0 end as "address_street_prefix",
case when i.address_street_name = ii.address_street_name then 1 else 0 end as "address_street_name",
case when i.address_street_type = ii.address_street_type then 1 else 0 end as "address_street_type",
case when i.address_street_postdirection = ii.address_street_postdirection then 1 else 0 end as "address_street_postdirection",
case when i.address_city = ii.address_city then 1 else 0 end as "address_city",
case when i.address_commcode = ii.address_commcode then 1 else 0 end as "address_commcode",
case when i.address_zipcode = ii.address_zipcode then 1 else 0 end as "address_zipcode",
case when i.location_type = ii.location_type then 1 else 0 end as "location_type",
case when i.address_change_date = ii.address_change_date then 1 else 0 end as "address_change_date",
case when i.maximo_type = ii.maximo_type then 1 else 0 end as "maximo_type",
case when i.maximo_seq_num = ii.maximo_seq_num then 1 else 0 end as "maximo_seq_num",
case when i.asset_code = ii.asset_code then 1 else 0 end as "asset_code",
case when i.mrc = ii.mrc then 1 else 0 end as "mrc",
case when i.water_district = ii.water_district then 1 else 0 end as "water_district",
case when i.trash_pickup_day = ii.trash_pickup_day then 1 else 0 end as "trash_pickup_day",
case when i.jurisdiction_type = ii.jurisdiction_type then 1 else 0 end as "jurisdiction_type",
case when i.zoning = ii.zoning then 1 else 0 end as "zoning",
case when i.river_district = ii.river_district then 1 else 0 end as "river_district",
case when i.centerline_id = ii.centerline_id then 1 else 0 end as "centerline_id",
case when i.location_id = ii.location_id then 1 else 0 end as "location_id",
case when i.parent_location_id = ii.parent_location_id then 1 else 0 end as "parent_location_id",
case when i.property_pinnum = ii.property_pinnum then 1 else 0 end as "property_pinnum",
case when i.property_pin = ii.property_pin then 1 else 0 end as "property_pin",
case when i.property_pinext = ii.property_pinext then 1 else 0 end as "property_pinext",
case when i.property_nmptype = ii.property_nmptype then 1 else 0 end as "property_nmptype",
case when i.property_oldpinnum = ii.property_oldpinnum then 1 else 0 end as "property_oldpinnum",
case when i.property_update_date = ii.property_update_date then 1 else 0 end as "property_update_date",
case when i.property_update_reason = ii.property_update_reason then 1 else 0 end as "property_update_reason",
case when i.property_deeddate = ii.property_deeddate then 1 else 0 end as "property_deeddate",
case when i.property_taxyear = ii.property_taxyear then 1 else 0 end as "property_taxyear",
case when i.property_deedurl = ii.property_deedurl then 1 else 0 end as "property_deedurl",
case when i.property_platurl = ii.property_platurl then 1 else 0 end as "property_platurl",
case when i.property_propcardurl = ii.property_propcardurl then 1 else 0 end as "property_propcardurl",
case when i.property_acreage = ii.property_acreage then 1 else 0 end as "property_acreage",
case when i.property_class = ii.property_class then 1 else 0 end as "property_class",
case when i.property_improved = ii.property_improved then 1 else 0 end as "property_improved",
case when i.property_exempt = ii.property_exempt then 1 else 0 end as "property_exempt",
case when i.property_priced = ii.property_priced then 1 else 0 end as "property_priced",
case when i.property_totalmarketvalue = ii.property_totalmarketvalue then 1 else 0 end as "property_totalmarketvalue",
case when i.property_appraisedvalue = ii.property_appraisedvalue then 1 else 0 end as "property_appraisedvalue",
case when i.property_taxvalue = ii.property_taxvalue then 1 else 0 end as "property_taxvalue",
case when i.property_landuse = ii.property_landuse then 1 else 0 end as "property_landuse",
case when i.property_neighborhoodcode = ii.property_neighborhoodcode then 1 else 0 end as "property_neighborhoodcode",
case when i.property_landvalue = ii.property_landvalue then 1 else 0 end as "property_landvalue",
case when i.property_buildingvalue = ii.property_buildingvalue then 1 else 0 end as "property_buildingvalue",
case when i.property_improvementvalue = ii.property_improvementvalue then 1 else 0 end as "property_improvementvalue",
case when i.property_appraisalarea = ii.property_appraisalarea then 1 else 0 end as "property_appraisalarea",
case when i.property_condounit = ii.property_condounit then 1 else 0 end as "property_condounit",
case when i.property_condobuilding = ii.property_condobuilding then 1 else 0 end as "property_condobuilding",
case when i.property_subname = ii.property_subname then 1 else 0 end as "property_subname",
case when i.property_sublot = ii.property_sublot then 1 else 0 end as "property_sublot",
case when i.property_subblock = ii.property_subblock then 1 else 0 end as "property_subblock",
case when i.property_subsect = ii.property_subsect then 1 else 0 end as "property_subsect",
case when i.property_township = ii.property_township then 1 else 0 end as "property_township",
case when i.property_stamps = ii.property_stamps then 1 else 0 end as "property_stamps",
case when i.property_instrument = ii.property_instrument then 1 else 0 end as "property_instrument",
case when i.property_firedistrict = ii.property_firedistrict then 1 else 0 end as "property_firedistrict",
case when i.property_schooldistrict = ii.property_schooldistrict then 1 else 0 end as "property_schooldistrict",
case when i.owner_name = ii.owner_name then 1 else 0 end as "owner_name",
case when i.owner_house_number = ii.owner_house_number then 1 else 0 end as "owner_house_number",
case when i.owner_number_suffix = ii.owner_number_suffix then 1 else 0 end as "owner_number_suffix",
case when i.owner_direction = ii.owner_direction then 1 else 0 end as "owner_direction",
case when i.owner_street_name = ii.owner_street_name then 1 else 0 end as "owner_street_name",
case when i.owner_street_type = ii.owner_street_type then 1 else 0 end as "owner_street_type",
case when i.owner_careof = ii.owner_careof then 1 else 0 end as "owner_careof",
case when i.owner_address = ii.owner_address then 1 else 0 end as "owner_address",
case when i.owner_cityname = ii.owner_cityname then 1 else 0 end as "owner_cityname",
case when i.owner_state = ii.owner_state then 1 else 0 end as "owner_state",
case when i.owner_zipcode = ii.owner_zipcode then 1 else 0 end as "owner_zipcode",
case when i.owner_account_number = ii.owner_account_number then 1 else 0 end as "owner_account_number",
case when i.longitude_wgs = ii.longitude_wgs then 1 else 0 end as "longitude_wgs",
case when i.latitude_wgs = ii.latitude_wgs then 1 else 0 end as "latitude_wgs",
case when i.recycling_pickup_district = ii.recycling_pickup_district then 1 else 0 end as "recycling_pickup_district",
case when i.recycling_pickup_day = ii.recycling_pickup_day then 1 else 0 end as "recycling_pickup_day",
case when i.gdb_geomattr_data = ii.gdb_geomattr_data then 1 else 0 end as "gdb_geomattr_data",
case when i.unit_type = ii.unit_type then 1 else 0 end as "unit_type",
case when i.nbrhd_id = ii.nbrhd_id then 1 else 0 end as "nbrhd_id",
case when i.nbrhd_name = ii.nbrhd_name then 1 else 0 end as "nbrhd_name",
case when i.brushweek = ii.brushweek then 1 else 0 end as "brushweek",
case when i.historic_district = ii.historic_district then 1 else 0 end as "historic_district",
case when i.local_landmark = ii.local_landmark then 1 else 0 end as "local_landmark",
case when i.shape = ii.shape then 1 else 0 end as "shape",
case when i.zoning_links = ii.zoning_links then 1 else 0 end as "zoning_links"
FROM internal.coa_bc_address_master i
inner join internal.coa_bc_address_master_today ii
using(civicaddress_id)
limit 100
