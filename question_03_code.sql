SELECT 
    product_name,
    ROUND(AVG((current_price - previous_price) / previous_price * 100)::numeric, 2) AS avg_percent_growth
FROM (
    SELECT 
        payroll_year,
        SUBSTRING(value_type_name FROM 'Food: (.+)') AS product_name,
        value / price_value AS current_price,
        LAG(value / price_value) OVER (
            PARTITION BY SUBSTRING(value_type_name FROM 'Food: (.+)') 
            ORDER BY payroll_year
        ) AS previous_price
    FROM t_jelena_puzova_project_SQL_primary_final
    WHERE value_type_name LIKE 'Food:%'
      AND value IS NOT NULL
      AND price_value IS NOT NULL
) AS price_differences
WHERE previous_price IS NOT NULL
GROUP BY product_name
ORDER BY avg_percent_growth ASC
LIMIT 1;
