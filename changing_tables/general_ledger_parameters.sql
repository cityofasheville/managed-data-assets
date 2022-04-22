
-- internal.general_ledger_parameters definition

-- Original Version!!!!!

-- DROP TABLE internal.general_ledger_parameters CASCADE;

CREATE TABLE internal.general_ledger_parameters (
	id int4 NULL,
	parm bpchar(1) NULL,
	budgetrequest_level1_description varchar(10) NULL,
	budgetrequest_level2_description varchar(10) NULL,
	budgetrequest_level3_description varchar(10) NULL,
	budgetrequest_level4_description varchar(10) NULL,
	budgetrequest_level5_description varchar(10) NULL,
	useprojectcode bool NULL,
	usebudgetarycontrol bool NULL,
	defaultyear int4 NULL,
	defaultperiod int4 NULL,
	budgetcarryforwardmethod bpchar(1) NULL,
	currentyear int4 NULL,
	currentperiod int4 NULL,
	beginningfiscalyeardate timestamp NULL,
	endfiscalyeardate timestamp NULL,
	iscurrentyearheldopen bool NULL,
	finalbudgetlevel int4 NULL,
	balancesegment1_length int4 NULL,
	balancesegment2_length int4 NULL,
	balancesegment3_length int4 NULL,
	balancesegment4_length int4 NULL,
	balancesegment5_length int4 NULL,
	balancesegment6_length int4 NULL,
	balancesegment7_length int4 NULL,
	balancesegment8_length int4 NULL,
	expensesegment1_length int4 NULL,
	expensesegment2_length int4 NULL,
	expensesegment3_length int4 NULL,
	expensesegment4_length int4 NULL,
	expensesegment5_length int4 NULL,
	expensesegment6_length int4 NULL,
	expensesegment7_length int4 NULL,
	expensesegment8_length int4 NULL,
	revenuesegment1_length int4 NULL,
	revenuesegment2_length int4 NULL,
	revenuesegment3_length int4 NULL,
	revenuesegment4_length int4 NULL,
	revenuesegment5_length int4 NULL,
	revenuesegment6_length int4 NULL,
	revenuesegment7_length int4 NULL,
	revenuesegment8_length int4 NULL,
	segment1_longdescription varchar(12) NULL,
	segment2_longdescription varchar(12) NULL,
	segment3_longdescription varchar(12) NULL,
	segment4_longdescription varchar(12) NULL,
	segment5_longdescription varchar(12) NULL,
	segment6_longdescription varchar(12) NULL,
	segment7_longdescription varchar(12) NULL,
	segment8_longdescription varchar(12) NULL,
	segment1_shortdescription varchar(4) NULL,
	segment2_shortdescription varchar(4) NULL,
	segment3_shortdescription varchar(4) NULL,
	segment4_shortdescription varchar(4) NULL,
	segment5_shortdescription varchar(4) NULL,
	segment6_shortdescription varchar(4) NULL,
	segment7_shortdescription varchar(4) NULL,
	segment8_shortdescription varchar(4) NULL,
	totalsegments int4 NULL,
	"delimiter" bpchar(1) NULL,
	grantsegment int4 NULL,
	grantexpcatsegment int4 NULL,
	includereqamountsinbudgetchecks bool NULL,
	yearend bool NULL,
	balancetosegment bpchar(1) NULL,
	accountcodecheck bool NULL,
	allowrevenueaccountswithencumbrance bool NULL,
	enforcedefaultyear bool NULL,
	isrollupcodepromptactive bool NULL,
	accountrestrictionformultipleroles bpchar(1) NULL,
	scheduledupdatedefaultperiod int4 NULL,
	synchronizationformatcode varchar(10) NULL,
	journalexportformat varchar(10) NULL,
	displaylongobject bool NULL,
	defaultjournalstatus bpchar(1) NULL,
	autopostjournal bool NULL,
	autocreategeneralbilling bool NULL,
	postdateflag bpchar(1) NULL,
	summ_pr_je bpchar(1) NULL,
	pocan_carryforwardbudget bpchar(1) NULL,
	podefaultyear int4 NULL,
	podefaultperiod int4 NULL,
	ardefaultyear int4 NULL,
	ardefaultperiod int4 NULL,
	contjournal bpchar(1) NULL,
	nextyearbua bpchar(1) NULL,
	"version" bytea NULL,
	pcashfund varchar(4) NULL,
	fiscalyearstartmonthid int4 NULL,
	verifycashlevel bool NULL,
	enforcecfwdbudget bool NULL,
	autogeneratedtdf bool NULL,
	usenyrollups bool NULL,
	excludeunpostedcredits bool NULL,
	usegenerojournalentry bool NULL,
	createcfwdbua bool NULL,
	departmentsegment bpchar(1) NULL,
	functionsegment bpchar(1) NULL,
	multiennialstartyear int4 NULL,
	multiennialclosesallowed int4 NULL
);


