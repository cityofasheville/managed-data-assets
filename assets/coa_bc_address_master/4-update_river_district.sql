-- Update river district
UPDATE r_it.coa_bc_address_master
SET 
  river_district = riverupdate.river_district
FROM (
  select 
    pin,
    river_district
  from (
    select distinct
              prop.pin,
              case
                when districts = 'RIVER' THEN 'Yes'
                else 'No'
              end as river_district
            from r_it.bc_property prop
            left join (
              select districts, shape as rshape
              from r_it.coa_districts_zoning
              where districts = 'RIVER'
            ) as river
            on (st_intersects(river.rshape, prop.shape))
  ) as a
) as riverupdate
where r_it.coa_bc_address_master.property_pin = riverupdate.pin;
