
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
          from coagis.bc_property prop
          left join (
            select districts, shape as rshape
            from coagis.coa_districts_zoning
            where districts = 'RIVER'
          ) as river
          on (st_intersects(river.rshape, prop.shape))
) as a
where a.river_district <> 'No'
    