truncate table standard.base_employee;
insert into standard.base_employee
select * from standard.base_employee_temp;
drop table standard.base_employee_temp;