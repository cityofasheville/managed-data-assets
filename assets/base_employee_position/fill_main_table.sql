truncate table standard.base_employee_position;
insert into standard.base_employee_position
select * from standard.base_employee_position_temp;
drop table standard.base_employee_position_temp;