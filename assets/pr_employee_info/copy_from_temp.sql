-- Hire_date is an alias for hire_date_last
START TRANSACTION;
DELETE FROM internal2.pr_employee_info;
INSERT INTO internal2.pr_employee_info
(emp_id, active, employee, emp_email, ft_status, "position", dept_id, department, div_id, division, sup_id, supervisor, sup_email, 
gender, race, eth_hispanic, eth_amer_ind, eth_asian, eth_black, eth_hawaiin, eth_white, hire_date_original, hire_date_last, hire_date, term_date_last, 
years_of_service_est, other_emp_id, age, age_at_hire, age_at_term)
SELECT emp_id, active, employee, emp_email, ft_status, "position", dept_id, department, div_id, division, sup_id, supervisor, sup_email, 
gender, race, eth_hispanic, eth_amer_ind, eth_asian, eth_black, eth_hawaiin, eth_white, hire_date_original, hire_date_last, hire_date_last, term_date_last, 
years_of_service_est, other_emp_id, age, age_at_hire, age_at_term
FROM bedrock_temp_data.pr_employee_info;
COMMIT;