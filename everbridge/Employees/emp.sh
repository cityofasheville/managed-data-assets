#!/usr/bin/bash

# Load employees and water customers to Everbridge
"C:\Program Files\PuTTY\psftp.exe" -i "C:\Users\mssqlgisadmin\.ssh\City+of+Asheville+-+Employee.ppk"  -b ".\emp.scr"

#version using pageant:
#"C:\Program Files\PuTTY\pageant.exe" "C:\Users\mssqlgisadmin\.ssh\City+of+Asheville+-+Employee.ppk"
#"C:\Program Files\PuTTY\psftp.exe" -b ".\emp.scr"