-- internal.general_ledger_parameters definition

-- Drop table

-- DROP TABLE internal.general_ledger_parameters;

CREATE TABLE internal.general_ledger_parameters (
	id int4 NULL,
	parm bpchar(1) NULL,
	budgetrequest_level1_description varchar(10) NULL,
	budgetrequest_level2_description varchar(10) NULL,
	budgetrequest_level3_description varchar(10) NULL,
	budgetrequest_level4_description varchar(10) NULL,
	budgetrequest_level5_description varchar(10) NULL,
	useprojectcode bool NULL,
	usebudgetarycontrol bool NULL,
	defaultyear int2 NULL,
	defaultperiod int2 NULL,
	budgetcarryforwardmethod bpchar(1) NULL,
	currentyear int2 NULL,
	currentperiod int2 NULL,
	beginningfiscalyeardate timestamp NULL,
	endfiscalyeardate timestamp NULL,
	iscurrentyearheldopen bool NULL,
	finalbudgetlevel int2 NULL,
	balancesegment1_length int2 NULL,
	balancesegment2_length int2 NULL,
	balancesegment3_length int2 NULL,
	balancesegment4_length int2 NULL,
	balancesegment5_length int2 NULL,
	balancesegment6_length int2 NULL,
	balancesegment7_length int2 NULL,
	balancesegment8_length int2 NULL,
	expensesegment1_length int2 NULL,
	expensesegment2_length int2 NULL,
	expensesegment3_length int2 NULL,
	expensesegment4_length int2 NULL,
	expensesegment5_length int2 NULL,
	expensesegment6_length int2 NULL,
	expensesegment7_length int2 NULL,
	expensesegment8_length int2 NULL,
	revenuesegment1_length int2 NULL,
	revenuesegment2_length int2 NULL,
	revenuesegment3_length int2 NULL,
	revenuesegment4_length int2 NULL,
	revenuesegment5_length int2 NULL,
	revenuesegment6_length int2 NULL,
	revenuesegment7_length int2 NULL,
	revenuesegment8_length int2 NULL,
	segment1_longdescription varchar(12) NULL,
	segment2_longdescription varchar(12) NULL,
	segment3_longdescription varchar(12) NULL,
	segment4_longdescription varchar(12) NULL,
	segment5_longdescription varchar(12) NULL,
	segment6_longdescription varchar(12) NULL,
	segment7_longdescription varchar(12) NULL,
	segment8_longdescription varchar(12) NULL,
	segment1_shortdescription varchar(4) NULL,
	segment2_shortdescription varchar(4) NULL,
	segment3_shortdescription varchar(4) NULL,
	segment4_shortdescription varchar(4) NULL,
	segment5_shortdescription varchar(4) NULL,
	segment6_shortdescription varchar(4) NULL,
	segment7_shortdescription varchar(4) NULL,
	segment8_shortdescription varchar(4) NULL,
	totalsegments int2 NULL,
	"delimiter" bpchar(1) NULL,
	grantsegment int2 NULL,
	grantexpcatsegment int2 NULL,
	includereqamountsinbudgetchecks bool NULL,
	yearend bool NULL,
	balancetosegment bpchar(1) NULL,
	accountcodecheck bool NULL,
	allowrevenueaccountswithencumbrance bool NULL,
	enforcedefaultyear bool NULL,
	isrollupcodepromptactive bool NULL,
	accountrestrictionformultipleroles bpchar(1) NULL,
	scheduledupdatedefaultperiod int4 NULL,
	synchronizationformatcode varchar(10) NULL,
	journalexportformat varchar(10) NULL,
	displaylongobject bool NULL,
	defaultjournalstatus bpchar(1) NULL,
	autopostjournal bool NULL,
	autocreategeneralbilling bool NULL,
	postdateflag bpchar(1) NULL,
	summ_pr_je bpchar(1) NULL,
	pocan_carryforwardbudget bpchar(1) NULL,
	podefaultyear int2 NULL,
	podefaultperiod int2 NULL,
	ardefaultyear int2 NULL,
	ardefaultperiod int2 NULL,
	contjournal bpchar(1) NULL,
	nextyearbua bpchar(1) NULL,
	"version" bytea NULL,
	pcashfund varchar(4) NULL,
	fiscalyearstartmonthid int4 NULL,
	verifycashlevel bool NULL,
	enforcecfwdbudget bool NULL,
	autogeneratedtdf bool NULL,
	usenyrollups bool NULL,
	usegenerojournalentry bool NULL
);

