-- View: coaaux.v_budget_hist_plus_category

-- DROP VIEW coaaux.v_budget_hist_plus_category;

CREATE OR REPLACE VIEW coaaux.v_budget_hist_plus_category AS
 SELECT a.account_type,
    a.account_name,
    a.fund_name,
    a.department_name,
    a.division_name,
    a.costcenter_name,
    a.function_name,
    a.charcode_name,
    a.organization_name,
    a.object_name,
    a.year,
    a.budget,
    a.actual,
    a.full_account_id,
    a.org_id,
    a.obj_id,
    a.fund_id,
    a.dept_id,
    a.div_id,
    a.cost_id,
    a.func_id,
    a.charcode,
    a.proj_id,
    a.is_proposed,
    c.object_code,
    c.category,
    c.category_name
   FROM coagis.gl_history_plus_budget_proposed a
     LEFT JOIN ( SELECT bcm.object_code,
            bcm.category,
            bc.category AS category_name
           FROM coagis.budget_category_mapping bcm
             JOIN coagis.budget_categories bc ON bcm.category = bc.id) c ON a.obj_id::text = c.object_code;




