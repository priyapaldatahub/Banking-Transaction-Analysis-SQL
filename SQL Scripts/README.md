# SQL Scripts

## Overview

This folder contains all SQL scripts used to build and analyze the **Banking Transaction Analysis** project using MySQL.

The scripts are organized in the order they should be executed, from database creation to advanced SQL analysis and performance optimization.

---

## Execution Order

| Script | Description |
|---------|-------------|
| 01_Create_Database.sql | Creates the project database. |
| 02_Create_Tables.sql | Creates all required tables. |
| 03_Import_Data.sql | Imports CSV data into the database. |
| 04_Add_Primary_Keys.sql | Adds primary key constraints. |
| 05_Add_Foreign_Keys.sql | Establishes relationships between tables. |
| 06_Data_Validation.sql | Validates imported data for missing values, duplicates, and consistency. |
| 07_Basic_Queries.sql | Basic SQL queries using SELECT, WHERE, ORDER BY, GROUP BY, and aggregate functions. |
| 08_Intermediate_Queries.sql | SQL queries using JOINs, subqueries, and CASE statements. |
| 09_Advanced_Queries.sql | Advanced business analysis queries. |
| 10_Views.sql | Creates SQL views for simplified reporting. |
| 11_CTE.sql | Uses Common Table Expressions (CTEs) for complex queries. |
| 12_Window_Functions.sql | Implements ranking, running totals, and analytical functions. |
| 13_Stored_Procedures.sql | Creates reusable stored procedures. |
| 14_Triggers.sql | Implements database triggers for automation. |
| 15_Indexes.sql | Creates indexes to improve query performance. |

---

## Technologies Used

- MySQL 8.0
- SQL
- MySQL Workbench

---

## Project Workflow

1. Create the database
2. Create all tables
3. Import CSV datasets
4. Apply Primary Keys
5. Apply Foreign Keys
6. Validate imported data
7. Perform SQL analysis
8. Create Views
9. Use CTEs
10. Apply Window Functions
11. Create Stored Procedures
12. Create Triggers
13. Optimize using Indexes

---

**Note:** Execute the scripts sequentially (01 → 15) to avoid dependency issues.
