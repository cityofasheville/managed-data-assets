SELECT 	LAST_SYNC as last_inventory, 
		MACHINE.NAME AS asset_name, 
        OS_NAME as os_description, 
            CASE 
				WHEN TRIM(OS_NAME) LIKE '%Windows 7%' THEN 'Windows 7'
				WHEN TRIM(OS_NAME) LIKE '%Windows 10%' THEN 'Windows 10'
				WHEN TRIM(OS_NAME) LIKE '%Windows 8.1%' THEN 'Windows 8.1'
				WHEN TRIM(OS_NAME) LIKE '%Windows XP%' THEN 'Windows XP'
				WHEN TRIM(OS_NAME) LIKE '%macOS%' THEN 'Mac OS'
                ELSE NULL
			END as os_description_trimmed,
        OS_ARCH as os_architecture, 
        MACHINE.IP as ip_address, 
        CS_MANUFACTURER as vendor_name, 
        CS_MODEL as asset_model, 
        PROCESSORS as cpu_description, 
        round((RAM_TOTAL/1024),0) as ram_gb, 
        round(SUM(MACHINE_DISKS.DISK_USED),0) AS hdd_used, 
        round(SUM(MACHINE_DISKS.DISK_SIZE),0) AS hdd_capacity, 
        USER_10023.FULL_NAME AS user_full_name, 
        MACHINE.USER_NAME as user_login_name, 
        ASSET_DATA_5.FIELD_10026 as last_user, 
        ASSET_DATA_5.FIELD_10021 as asset_class, 
        ASSET_DATA_5.FIELD_10002 as date_received, 
        A10015.NAME AS dept_name, 
        SYSTEM_DESCRIPTION as system_description, 
        LAST_REBOOT as last_boot, 
        USER_FULLNAME as ad_fullname, 
        USER_LOGGED as ad_account, 
        BIOS_MANUFACTURER as bios_vendor, 
        BIOS_NAME as bios_name, 
        BIOS_RELEASE_DATE as bios_release_date, 
        BIOS_VERSION as bios_version, 
        CSP_ID_NUMBER as asset_serial, 
        VIDEO_CONTROLLERS as video_controller, 
        ASSET_DATA_5.FIELD_10006 as tid_number, 
        ASSET_DATA_5.FIELD_10009 as lte_number, 
        ASSET_DATA_5.FIELD_10010 as meid_number, 
        ASSET_DATA_5.FIELD_45 as po_number, 
        ASSET_DATA_5.FIELD_10011 as refurb_date, 
        ASSET_DATA_5.FIELD_10004 as asset_status, 
        ASSET_DATA_5.FIELD_10020 as zap_status, 
        REPLACE(ASSET_DATA_5.FIELD_48, '$', '') as asset_cost, 
        ASSET_DATA_5.FIELD_85 as contact_name, 
        A10025.NAME AS office_version,
			CASE 
				WHEN YEAR(ASSET_DATA_5.FIELD_10002) = 0 THEN NULL
                WHEN MONTH(ASSET_DATA_5.FIELD_10002) >= 7  THEN (YEAR(ASSET_DATA_5.FIELD_10002) + 1)
                WHEN MONTH(ASSET_DATA_5.FIELD_10002) < 7  THEN (YEAR(ASSET_DATA_5.FIELD_10002))
                ELSE NULL
			END as purchased_fy,
            CASE 
				WHEN YEAR(ASSET_DATA_5.FIELD_10002) = 0 THEN NULL
                WHEN MONTH(ASSET_DATA_5.FIELD_10002) >= 7  THEN (YEAR(ASSET_DATA_5.FIELD_10002) + 5)
                WHEN MONTH(ASSET_DATA_5.FIELD_10002) < 7  THEN (YEAR(ASSET_DATA_5.FIELD_10002) + 4)
                ELSE NULL
			END as replace_fy,
            CASE 
				WHEN YEAR(ASSET_DATA_5.FIELD_10002) = 0 THEN NULL
                ELSE TIMESTAMPDIFF(MONTH, ASSET_DATA_5.FIELD_10002, NOW())
			END as service_months

FROM MACHINE  LEFT JOIN MACHINE_DISKS ON (MACHINE_DISKS.ID = MACHINE.ID) LEFT JOIN ASSET ON ASSET.MAPPED_ID = MACHINE.ID AND ASSET.ASSET_TYPE_ID=5 LEFT JOIN USER USER_10023 ON USER_10023.ID = ASSET.OWNER_ID LEFT JOIN ASSET_DATA_5 ON ASSET_DATA_5.ID = ASSET.ASSET_DATA_ID LEFT JOIN ASSET_ASSOCIATION J10015 ON J10015.ASSET_ID = ASSET.ID AND J10015.ASSET_FIELD_ID=10015
                                 LEFT JOIN ASSET A10015 ON A10015.ID = J10015.ASSOCIATED_ASSET_ID LEFT JOIN ASSET ASSET_LOCATION ON ASSET_LOCATION.ID = ASSET.LOCATION_ID LEFT JOIN ASSET_ASSOCIATION J10016 ON J10016.ASSET_ID = ASSET.ID AND J10016.ASSET_FIELD_ID=10016
                                 LEFT JOIN ASSET A10016 ON A10016.ID = J10016.ASSOCIATED_ASSET_ID LEFT JOIN ASSET_ASSOCIATION J10017 ON J10017.ASSET_ID = ASSET.ID AND J10017.ASSET_FIELD_ID=10017
                                 LEFT JOIN ASSET A10017 ON A10017.ID = J10017.ASSOCIATED_ASSET_ID LEFT JOIN ASSET_ASSOCIATION J10025 ON J10025.ASSET_ID = ASSET.ID AND J10025.ASSET_FIELD_ID=10025
                                 LEFT JOIN ASSET A10025 ON A10025.ID = J10025.ASSOCIATED_ASSET_ID   

WHERE ((OS_NAME not like '%Server%'))  
                                 
GROUP BY MACHINE.ID ORDER BY OS_NAME, LAST_SYNC desc