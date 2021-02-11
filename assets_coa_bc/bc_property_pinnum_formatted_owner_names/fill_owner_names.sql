delete from internal2.bc_property_pinnum_formatted_owner_names;
INSERT INTO internal2.bc_property_pinnum_formatted_owner_names
( pinnum, formatted_owner_name )
SELECT property_owner_accounts.pinnum,
array_to_string(array_agg(property_owner_accounts.owner_name ORDER BY property_owner_accounts.accountnum ASC), ' & '::text) AS formatted_owner_name
FROM (
    SELECT unnestedaccounts.pinnum, unnestedaccounts.accountnum,
           array_to_string(array_remove(ARRAY[
           btrim(internal2.bc_property_account_master.am_last_name::text, ' '::text), 
           btrim(internal2.bc_property_account_master.am_name_suffix::text, ' '::text), 
           btrim(internal2.bc_property_account_master.am_first_name::text, ' '::text), 
           btrim(internal2.bc_property_account_master.am_middle_name::text, ' '::text)], ''::text), ' '::text) AS owner_name
          FROM internal2.bc_property_account_master, 
          (SELECT internal2.bc_property.pinnum,
          unnest(regexp_split_to_array(internal2.bc_property.accountnumber::text, ';'::text)) AS accountnum
          FROM internal2.bc_property ) as unnestedaccounts
         WHERE unnestedaccounts.accountnum = internal2.bc_property_account_master.am_account_no::text order by accountnum ASC) AS property_owner_accounts
         GROUP BY property_owner_accounts.pinnum; 