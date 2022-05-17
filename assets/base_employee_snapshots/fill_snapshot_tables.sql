select current_date as date_entered, employee_id, active, "sensitive", first_name, last_name, primary_email, alt_email, 
hire_date_original, hire_date_last, termination_date_last, is_supervisor, supervisee_count, phone_desk, phone_cell, 
ad_username, ad_memberships, google_memberships
into standard.snapshot_base_employee
FROM standard.base_employee;

SELECT current_date as date_entered, employee_id, position_id, position_name, ft_status, supervisor_id, 
division_id, division, department_id, department, job_class, grade, step, group_bu, risk_code, eeo_class, eeo_function, annual_base_pay
into standard.snapshot_base_employee_position
FROM standard.base_employee_position;