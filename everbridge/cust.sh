#!/usr/bin/bash

# Load employees and water customers to Everbridge
"C:\Program Files\PuTTY\psftp.exe" -i "C:\Users\mssqlgisadmin\.ssh\City+of+Asheville+-+Citizens.ppk" -b "C:\coa\managed-data-assets\everbridge\cust.scr"
