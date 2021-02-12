


-- internal2.capital_projects_master definition

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

START TRANSACTION;
DELETE FROM internal2.capital_projects_master;
INSERT INTO internal2.capital_projects_master
(gis_id, munis_project_number, project, display_name, location_details, zip_code, "type", category, coa_contact, phone_number, email_address, owner_department, 
administering_department, project_description, map_tab, status, total_project_funding__budget_document_, target_construction_start, target_construction_end, 
actual_construction_end, amount_behind_schedule, estimated_construction_duration, project_folder, project_webpage__more_information_, communication_plan, 
photo_url, project_updates)
SELECT gis_id, munis_project_number, project, display_name, location_details, zip_code, "type", category, coa_contact, phone_number, email_address, owner_department, 
administering_department, project_description, map_tab, status, total_project_funding__budget_document_, target_construction_start, target_construction_end, 
actual_construction_end, amount_behind_schedule, estimated_construction_duration, project_folder, project_webpage__more_information_, NULL as communication_plan,
photo_url, project_updates
FROM bedrock_temp_data.capital_projects_master;
COMMIT;



