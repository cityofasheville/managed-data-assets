DROP TABLE internal.bc_property_account_master cascade;

CREATE TABLE internal.bc_property_account_master (
	am_account_no int4 NOT NULL,
	am_owner_type varchar(3) NULL,
	am_last_name varchar(80) NULL,
	am_first_name varchar(35) NULL,
	am_middle_name varchar(35) NULL,
	am_name_suffix varchar(5) NULL,
	am_address1 varchar(35) NULL,
	am_address2 varchar(35) NULL,
	am_address3 varchar(50) NULL,
	am_city varchar(20) NULL,
	am_state varchar(2) NULL,
	am_zip varchar(5) NULL,
	am_zip_plus4 varchar(4) NULL,
	am_foreign_address_flag varchar(1) NULL,
	am_foreign_country varchar(20) NULL,
	am_foreign_zip varchar(10) NULL,
	am_exempt_account_flag varchar(1) NULL,
	am_bad_address_flag varchar(1) NULL,
	am_bypass_postal_flag varchar(1) NULL,
	am_last_update_date timestamp NULL,
	am_last_update_user varchar(3) NULL,
	pkam_account_no int4 NOT NULL,
	CONSTRAINT pkam_account_no PRIMARY KEY (pkam_account_no)
);
CREATE OR REPLACE VIEW "open".bc_property_account_master
AS SELECT bc_property_account_master.am_account_no,
    bc_property_account_master.am_address1,
    bc_property_account_master.am_address2,
    bc_property_account_master.am_address3,
    bc_property_account_master.am_bad_address_flag,
    bc_property_account_master.am_bypass_postal_flag,
    bc_property_account_master.am_city,
    bc_property_account_master.am_exempt_account_flag,
    bc_property_account_master.am_first_name,
    bc_property_account_master.am_foreign_address_flag,
    bc_property_account_master.am_foreign_country,
    bc_property_account_master.am_foreign_zip,
    bc_property_account_master.am_last_name,
    bc_property_account_master.am_last_update_date,
    bc_property_account_master.am_last_update_user,
    bc_property_account_master.am_middle_name,
    bc_property_account_master.am_name_suffix,
    bc_property_account_master.am_owner_type,
    bc_property_account_master.am_state,
    bc_property_account_master.am_zip,
    bc_property_account_master.am_zip_plus4,
    bc_property_account_master.pkam_account_no
   FROM internal.bc_property_account_master;


-- TO GO BACK:

CREATE TABLE internal.bc_property_account_master (
	am_account_no varchar(200) NULL,
	am_address1 varchar(200) NULL,
	am_address2 varchar(200) NULL,
	am_address3 varchar(200) NULL,
	am_bad_address_flag varchar(200) NULL,
	am_bypass_postal_flag varchar(200) NULL,
	am_city varchar(200) NULL,
	am_exempt_account_flag varchar(200) NULL,
	am_first_name varchar(200) NULL,
	am_foreign_address_flag varchar(200) NULL,
	am_foreign_country varchar(200) NULL,
	am_foreign_zip varchar(200) NULL,
	am_last_name varchar(200) NULL,
	am_last_update_date varchar(200) NULL,
	am_last_update_user varchar(200) NULL,
	am_middle_name varchar(200) NULL,
	am_name_suffix varchar(200) NULL,
	am_owner_type varchar(200) NULL,
	am_state varchar(200) NULL,
	am_zip varchar(200) NULL,
	am_zip_plus4 varchar(200) NULL,
	pkam_account_no varchar(200) NULL
);