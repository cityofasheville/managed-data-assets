-- Update historic district and local landmark status
UPDATE r_it.coa_bc_address_master
SET 
  historic_district = h.historic_district,
  local_landmark = h.local_landmark
FROM (
    select distinct
              a.civicaddress_id,
              hist.historic_district_name as historic_district,
              land.ll_name as local_landmark
            from r_it.coa_bc_address_master as a
            LEFT OUTER JOIN r_it.coa_local_historic_landmarks as land
            on (a.property_pinnum = land.new_pin)
            LEFT OUTER JOIN r_it.coa_overlay_historic_districts_property_view as hist
            on (a.property_pinnum = hist.pinnum)
) as h
where r_it.coa_bc_address_master.civicaddress_id = h.civicaddress_id;
