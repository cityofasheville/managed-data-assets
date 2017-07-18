-- Update trash pickup day
UPDATE ericjackson.coa_bc_address_master
SET 
 trash_pickup_day = public_works_districts.truckday
 FROM (
    SELECT DISTINCT
      coagis.bc_location.location_id, 
      coagis.coa_districts_public_works.truckday
    FROM
      coagis.bc_location
    LEFT JOIN 
      coagis.coa_districts_public_works
    ON
      st_contains(coagis.coa_districts_public_works.shape,coagis.bc_location.shape)
  ) as public_works_districts 
WHERE ericjackson.coa_bc_address_master.location_id = public_works_districts.location_id

