CREATE TABLE t_jelena_puzova_project_SQL_primary_final AS

-- Part 1: Payroll Data
SELECT
    cp.id,
    cp.value,
    cp.payroll_year,
    cp.payroll_quarter,
    NULL::text AS category_name,
    NULL::numeric AS price_value,
    NULL::text AS price_unit,
    cpc.name AS calculation_name,
    cpib.name AS industry_name,
    cpu.name AS unit_name,
    cpv.name AS value_type_name
FROM czechia_payroll AS cp
LEFT JOIN czechia_payroll_calculation AS cpc ON cp.calculation_code = cpc.code
LEFT JOIN czechia_payroll_industry_branch AS cpib ON cp.industry_branch_code = cpib.code
LEFT JOIN czechia_payroll_unit AS cpu ON cp.unit_code = cpu.code
LEFT JOIN czechia_payroll_value_type AS cpv ON cp.value_type_code = cpv.code

UNION ALL

-- Part 2: Food Price Data
SELECT
    cp.id,
    cp.value,
    EXTRACT(YEAR FROM cp.date_from)::int AS payroll_year,
    NULL::int AS payroll_quarter,
    cpc.name AS category_name,
    cpc.price_value,
    cpc.price_unit,
    NULL::text AS calculation_name,
    NULL::text AS industry_name,
    NULL::text AS unit_name,
    CONCAT('Food: ', cpc.name) AS value_type_name
FROM czechia_price AS cp
JOIN czechia_price_category AS cpc ON cp.category_code = cpc.code
WHERE cp.region_code IS NULL;

SELECT * FROM t_jelena_puzova_project_SQL_primary_final;