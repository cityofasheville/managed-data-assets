-- View: coaaux.v_budget_hist_plus_cat2

-- DROP VIEW coaaux.v_budget_hist_plus_cat2;

CREATE OR REPLACE VIEW coaaux.v_budget_hist_plus_cat2 AS
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
    a.category_name,
    a.budget_section_name,
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
    a.category AS category_id,
    a.budget_section AS budget_section_id,
    a.is_proposed
FROM (
  SELECT * FROM ( -- aa
    SELECT *
    FROM coaaux.v_budget_hist_plus_category bh1
    JOIN (
      SELECT  budget_section_mapping.budget_section,
              budget_section_mapping.org_code,
              budget_section_mapping.object_code
      FROM coagis.budget_section_mapping
    ) bsm1 ON bh1.org_id::text = bsm1.org_code AND bh1.obj_id::text = bsm1.object_code
    UNION
    SELECT *
    FROM coaaux.v_budget_hist_plus_category bh
    LEFT JOIN (
      SELECT DISTINCT budget_section_mapping.budget_section,
                      budget_section_mapping.org_code,
                      budget_section_mapping.object_code
      FROM coagis.budget_section_mapping
      WHERE budget_section_mapping.object_code IS NULL
    ) bsm ON bh.org_id::text = bsm.org_code
    WHERE NOT (
      -- This WHERE excludes all rows that *have* org/obj code mapped to section
      (bh.org_id::text, bh.obj_id::text) IN (
        SELECT  bh2.org_id,
                bh2.obj_id
        FROM coaaux.v_budget_hist_plus_category bh2
        JOIN (
          SELECT  budget_section_mapping.budget_section,
                  budget_section_mapping.org_code,
                  budget_section_mapping.object_code
          FROM coagis.budget_section_mapping
        ) bsm2 ON bh2.org_id::text = bsm2.org_code AND bh2.obj_id::text = bsm2.object_code
      )
    )
  ) aa
  LEFT JOIN (
    SELECT  budget_sections.id,
            budget_sections.budget_section AS budget_section_name
    FROM coagis.budget_sections
  ) bb ON aa.budget_section = bb.id
) a;

22641



