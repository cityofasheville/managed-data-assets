-- FUNCTION: amd.get_addresses_by_neighborhood(character varying[])

-- DROP FUNCTION amd.get_addresses_by_neighborhood(character varying[]);

CREATE OR REPLACE FUNCTION amd.get_addresses_by_neighborhood(
	cid character varying[])
RETURNS SETOF amd.v_simplicity_addresses 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
    ROWS 1000.0
AS $function$

DECLARE
    r amd.v_simplicity_addresses%rowtype;
BEGIN
	for i in 1..array_length(cid,1) loop
    	FOR r IN
    		SELECT  A.civicaddress_id, A.address_full, A.address_city, A.address_zipcode, 
                A.address_number, A.address_unit, A.address_street_prefix, A.address_street_name, 
                A.latitude_wgs, A.longitude_wgs,
                A.trash_pickup_day, A.recycling_pickup_district, A.recycling_pickup_day, 
                A.zoning, A.owner_name, A.owner_address, A.owner_cityname, A.owner_state, 
                A.owner_zipcode, A.property_pin, A.property_pinext, A.centerline_id,
                A.jurisdiction_type
            FROM amd.v_simplicity_addresses AS A
            LEFT JOIN amd.coa_asheville_neighborhoods AS B
            ON ST_Contains(B.shape, ST_Transform(ST_SetSRID(ST_Point(A.longitude_wgs, A.latitude_wgs),4326),2264))
            WHERE B.nbhd_id = cid[i]
		LOOP
			RETURN NEXT r; -- return current row of SELECT
        END LOOP;
    END LOOP;
    RETURN;
END

$function$;
