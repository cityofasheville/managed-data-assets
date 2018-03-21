SELECT        TOP (100) PERCENT a_account_type AS AccountType, a_fund_seg1 AS Fund, 
a_object AS ObjectId, a_object_desc AS ObjDesc, 
a_project AS ProjectId, 
                         a_org AS OrgId, a_org_description AS OrgDesc, 
                          a_account_status AS AccountStatus, 
                         a_segment_3 AS DeptId, 
                         a_segment_4 AS DivId, a_segment_5 AS Costcenter, 
                         a_charcode_desc AS CharcodeDesc, 
                          my_orig_bud_ltd AS LifeOriginalBudget, 
                         my_bud_xfr_in_ltd AS LifeTransfersIn, 
                         my_bud_xfr_in_ltd AS LifeTransfersOut, 
                         my_rev_bud_ltd AS LifeRevisedBudget, 
                         b_cy_memo_bal AS CYActualMemoBalance, 
                         b_cy_encumb AS CYEncumbrances, b_ly1_actual_bal AS Actuals2017, 
                         b_ly2_actual_bal AS Actuals2016, b_ly3_actual_bal AS Actuals2015, 
                         b_ly4_actual_bal AS Actuals2014, b_ly5_actual_bal AS Actuals2013, 
                         b_ly6_actual_bal AS Actuals2012, b_ly7_actual_bal AS Actuals2011
FROM            dbo.gl_master
WHERE        (ISNULL(a_project, '') <> '') AND a_project NOT LIKE 'A%' AND a_project NOT LIKE 'D%' 
ORDER BY ProjectId




--AND a_project NOT LIKE 'B%'
