-- Any changes between incoming data and yesterday's data are logged in events table
INSERT INTO standard.events_base_employee
(changedfieldname, primkey, oldval, newval, changeddate)
select * from standard.find_events('base_employee' , 'base_employee_temp' , 'employee_id' )