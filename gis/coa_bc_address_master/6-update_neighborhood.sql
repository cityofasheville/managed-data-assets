-- Update neighborhood
UPDATE amd.coa_bc_address_master
SET 
  nbrhd_id = nbrhoods.nbrhd_id,
  nbrhd_name = nbrhoods.name
FROM (
    select distinct
              n.nbhd_id as nbrhd_id,
              n.name,
              a.civicaddress_id
            from amd.coa_bc_address_master as a
            LEFT OUTER JOIN amd.coa_asheville_neighborhoods n
            on (st_contains(n.shape, a.shape))
) as nbrhoods
where amd.coa_bc_address_master.civicaddress_id = nbrhoods.civicaddress_id;