-- "open".general_ledger_parameters source

CREATE OR REPLACE VIEW "open".general_ledger_parameters
AS SELECT general_ledger_parameters.id,
    general_ledger_parameters.parm,
    general_ledger_parameters.budgetrequest_level1_description,
    general_ledger_parameters.budgetrequest_level2_description,
    general_ledger_parameters.budgetrequest_level3_description,
    general_ledger_parameters.budgetrequest_level4_description,
    general_ledger_parameters.budgetrequest_level5_description,
    general_ledger_parameters.useprojectcode,
    general_ledger_parameters.usebudgetarycontrol,
    general_ledger_parameters.defaultyear,
    general_ledger_parameters.defaultperiod,
    general_ledger_parameters.budgetcarryforwardmethod,
    general_ledger_parameters.currentyear,
    general_ledger_parameters.currentperiod,
    general_ledger_parameters.beginningfiscalyeardate,
    general_ledger_parameters.endfiscalyeardate,
    general_ledger_parameters.iscurrentyearheldopen,
    general_ledger_parameters.finalbudgetlevel,
    general_ledger_parameters.balancesegment1_length,
    general_ledger_parameters.balancesegment2_length,
    general_ledger_parameters.balancesegment3_length,
    general_ledger_parameters.balancesegment4_length,
    general_ledger_parameters.balancesegment5_length,
    general_ledger_parameters.balancesegment6_length,
    general_ledger_parameters.balancesegment7_length,
    general_ledger_parameters.balancesegment8_length,
    general_ledger_parameters.expensesegment1_length,
    general_ledger_parameters.expensesegment2_length,
    general_ledger_parameters.expensesegment3_length,
    general_ledger_parameters.expensesegment4_length,
    general_ledger_parameters.expensesegment5_length,
    general_ledger_parameters.expensesegment6_length,
    general_ledger_parameters.expensesegment7_length,
    general_ledger_parameters.expensesegment8_length,
    general_ledger_parameters.revenuesegment1_length,
    general_ledger_parameters.revenuesegment2_length,
    general_ledger_parameters.revenuesegment3_length,
    general_ledger_parameters.revenuesegment4_length,
    general_ledger_parameters.revenuesegment5_length,
    general_ledger_parameters.revenuesegment6_length,
    general_ledger_parameters.revenuesegment7_length,
    general_ledger_parameters.revenuesegment8_length,
    general_ledger_parameters.segment1_longdescription,
    general_ledger_parameters.segment2_longdescription,
    general_ledger_parameters.segment3_longdescription,
    general_ledger_parameters.segment4_longdescription,
    general_ledger_parameters.segment5_longdescription,
    general_ledger_parameters.segment6_longdescription,
    general_ledger_parameters.segment7_longdescription,
    general_ledger_parameters.segment8_longdescription,
    general_ledger_parameters.segment1_shortdescription,
    general_ledger_parameters.segment2_shortdescription,
    general_ledger_parameters.segment3_shortdescription,
    general_ledger_parameters.segment4_shortdescription,
    general_ledger_parameters.segment5_shortdescription,
    general_ledger_parameters.segment6_shortdescription,
    general_ledger_parameters.segment7_shortdescription,
    general_ledger_parameters.segment8_shortdescription,
    general_ledger_parameters.totalsegments,
    general_ledger_parameters.delimiter,
    general_ledger_parameters.grantsegment,
    general_ledger_parameters.grantexpcatsegment,
    general_ledger_parameters.includereqamountsinbudgetchecks,
    general_ledger_parameters.yearend,
    general_ledger_parameters.balancetosegment,
    general_ledger_parameters.accountcodecheck,
    general_ledger_parameters.allowrevenueaccountswithencumbrance,
    general_ledger_parameters.enforcedefaultyear,
    general_ledger_parameters.isrollupcodepromptactive,
    general_ledger_parameters.accountrestrictionformultipleroles,
    general_ledger_parameters.scheduledupdatedefaultperiod,
    general_ledger_parameters.synchronizationformatcode,
    general_ledger_parameters.journalexportformat,
    general_ledger_parameters.displaylongobject,
    general_ledger_parameters.defaultjournalstatus,
    general_ledger_parameters.autopostjournal,
    general_ledger_parameters.autocreategeneralbilling,
    general_ledger_parameters.postdateflag,
    general_ledger_parameters.summ_pr_je,
    general_ledger_parameters.pocan_carryforwardbudget,
    general_ledger_parameters.podefaultyear,
    general_ledger_parameters.podefaultperiod,
    general_ledger_parameters.ardefaultyear,
    general_ledger_parameters.ardefaultperiod,
    general_ledger_parameters.contjournal,
    general_ledger_parameters.nextyearbua,
    general_ledger_parameters.version,
    general_ledger_parameters.pcashfund,
    general_ledger_parameters.fiscalyearstartmonthid,
    general_ledger_parameters.verifycashlevel,
    general_ledger_parameters.enforcecfwdbudget,
    general_ledger_parameters.autogeneratedtdf,
    general_ledger_parameters.usenyrollups,
    general_ledger_parameters.usegenerojournalentry
   FROM internal.general_ledger_parameters;
   
  -- simplicity.budget_parameters_view source

