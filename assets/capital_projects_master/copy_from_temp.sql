-- Each table has its own serial objectid so they won't match.  communication_plan does not exist in source (inserted as null here to not break things)
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
