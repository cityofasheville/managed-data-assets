#!/usr/bin/bash

# Load employees and water customers to Everbridge
"C:\Program Files\PuTTY\psftp.exe" -i "C:\Users\mssqlgisadmin\.ssh\City+of+Asheville+-+Employee.ppk"  -b "C:\jon\managed-data-assets-jon\everbridge\emp.scr"

#version using pageant:
#"C:\Program Files\PuTTY\pageant.exe" "C:\Users\mssqlgisadmin\.ssh\City+of+Asheville+-+Citizens.ppk" "C:\Users\mssqlgisadmin\.ssh\City+of+Asheville+-+Employee.ppk"
#"C:\Program Files\PuTTY\psftp.exe" -b "C:\jon\managed-data-assets-jon\everbridge\ftp_cust.scr"
#"C:\Program Files\PuTTY\psftp.exe" -b "C:\jon\managed-data-assets-jon\everbridge\ftp_emp.scr"
