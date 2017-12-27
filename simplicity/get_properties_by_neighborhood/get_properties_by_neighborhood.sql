-- FUNCTION: amd.get_properties_by_neighborhood(numeric[])
-- DROP FUNCTION amd.get_properties_by_neighborhood(character varying[]);

CREATE OR REPLACE FUNCTION amd.get_properties_by_neighborhood(
	cid character varying[])
RETURNS SETOF amd.v_simplicity_properties 
    LANGUAGE 'plpgsql'
    COST 100.0
    VOLATILE 
    ROWS 1000.0
AS $function$

DECLARE
    r amd.v_simplicity_properties%rowtype;
BEGIN
	for i in 1..array_length(cid,1) loop
    	FOR r IN
    		SELECT a.pin,
                A.pinext,
                A.pinnum,
                A.address,
                A.exempt,
                A.acreage,
                A.owner,
                A.cityname,
                A.zipcode,
                A.totalmarketvalue,
                A.appraisedvalue,
                A.taxvalue,
                A.landvalue,
                A.buildingvalue,
                A.propcard,
                A.deedurl,
                A.platurl,
                A.appraisalarea,
                A.neighborhoodcode,
                A.shape,
                A.civicaddress_id,
                A.latitude_wgs,
                A.longitude_wgs,
                A.zoning,
                A.owner_address,
                A.location_type,
                A.polygon
            FROM amd.v_simplicity_properties AS A
            LEFT JOIN amd.coa_asheville_neighborhoods AS B
            ON ST_Intersects(B.shape, A.shape)
            -- ON ST_Contains(B.shape, ST_Transform(ST_SetSRID(ST_Point(A.longitude_wgs, A.latitude_wgs),4326),2264))            
            WHERE B.nbhd_id = cid[i]
		LOOP
			RETURN NEXT r; -- return current row of SELECT
        END LOOP;
    END LOOP;
    RETURN;
END

$function$;


