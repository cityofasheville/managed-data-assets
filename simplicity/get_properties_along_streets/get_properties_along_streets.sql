CREATE OR REPLACE FUNCTION amd.get_properties_along_streets(cid integer[], ldist number)
    RETURNS SETOF amd.v_simplicity_properties
    LANGUAGE 'plpgsql'
    VOLATILE
    COST 100.0ROWS 1000.0
AS $function$DECLARE
    r amd.v_simplicity_properties%rowtype;
BEGIN
	for i in 1..array_length(cid,1) loop
    	FOR r IN
    		SELECT A.pin, A.pinext, A.pinnum, A.address, A.exempt, A.acreage, A.owner,
                   A.cityname, A.zipcode, A.totalmarketvalue, A.appraisedvalue, A.taxvalue,
                   A.landvalue, A.buildingvalue, A.propcard, A.deedurl, A.platurl,
                   A.appraisalarea, A.neighborhoodcode, A.shape, A.civicaddress_id,
                   A.lattitude, A.longitude, A.zoning, A.owner_address
            FROM amd.v_simplicity_properties AS A
            LEFT JOIN amd.bc_street AS B
            ON ST_DWithin(B.shape, A.shape, number)
            WHERE B.civicaddress_id = cid[i]
		LOOP
			RETURN NEXT r; -- return current row of SELECT
        END LOOP;
    END LOOP;
    RETURN;
END
$function$;