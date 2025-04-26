# Project: Analysis of Food Affordability and Economic Trends

## Introduction
The final project focuses on analyzing the affordability of basic food items for the general public in the Czech Republic in relation to their average wages. It also explores the relationship between GDP growth, wage growth, and food price development.

The goal is to provide structured answers to five research questions using real economic and labor market data.

The project consists of two datasets:
- Primary Table: 't_jelena_puzova_project_SQL_primary_final' which combines wage data and food prices from Czech statistical datasets.
- Secondary Table: 't_jelena_puzova_project_SQL_secondary_final' which contains GDP, population, and GDP per capita data for multiple European countries.
  
---

## Objectives

✅ Analyze wage trends over time in various industries.  
✅ Calculate food affordability (milk and bread) over time.  
✅ Find the food item with the slowest price increase.  
✅ Investigate if there were years when food prices rose faster than wages.  
✅ Analyze whether GDP growth influenced wage and food price growth.

---

## Dataset Sources

- `czechia_payroll`
- `czechia_price`
- `czechia_price_category`
- `countries`
- `economies`
- `czechia_region` and `czechia_district` (supporting regional data)

---

## Project Structure

| File                               | Description                                   |
|-------------------------------     |-----------------------------------------------|
| `primary_table.sql`                | SQL script to create the primary table.       |
| `secondary_table.sql`              | SQL script to create the secondary table.     |
| `question_01_code.sql`             | Wage trend analysis query.                    |
| `question_02_code.sql`             | Food affordability calculation query.         |
| `question_03_code.sql`             | Query for slowest price growth food item.     |
| `question_04_code.sql`             | Query identifying years with higher food inflation. |
| `question_05_code.sql`             | Analysis of GDP, wage, and food price relationships. |
| `key_Q&A.pdf`                      | Answers to key research questions and abnormalities found. |
| `primary&secondary_tables_info.pdf`| Additional data about primary and secondary tables. |

---

## How to Use

1. Create the primary and secondary tables by running the provided table creation scripts.
2. Run the individual queries (`question_01_code.sql`, `question_02_code.sql`, etc.) to produce outputs answering each research question.
3. Analyze the outputs to interpret economic and social trends.

---

## Important Notes

- Some data were missing and could not be analyzed (more in `key_Q&A.pdf` / `primary&secondary_tables_info.pdf`).
- The detailed food price data were available only for Czechia, limiting international comparison.
- Focus is mainly on long-term wage and food affordability development in the Czech Republic.
- GDP data were joined carefully with wage and food price trends for cross-checking.

---

## Author
Jelena Puzova

---

## License
This project is open-source and free to use for educational purposes.
