-- Update trash pickup day
UPDATE amd.coa_bc_address_master
SET 
 trash_pickup_day = public_works_districts.truckday
 FROM (
    SELECT DISTINCT
      amd.bc_location.location_id, 
      amd.coa_districts_public_works.truckday
    FROM
      amd.bc_location
    LEFT JOIN 
      amd.coa_districts_public_works
    ON
      st_contains(amd.coa_districts_public_works.shape,amd.bc_location.shape)
  ) as public_works_districts 
WHERE amd.coa_bc_address_master.location_id = public_works_districts.location_id

