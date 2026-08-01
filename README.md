
# 🏦 Banking Transaction Analysis using SQL

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Database](https://img.shields.io/badge/Database-MySQL-orange)
![Status](https://img.shields.io/badge/Project-Completed-success)


---

# 📌 Project Overview

The **Banking Transaction Analysis** project is designed to analyze banking operations using **MySQL**. The project focuses on customer accounts, financial transactions, loans, card usage, branch performance, employee management, and customer support.

The objective is to solve real-world banking business problems using SQL queries and generate meaningful business insights that can help decision-makers improve operational efficiency.

---

# 🎯 Project Objectives

- Analyze customer and account information
- Study transaction behavior and trends
- Monitor loan performance
- Analyze debit and credit card usage
- Evaluate branch performance
- Analyze employee distribution
- Track customer support performance
- Generate business insights using SQL

---

# 🛠️ Technologies Used

- MySQL
- MySQL Workbench
- Git & GitHub

---

# 📂 Dataset

The project consists of the following datasets:

| Table | Description |
|---------|-------------|
| Customers | Customer Information |
| Accounts | Bank Account Details |
| Transactions | Customer Transactions |
| Loans | Loan Information |
| Loan_Payments | Loan Payment History |
| Cards | Debit/Credit Card Details |
| Branches | Branch Information |
| Employees | Employee Details |
| Support_Tickets | Customer Support Records |

---

# 🗂 Database Schema

The database contains **9 related tables** connected using Primary Keys and Foreign Keys.

### Main Relationships

Customers
│
├── Accounts
│ └── Transactions
│
├── Loans
│ └── Loan Payments
│
├── Cards
│
├── Support Tickets
│
Branches
│
└── Employees

---

# 📚 SQL Concepts Used

This project demonstrates the following SQL concepts:

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
- Common Table Expressions (CTEs)
- Window Functions
- CASE Statements
- Views
- Stored Procedures
- Triggers

---

# 📊 Business Questions Solved

This project answers **40+ real-world business questions**, including:

## Customer Analysis

- Total number of customers
- Customers by city
- Customers by gender
- Active customers
- Customers with multiple accounts

## Account Analysis

- Total accounts
- Account type distribution
- Average account balance
- Highest balance account
- Lowest balance account

## Transaction Analysis

- Total transactions
- Monthly transaction trends
- Daily transaction analysis
- Credit vs Debit transactions
- Highest transaction amount
- Top customers by transaction value
- Branch-wise transaction analysis

## Loan Analysis

- Total loans
- Loan distribution
- Average loan amount
- Pending loan payments
- Completed loans

## Card Analysis

- Card type distribution
- Most used card type
- Card transaction analysis
- Highest card spending

## Branch Analysis

- Branch performance
- Top performing branch
- Customer count by branch

## Employee Analysis

- Employees per branch
- Department-wise employees
- Employee distribution

## Customer Support Analysis

- Open tickets
- Closed tickets
- Ticket status distribution
- Most common complaint category

---

# 💡 Key Business Insights

Some important insights generated from the analysis include:

- Identified the highest-performing bank branches based on transaction volume.
- Determined customer segments with the highest transaction values.
- Compared debit and credit transaction trends.
- Analyzed loan repayment performance.
- Identified inactive customer accounts.
- Evaluated employee distribution across branches.
- Measured customer support efficiency using ticket analysis.

---

# 📁 Project Structure

```
📂 Banking-Transaction-Analysis-SQL
│
├── Dataset
├── SQL Scripts
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Import_Data.sql
│   ├── 04_Add_Primary_Keys.sql
│   ├── 05_Add_Foreign_Keys.sql
│   ├── 06_Data_Validation.sql
│   ├── 07_Basic_Queries.sql
│   ├── 08_Intermediate_Queries.sql
│   ├── 09_Advanced_Queries.sql
│   ├── 10_Views.sql
│   ├── 11_CTE.sql
│   ├── 12_Window_Functions.sql
│   ├── 13_Stored_Procedures.sql
│   ├── 14_Triggers.sql
│   └── 15_Indexes.sql
│
├── Screenshots
├── ER_Diagram.png
├── README.md
└── LICENSE

---

# 🚀 How to Run

## Step 1

Clone the repository.

```bash
git clone https://github.com/priyapaldatahub/Banking-Transaction-Analysis-SQL.git
```

## Step 2

Open MySQL Workbench.

## Step 3

Create the database.

```sql
CREATE DATABASE Banking_Project;

USE Banking_Project;
```

## Step 4

Run the SQL scripts in the following order:

1. Create Database
2. Create Tables
3. Import Dataset
4. Data Cleaning
5. Analysis Queries
6. Views
7. CTEs
8. Window Functions
9. Stored Procedures
10. Triggers

---

# 📷 Project Screenshots

Add screenshots of:

- Database Schema
- Tables
- SQL Queries
- Query Results
- ER Diagram
- MySQL Workbench
- GitHub Repository

---

# 📈 Future Improvements

- Power BI Dashboard
- Tableau Dashboard
- Python Data Analysis
- Automated ETL Pipeline
- Banking KPI Dashboard

---

# 🎓 Skills Demonstrated

- SQL Query Writing
- Data Analysis
- Relational Database Design
- Data Cleaning
- Business Intelligence
- Problem Solving
- Database Management
- Analytical Thinking

---

# 👩‍💻 Author

**Priya Pal**

📧 Email: palpriyak04@gmail.com

🔗 LinkedIn: www.linkedin.com/in/priyakailashnathpal

💻 GitHub: https://github.com/priyapaldatahub

---

# ⭐ Support

If you found this project helpful, please consider giving it a ⭐ on GitHub.