CREATE OR REPLACE VIEW simplicity.budget_parameters_view
AS SELECT a.defaultyear,
    a.currentyear,
    a.in_budget_season
   FROM ( SELECT glp1.defaultyear,
            glp1.currentyear,
            ( SELECT coa_app_parameters.value
                   FROM simplicity.coa_app_parameters
                  WHERE coa_app_parameters.name::text = 'in_budget_season'::text) AS in_budget_season
           FROM internal.general_ledger_parameters glp1) a;





-- simplicity.v_gl_5yr_plus_budget_mapped source

CREATE OR REPLACE VIEW simplicity.v_gl_5yr_plus_budget_mapped
AS SELECT a.account_type,
    a.fund_name,
    a.function_name,
    a.department_name,
    a.division_name,
    a.costcenter_name,
    a.grant_name,
    a.organization_name,
    a.object_name,
    a.project_name,
    a.year,
    a.proposed_budget,
    a.adopted_budget,
    a.actual,
    a.fund_id,
    a.function_id,
    a.department_id,
    a.division_id,
    a.costcenter_id,
    a.grant_id,
    a.organization_id,
    a.object_id,
    a.project_id,
    a.defaultyear,
    a.currentyear,
    a.in_budget_season,
    a.category_name,
    a.budget_section_name
   FROM ( SELECT m.account_type,
            m.fund_name,
            m.function_name,
            m.department_name,
            m.division_name,
            m.costcenter_name,
            m.grant_name,
            m.organization_name,
            m.object_name,
            m.project_name,
            m.year,
            NULL::numeric AS proposed_budget,
            m.original_budget AS adopted_budget,
            m.actual,
            m.fund_id,
            m.function_id,
            m.department_id,
            m.division_id,
            m.costcenter_id,
            m.grant_id,
            m.organization_id,
            m.object_id,
            m.project_id,
            glp1.defaultyear,
            glp1.currentyear,
            ( SELECT coa_app_parameters.value
                   FROM simplicity.coa_app_parameters
                  WHERE coa_app_parameters.name::text = 'in_budget_season'::text) AS in_budget_season,
            m.category_name,
            m.budget_section_name
           FROM simplicity.v_gl_master_mapped m
             LEFT JOIN internal.general_ledger_parameters glp1 ON 1 = 1
          WHERE (m.account_type = 'R'::bpchar OR m.account_type = 'E'::bpchar) AND m.year > (glp1.currentyear - 5)
        UNION ALL
         SELECT b.account_type,
            b.fund_name,
            b.function_name,
            b.department_name,
            b.division_name,
            b.costcenter_name,
            b.grant_name,
            b.organization_name,
            b.object_name,
            b.project_name,
            b.year,
            b.proposed_budget,
            b.adopted_budget,
            NULL::numeric AS actual,
            b.fund_id,
            b.function_id,
            b.department_id,
            b.division_id,
            b.costcenter_id,
            b.grant_id,
            b.organization_id,
            b.object_id,
            b.project_id,
            glp2.defaultyear,
            glp2.currentyear,
            ( SELECT coa_app_parameters.value
                   FROM simplicity.coa_app_parameters
                  WHERE coa_app_parameters.name::text = 'in_budget_season'::text) AS in_budget_season,
            b.category_name,
            b.budget_section_name
           FROM simplicity.v_gl_budget_mapped b
             LEFT JOIN internal.general_ledger_parameters glp2 ON 1 = 1
          WHERE (b.account_type = 'R'::bpchar OR b.account_type = 'E'::bpchar) AND b.year > glp2.currentyear) a;

