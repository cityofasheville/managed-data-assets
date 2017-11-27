# Work Plan


## amd.coa_bc_address_master dependent objects
* view amd.v_mda_permits_xy
* view amd.v_simplicity_permits (via view amd.v_mda_permits_xy)
* function amd.get_permits_along_streets() via amd.v_simplicity_permits
* view amd.v_simplicity_properties
* function amd.get_properties_along_streets() via amd.v_simplicity_properties
* function amd.get_search_addresses()

