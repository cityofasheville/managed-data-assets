WITH
bsm AS ( -- Just the relevant bits of the budget_section_mapping table
	SELECT DISTINCT bsmtmp.budget_section, bsmtmp.org_code, bsmtmp.object_code
  FROM coagis.budget_section_mapping bsmtmp
),
glm1 AS ( -- gl_master rows with both org & obj match for budget section
	SELECT * FROM amd.gl_master glm
	INNER JOIN bsm ON glm.organization_id::text = bsm.org_code AND glm.object_id::text = bsm.object_code
)
SELECT 
  a.account_type, a.account_status, a.fund_name, a.function_name, a.department_name, a.division_name,
  a.costcenter_name, a.grant_name, a.organization_name, a.object_name, a.project_name,
  a.year, a.original_budget, a.revised_budget, a.actual, a.memo, a.lifetime_original_budget, a.lifetime_revised_budget,
  a.fund_id, a.function_id, a.department_id, a.division_id, 
  a.costcenter_id, a.grant_id, a.organization_id, a.object_id, a.project_id, a.full_account_id,
  a.charcode_name, a.is_budgetary, b.category_name, c.budget_section_name
FROM ( -- a contains all the mapped gl_master rows
  SELECT * FROM glm1 -- gl_master rows with both org & obj match for budget section
  UNION ALL
  ( -- This subquery pulls remaining gl_master rows (i.e., org/obj that aren't in glm1)
    SELECT * FROM amd.gl_master glm2
      LEFT JOIN (
        SELECT * from bsm
        WHERE bsm.object_code IS NULL
      ) AS bb ON glm2.organization_id::text = bb.org_code
    WHERE NOT ((glm2.organization_id::text, glm2.object_id::text) IN (SELECT  organization_id, object_id FROM glm1))
  )
) a
LEFT JOIN ( -- b contains the category name
  SELECT bcm.object_code, bcm.category, bc.category AS category_name
  FROM coagis.budget_category_mapping bcm
  INNER JOIN coagis.budget_categories bc ON bcm.category = bc.id
) b ON a.object_id::text = b.object_code
LEFT JOIN ( -- c contains the budget section name
    SELECT  budget_sections.id,
            budget_sections.budget_section AS budget_section_name
    FROM coagis.budget_sections
  ) c ON a.budget_section = c.id