-- simplicity.budget_summary_by_dept_view source

CREATE OR REPLACE VIEW simplicity.budget_summary_by_dept_view
AS SELECT s.department_name,
    s.year,
    s.total_proposed_budget,
    s.total_adopted_budget,
    s.total_actual,
    s.account_type
   FROM ( SELECT bh.account_type,
            bh.department_name,
            bh.year,
            sum(bh.proposed_budget) AS total_proposed_budget,
            sum(bh.adopted_budget) AS total_adopted_budget,
            sum(bh.actual) AS total_actual
           FROM simplicity.v_gl_5yr_plus_budget_mapped bh
          WHERE NOT ((bh.organization_id::text, bh.object_id::text) IN ( SELECT interfund_transfers.org_code,
                    interfund_transfers.object_code
                   FROM internal.budget_interfund_transfers interfund_transfers))
          GROUP BY bh.department_name, bh.year, bh.account_type) s;


-- simplicity.budget_summary_by_use_view source

CREATE OR REPLACE VIEW simplicity.budget_summary_by_use_view
AS SELECT s.category_name,
    s.year,
    s.total_proposed_budget,
    s.total_adopted_budget,
    s.total_actual,
    s.account_type
   FROM ( SELECT bh.account_type,
            bh.category_name,
            bh.year,
            sum(bh.proposed_budget) AS total_proposed_budget,
            sum(bh.adopted_budget) AS total_adopted_budget,
            sum(bh.actual) AS total_actual
           FROM simplicity.v_gl_5yr_plus_budget_mapped bh
          WHERE NOT ((bh.organization_id::text, bh.object_id::text) IN ( SELECT interfund_transfers.org_code,
                    interfund_transfers.object_code
                   FROM internal.budget_interfund_transfers interfund_transfers))
          GROUP BY bh.category_name, bh.year, bh.account_type) s;