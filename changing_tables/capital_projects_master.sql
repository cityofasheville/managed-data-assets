


-- internal.capital_projects_master definition

-- DROP TABLE internal2.capital_projects_master;

CREATE TABLE internal2.capital_projects_master (
	gis_id text NULL,
	munis_project_number text NULL,
	project text NULL,
	display_name text NULL,
	location_details text NULL,
	zip_code text NULL,
	"type" text NULL,
	category text NULL,
	coa_contact text NULL,
	phone_number text NULL,
	email_address text NULL,
	owner_department text NULL,
	administering_department text NULL,
	project_description text NULL,
	map_tab text NULL,
	status text NULL,
	total_project_funding__budget_document_ text NULL,
	target_construction_start text NULL,
	target_construction_end text NULL,
	actual_construction_end text NULL,
	amount_behind_schedule text NULL,
	estimated_construction_duration text NULL,
	project_folder text NULL,
	project_webpage__more_information_ text NULL,
	communication_plan text NULL,
	photo_url text NULL,
	project_updates text NULL,
	objectid serial NOT NULL
);

-- internal2.capital_projects_master definition

-- DROP TABLE internal2.capital_projects_master;

CREATE TABLE bedrock_temp_data.capital_projects_master (
	gis_id text NULL,
	munis_project_number text NULL,
	project text NULL,
	display_name text NULL,
	location_details text NULL,
	zip_code text NULL,
	"type" text NULL,
	category text NULL,
	coa_contact text NULL,
	phone_number text NULL,
	email_address text NULL,
	owner_department text NULL,
	administering_department text NULL,
	project_description text NULL,
	map_tab text NULL,
	status text NULL,
	total_project_funding__budget_document_ text NULL,
	target_construction_start text NULL,
	target_construction_end text NULL,
	actual_construction_end text NULL,
	amount_behind_schedule text NULL,
	estimated_construction_duration text NULL,
	project_folder text NULL,
	project_webpage__more_information_ text NULL,
	photo_url text NULL,
	project_updates text NULL,
	objectid serial NOT NULL,
	CONSTRAINT capital_projects_master_pkey PRIMARY KEY (objectid)
);

-- "open".capital_projects_master source

CREATE OR REPLACE VIEW "open".capital_projects_master
AS SELECT capital_projects_master.gis_id,
    capital_projects_master.munis_project_number,
    capital_projects_master.project,
    capital_projects_master.display_name,
    capital_projects_master.location_details,
    capital_projects_master.zip_code,
    capital_projects_master.type,
    capital_projects_master.category,
    capital_projects_master.coa_contact,
    capital_projects_master.phone_number,
    capital_projects_master.email_address,
    capital_projects_master.owner_department,
    capital_projects_master.administering_department,
    capital_projects_master.project_description,
    capital_projects_master.map_tab,
    capital_projects_master.status,
    capital_projects_master.total_project_funding__budget_document_,
    capital_projects_master.target_construction_start,
    capital_projects_master.target_construction_end,
    capital_projects_master.actual_construction_end,
    capital_projects_master.amount_behind_schedule,
    capital_projects_master.estimated_construction_duration,
    capital_projects_master.project_folder,
    capital_projects_master.project_webpage__more_information_,
    capital_projects_master.communication_plan,
    capital_projects_master.photo_url,
    capital_projects_master.project_updates,
    capital_projects_master.objectid
   FROM internal.capital_projects_master;
