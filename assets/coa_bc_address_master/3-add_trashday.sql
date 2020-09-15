-- Update trash pickup day
UPDATE r_it.coa_bc_address_master
SET 
 trash_pickup_day = public_works_districts.truckday,
 recycling_pickup_district = public_works_districts.recdistrict,
 recycling_pickup_day = public_works_districts.recday,
 brushweek = public_works_districts.brushweek
 FROM (
    SELECT DISTINCT
      r_it.bc_location.location_id, 
      pw.truckday,
      pw.recdistrict,
      pw.recday,
      CASE
        WHEN pw.brushweek LIKE 'opposite%' AND pw.recdistrict = 'A' THEN 'B'
        WHEN pw.brushweek LIKE 'opposite%' AND pw.recdistrict = 'B' THEN 'A'
        WHEN pw.brushweek IS NULL THEN NULL
        ELSE pw.recdistrict
      END as brushweek
    FROM
      r_it.bc_location
    LEFT JOIN 
      r_it.coa_districts_public_works as pw
    ON
      st_contains(pw.shape,r_it.bc_location.shape)
  ) as public_works_districts 
WHERE r_it.coa_bc_address_master.location_id = public_works_districts.location_id;

