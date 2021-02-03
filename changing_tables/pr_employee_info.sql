-- internal2.pr_employee_info definition

-- Drop table

-- DROP TABLE internal2.pr_employee_info;

CREATE TABLE internal2.pr_employee_info (
	emp_id int4 NOT NULL,
	active varchar(1) NOT NULL,
	employee varchar(67) NULL,
	emp_email bpchar(50) NULL,
	ft_status bpchar(2) NULL,
	"position" bpchar(80) NULL,
	dept_id varchar(2) NULL,
	department varchar(50) NULL,
	div_id bpchar(4) NULL,
	division varchar(50) NULL,
	sup_id int4 NULL,
	supervisor varchar(67) NULL,
	sup_email bpchar(50) NULL,
	gender bpchar(1) NULL,
	race bpchar(2) NULL,
	eth_hispanic varchar(1) NULL,
	eth_amer_ind varchar(1) NULL,
	eth_asian varchar(1) NULL,
	eth_black varchar(1) NULL,
	eth_hawaiin varchar(1) NULL,
	eth_white varchar(1) NULL,
	hire_date_original timestamp NULL,
	hire_date_last timestamp NULL,
	-- hire_date timestamp GENERATED ALWAYS AS hire_date_last STORED,
	term_date_last timestamp NULL,
	years_of_service_est numeric(8,2) NULL,
	other_emp_id bpchar(30) NULL,
	age numeric(8,2) NULL,
	age_at_hire numeric(8,2) NULL,
	age_at_term numeric(8,2) NULL
);

-- internal.pr_employee_info definition

-- Drop table

-- DROP TABLE internal.pr_employee_info;

CREATE TABLE internal.pr_employee_info (
	emp_id int4 NULL,
	active varchar(1) NULL,
	employee varchar(67) NULL,
	emp_email bpchar(50) NULL,
	ft_status bpchar(2) NULL,
	"position" bpchar(20) NULL,
	dept_id varchar(2) NULL,
	department varchar(50) NULL,
	div_id bpchar(4) NULL,
	division varchar(50) NULL,
	sup_id int4 NULL,
	supervisor varchar(67) NULL,
	sup_email bpchar(50) NULL,
	hire_date timestamp NULL,
	other_emp_id varchar(30) NULL
);

-- internal.vabc source

CREATE OR REPLACE VIEW internal.vabc
AS SELECT e.emp_id,
    e.active,
    e.employee,
    e.emp_email,
    e.ft_status,
    e."position",
    e.dept_id,
    e.department,
    e.div_id,
    e.division,
    e.sup_id,
    e.supervisor,
    e.sup_email,
    e.hire_date,
    a.ad_username,
    a.ad_memberships
   FROM internal.pr_employee_info e
     LEFT JOIN internal.ad_info a ON e.emp_id = a.emp_id;
     
    -- internal.employees_main_view source

CREATE OR REPLACE VIEW internal.employees_main_view
AS SELECT e.emp_id,
    e.active,
    e.employee,
    e.emp_email,
    e.ft_status,
    e."position",
    e.dept_id,
    e.department,
    e.div_id,
    e.division,
    e.sup_id,
    e.supervisor,
    e.sup_email,
    e.hire_date,
    a.ad_username,
    a.ad_memberships
   FROM internal.pr_employee_info e
     LEFT JOIN internal.ad_info a ON e.emp_id = a.emp_id;
     
    
    -- bc.fire_pr_accrual_hours_balances source

CREATE OR REPLACE VIEW bc.fire_pr_accrual_hours_balances
AS SELECT b.employee_id,
    b.vacation,
    b.sick,
    b.comp,
    b.holiday,
    b.fmla,
    b.military,
    e.department,
    e.division,
    e.other_emp_id
   FROM internal.pr_accrual_hours_balances b
     LEFT JOIN internal.pr_employee_info e ON b.employee_id = e.emp_id
  WHERE e.div_id ~~ '11%'::text;
