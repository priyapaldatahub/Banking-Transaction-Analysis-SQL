
# 🏦 Banking Transaction Analysis using SQL

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![SQL](https://img.shields.io/badge/SQL-Project-success)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## 📌 Project Overview

The **Banking Transaction Analysis** project is an end-to-end SQL project developed using **MySQL**. It focuses on analyzing banking operations such as customer accounts, financial transactions, loans, cards, branch performance, employee management, and customer support.

The project demonstrates how SQL can be used to solve real-world business problems by performing data validation, querying large datasets, creating views, writing stored procedures, implementing triggers, using Common Table Expressions (CTEs), Window Functions, and optimizing performance with indexes.

---

## 🎯 Objectives

- Analyze customer and account information
- Study banking transaction behavior
- Monitor loan performance and repayments
- Analyze debit and credit card information
- Evaluate branch performance
- Analyze employee distribution
- Monitor customer support activities
- Generate business insights using SQL

---

## 🛠 Technologies Used

- MySQL 8.0
- MySQL Workbench
- SQL
- Git
- GitHub

---

# 📂 Database Structure

The project contains **9 relational tables**.

| Table | Description |
|--------|-------------|
| Customers | Customer Information |
| Accounts | Bank Account Details |
| Transactions | Customer Banking Transactions |
| Loans | Loan Details |
| Loan_Payments | Loan Repayment Records |
| Cards | Debit/Credit Card Information |
| Branches | Branch Information |
| Employees | Employee Information |
| Support_Tickets | Customer Support Records |

---

# 🔗 Database Relationships

- One Customer → Many Accounts
- One Customer → Many Loans
- One Customer → Many Cards
- One Customer → Many Support Tickets
- One Account → Many Transactions
- One Loan → Many Loan Payments
- One Branch → Many Accounts
- One Branch → Many Employees
- One Branch → Many Loans

---

# 📊 SQL Concepts Demonstrated

This project covers:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- SELF JOIN
- Subqueries
- CASE Statements
- Views
- Common Table Expressions (CTEs)
- Window Functions
- Stored Procedures
- Triggers
- Indexes
- Data Validation
- Primary Keys
- Foreign Keys

---

# 📈 Business Problems Solved

The project answers **40+ business questions**, including:

### Customer Analysis
- Total customers
- Customers by city
- Customers by gender
- Customers with multiple accounts
- Active customers

### Account Analysis
- Account type distribution
- Average account balance
- Highest balance account
- Lowest balance account

### Transaction Analysis
- Monthly transaction trends
- Transaction type distribution
- Highest transaction amount
- Top customers by transaction value
- Branch-wise transactions

### Loan Analysis
- Loan distribution
- Average loan amount
- Loan repayment analysis
- Pending loans
- Completed loans

### Card Analysis
- Card type distribution
- Active cards
- Credit limit analysis

### Branch Analysis
- Branch performance
- Customer count by branch
- Total balance by branch

### Employee Analysis
- Employees per branch
- Salary analysis
- Employee distribution

### Customer Support Analysis
- Open tickets
- Closed tickets
- Ticket status distribution
- Customer satisfaction analysis

---

# 💡 Key Business Insights

- Identified top-performing branches based on account balances.
- Analyzed customer transaction trends across different channels.
- Evaluated loan repayment performance.
- Compared account types and customer distribution.
- Identified inactive accounts.
- Measured employee distribution across branches.
- Evaluated customer support efficiency.

---

# 🗂 Project Structure

```
Banking-Transaction-Analysis-SQL
│
├── Dataset
├── SQL Scripts
├── Screenshots
├── README.md
├── LICENSE
├── ER_Diagram.png
└── ER_Diagram.mwb
```

---

# 📜 SQL Script Files

```
01_Create_Database.sql
02_Create_Tables.sql
03_Import_Data.sql
04_Add_Primary_Keys.sql
05_Add_Foreign_Keys.sql
06_Data_Validation.sql
07_Basic_Queries.sql
08_Intermediate_Queries.sql
09_Advanced_Queries.sql
10_Views.sql
11_CTE.sql
12_Window_Functions.sql
13_Stored_Procedures.sql
14_Triggers.sql
15_Indexes.sql
```

---

# 📸 Project Screenshots

Project screenshots include:

- Database
- Tables
- Data Import
- Data Validation
- Basic Queries
- Intermediate Queries
- Advanced Queries
- Views
- CTEs
- Window Functions
- Stored Procedures
- Triggers
- Indexes
- ER Diagram

---

# ⚠ Dataset Note

The original **Transactions** dataset contained **1,048,576 records (over 1 million rows)**.

While importing the full dataset into MySQL Workbench, compatibility and loading issues were encountered due to the dataset format. After validating the remaining tables and ensuring the database design was correct, a cleaned subset containing **100,000 transaction records** was created and used for the transaction analysis.

This subset preserves the original schema and enables efficient execution of SQL queries while accurately demonstrating analytical techniques and business insights.

---

# 🚀 How to Run

### Step 1

Clone the repository

```bash
git clone https://github.com/yourusername/Banking-Transaction-Analysis-SQL.git
```

### Step 2

Open MySQL Workbench.

### Step 3

Run the SQL scripts in the following order:

```
01_Create_Database.sql
02_Create_Tables.sql
03_Import_Data.sql
04_Add_Primary_Keys.sql
05_Add_Foreign_Keys.sql
06_Data_Validation.sql
07_Basic_Queries.sql
08_Intermediate_Queries.sql
09_Advanced_Queries.sql
10_Views.sql
11_CTE.sql
12_Window_Functions.sql
13_Stored_Procedures.sql
14_Triggers.sql
15_Indexes.sql
```

---

# 📚 Skills Demonstrated

- SQL Query Writing
- Relational Database Design
- Data Cleaning
- Data Validation
- Data Analysis
- Business Intelligence
- Database Management
- Performance Optimization
- Problem Solving

---

# 🔮 Future Improvements

- Power BI Dashboard
- Python Data Analysis (Pandas)
- Tableau Dashboard
- ETL Automation
- Banking KPI Dashboard

---

# 👩‍💻 Author

**Priya Pal**

If you found this project helpful, feel free to ⭐ star the repository.
