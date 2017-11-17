CREATE OR REPLACE VIEW amd.v_mda_permits_xy AS
 SELECT a.permit_num,
    a.permit_group,
    a.permit_type,
    a.permit_subtype,
    a.permit_category,
    a.permit_description,
    a.applicant_name,
    a.applied_date,
    a.status_current,
    a.status_date,
    a.civic_address_id,
    a.address,
    a.contractor_name,
    a.contractor_license_number,
    b.address_x,
    b.address_y,
    b.lattitude,
    b.longitude
   FROM amd.mda_permits a
     LEFT JOIN amd.coa_bc_address_master b ON a.civic_address_id::text = b.civicaddress_id::character varying(50)::text;



