-- Any changes between incoming data and yesterday's data are logged in events table
INSERT INTO standard.events_base_employee_position
(changedfieldname, primkey, oldval, newval, changeddate)
select * from standard.find_events('base_employee_position' , 'base_employee_position_temp' , 'employee_id' )