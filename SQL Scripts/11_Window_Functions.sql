USE Banking_Transaction;

#1. Rank customers by annual income
SELECT
    customer_id,
    name,
    annual_income,
    RANK() OVER(ORDER BY annual_income DESC) AS income_rank
FROM customers;


#2. Dense Rank customers by credit score
SELECT
    customer_id,
    name,
    credit_score,
    DENSE_RANK() OVER(ORDER BY credit_score DESC) AS credit_rank
FROM customers;


#3. Row Number for transactions
SELECT
    transaction_id,
    account_id,
    amount,
    ROW_NUMBER() OVER(ORDER BY amount DESC) AS row_num
FROM transactions;


#4. Rank accounts within each branch
SELECT
    account_id,
    branch_id,
    balance,
    RANK() OVER(PARTITION BY branch_id ORDER BY balance DESC) AS balance_rank
FROM accounts;


#5. Running total of transactions
SELECT
    transaction_id,
    txn_date,
    amount,
    SUM(amount) OVER(
        ORDER BY txn_date
    ) AS running_total
FROM transactions;

#6. Running total by account
SELECT
    account_id,
    txn_date,
    amount,
    SUM(amount) OVER(
        PARTITION BY account_id
        ORDER BY txn_date
    ) AS account_running_total
FROM transactions;


#7. Average salary by branch
SELECT
    employee_id,
    name,
    branch_id,
    salary,
    AVG(salary) OVER(PARTITION BY branch_id) AS avg_branch_salary
FROM employees;


#8. Highest salary in each branch
SELECT
    employee_id,
    name,
    branch_id,
    salary,
    MAX(salary) OVER(PARTITION BY branch_id) AS highest_salary
FROM employees;


#9. Previous transaction amount (LAG)
SELECT
    account_id,
    txn_date,
    amount,
    LAG(amount) OVER(
        PARTITION BY account_id
        ORDER BY txn_date
    ) AS previous_transaction
FROM transactions;


#10. Next transaction amount (LEAD)
SELECT
    account_id,
    txn_date,
    amount,
    LEAD(amount) OVER(
        PARTITION BY account_id
        ORDER BY txn_date
    ) AS next_transaction
FROM transactions;


#. Difference from previous transaction
SELECT
    account_id,
    txn_date,
    amount,
    amount -
    LAG(amount) OVER(
        PARTITION BY account_id
        ORDER BY txn_date
    ) AS difference
FROM transactions;


#12. NTILE (Quartiles) by balance
SELECT
    account_id,
    balance,
    NTILE(4) OVER(ORDER BY balance DESC) AS quartile
FROM accounts;


#13. Percent Rank of salaries
SELECT
    employee_id,
    salary,
    PERCENT_RANK() OVER(ORDER BY salary) AS salary_percent_rank
FROM employees;


#14. Cumulative loan amount
SELECT
    loan_id,
    loan_amount,
    SUM(loan_amount) OVER(
        ORDER BY loan_amount
    ) AS cumulative_loan
FROM loans;


#15. Rank branches by total account balance
SELECT
    branch_id,
    total_balance,
    RANK() OVER(ORDER BY total_balance DESC) AS branch_rank
FROM
(
    SELECT
        branch_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY branch_id
) AS branch_summary;