SELECT 
    payroll_year,
    industry_name,
    ROUND(AVG(value)::numeric, 2) AS average_gross_wage_czk
FROM t_jelena_puzova_project_SQL_primary_final
WHERE value_type_name = 'Average gross wage per employee'
  AND value IS NOT NULL
  AND industry_name IS NOT NULL
GROUP BY payroll_year, industry_name
ORDER BY industry_name, payroll_year;
