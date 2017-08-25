-- Update river district
UPDATE amd.coa_bc_address_master
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
            from amd.bc_property prop
            left join (
              select districts, shape as rshape
              from amd.coa_districts_zoning
              where districts = 'RIVER'
            ) as river
            on (st_intersects(river.rshape, prop.shape))
  ) as a
) as riverupdate
where amd.coa_bc_address_master.property_pin = riverupdate.pin;
