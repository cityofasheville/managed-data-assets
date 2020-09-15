-- Update neighborhood
UPDATE r_it.coa_bc_address_master
SET 
  nbrhd_id = nbrhoods.nbrhd_id,
  nbrhd_name = nbrhoods.name
FROM (
    select distinct
              n.nbhd_id as nbrhd_id,
              n.name,
              a.civicaddress_id
            from r_it.coa_bc_address_master as a
            LEFT OUTER JOIN r_it.coa_asheville_neighborhoods n
            on (st_contains(n.shape, a.shape))
) as nbrhoods
where r_it.coa_bc_address_master.civicaddress_id = nbrhoods.civicaddress_id;
