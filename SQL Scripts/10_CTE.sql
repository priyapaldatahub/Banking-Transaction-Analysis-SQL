USE Banking_Transaction;

# Customers with Above Average Balance

WITH AvgBalance AS (
    SELECT AVG(balance) AS avg_balance
    FROM accounts
)
SELECT
    account_id,
    customer_id,
    balance
FROM accounts
WHERE balance > (SELECT avg_balance FROM AvgBalance);


# Branch-wise Total Balance
WITH BranchBalance AS (
    SELECT
        branch_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY branch_id
)
SELECT *
FROM BranchBalance
ORDER BY total_balance DESC;


# Top 5 Customers by Transaction Amount
WITH CustomerTransactions AS (
    SELECT
        a.customer_id,
        SUM(t.amount) AS total_transaction
    FROM accounts a
    JOIN transactions t
    ON a.account_id = t.account_id
    GROUP BY a.customer_id
)
SELECT *
FROM CustomerTransactions
ORDER BY total_transaction DESC
LIMIT 5;


# Average Loan Amount by Loan Type
WITH LoanAverage AS (
    SELECT
        loan_type,
        AVG(loan_amount) AS avg_loan
    FROM loans
    GROUP BY loan_type
)
SELECT *
FROM LoanAverage;


#Customers Having More Than One Account
WITH MultiAccounts AS (
    SELECT
        customer_id,
        COUNT(*) AS total_accounts
    FROM accounts
    GROUP BY customer_id
)
SELECT *
FROM MultiAccounts
WHERE total_accounts > 1;


#Branch with Highest Number of Accounts
WITH BranchAccounts AS (
    SELECT
        branch_id,
        COUNT(*) AS total_accounts
    FROM accounts
    GROUP BY branch_id
)
SELECT *
FROM BranchAccounts
ORDER BY total_accounts DESC
LIMIT 1;

#Monthly Transaction Summary
WITH MonthlyTransactions AS (
    SELECT
        YEAR(txn_date) AS year,
        MONTH(txn_date) AS month,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY YEAR(txn_date), MONTH(txn_date)
)
SELECT *
FROM MonthlyTransactions
ORDER BY year, month;


#High Credit Score Customers
WITH HighCredit AS (
    SELECT
        customer_id,
        name,
        credit_score
    FROM customers
    WHERE credit_score >= 750
)
SELECT *
FROM HighCredit;


#Employees with Salary Above Branch Average
WITH BranchSalary AS (
    SELECT
        branch_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY branch_id
)
SELECT
    e.employee_id,
    e.name,
    e.branch_id,
    e.salary
FROM employees e
JOIN BranchSalary b
ON e.branch_id = b.branch_id
WHERE e.salary > b.avg_salary;


#Customers with Active Loans
WITH ActiveLoans AS (
    SELECT
        customer_id,
        loan_amount
    FROM loans
    WHERE status = 'Active'
)
SELECT
    c.customer_id,
    c.name,
    a.loan_amount
FROM customers c
JOIN ActiveLoans a
ON c.customer_id = a.customer_id;
