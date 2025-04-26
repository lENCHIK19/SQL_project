CREATE TABLE t_jelena_puzova_project_SQL_secondary_final AS

SELECT
    c.country,
    c.iso3 AS code,
    c.continent,
    c.region_in_world AS region,
    e.year,
    e.gdp,
    e.population,
    ROUND((e.gdp / e.population)::numeric, 2) AS gdp_per_person
FROM countries AS c
LEFT JOIN economies AS e ON c.country = e.country
WHERE e.gdp IS NOT NULL AND e.population IS NOT NULL;

SELECT * FROM t_jelena_puzova_project_SQL_secondary_final;
