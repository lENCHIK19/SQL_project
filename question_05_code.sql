WITH wages AS (
    SELECT 
        payroll_year,
        ROUND(AVG(value)::numeric, 2) AS average_wage
    FROM t_jelena_puzova_project_SQL_primary_final
    WHERE value_type_name = 'Average gross wage per employee'
    GROUP BY payroll_year
),

food_prices AS (
    SELECT 
        payroll_year,
        ROUND(AVG(value / price_value)::numeric, 2) AS average_food_price
    FROM t_jelena_puzova_project_SQL_primary_final
    WHERE value_type_name LIKE 'Food:%'
      AND value IS NOT NULL
      AND price_value IS NOT NULL
    GROUP BY payroll_year
),

differences AS (
    SELECT 
        w.payroll_year,
        w.average_wage,
        LAG(w.average_wage) OVER (ORDER BY w.payroll_year) AS wage_previous_year,
        f.average_food_price,
        LAG(f.average_food_price) OVER (ORDER BY f.payroll_year) AS food_price_previous_year
    FROM wages w
    JOIN food_prices f ON w.payroll_year = f.payroll_year
),

comparison AS (
    SELECT 
        payroll_year,
        ROUND(((average_wage - wage_previous_year) / wage_previous_year) * 100, 2) AS wage_growth_percent,
        ROUND(((average_food_price - food_price_previous_year) / food_price_previous_year) * 100, 2) AS food_price_growth_percent,
        ROUND(
            (((average_food_price - food_price_previous_year) / food_price_previous_year) * 100) -
            (((average_wage - wage_previous_year) / wage_previous_year) * 100),
            2
        ) AS difference_percent
    FROM differences
    WHERE wage_previous_year IS NOT NULL AND food_price_previous_year IS NOT NULL
)

SELECT *
FROM comparison
WHERE difference_percent > 10
ORDER BY difference_percent DESC;
