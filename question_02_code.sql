SELECT 
    m.payroll_year,
    m.value AS average_gross_wage,
    p.value_type_name AS product_type,
    p.value AS product_price_total,
    p.price_value AS product_unit,
    ROUND((m.value / (p.value / p.price_value))::numeric, 0) AS units_affordable
FROM t_jelena_puzova_project_SQL_primary_final m
JOIN t_jelena_puzova_project_SQL_primary_final p 
    ON m.payroll_year = p.payroll_year
WHERE m.value_type_name = 'Average gross wage per employee'
  AND p.value_type_name IN (
      'Food: Mléko polotučné pasterované', 
      'Food: Chléb konzumní kmínový'
  )
  AND m.payroll_year IN (
      (SELECT MIN(payroll_year) 
       FROM t_jelena_puzova_project_SQL_primary_final 
       WHERE value_type_name = 'Average gross wage per employee'),
      (SELECT MAX(payroll_year) 
       FROM t_jelena_puzova_project_SQL_primary_final 
       WHERE value_type_name = 'Average gross wage per employee')
  )
ORDER BY m.payroll_year, p.value_type_name;
