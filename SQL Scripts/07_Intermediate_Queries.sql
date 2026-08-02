USE Banking_Transaction;

####Customer & Account

#1. Show customer details with account information.
SELECT
    c.customer_id,
    c.name,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;


#2. Show customers who have multiple accounts.
SELECT
    customer_id,
    COUNT(account_id) AS total_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1;


#3. Show customers without any account.
SELECT
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL;


####Branch Analysis

#4. Number of accounts in each branch.
SELECT
    branch_id,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY branch_id;

#5. Average balance by branch.
SELECT
    branch_id,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY branch_id;

###Transaction Analysis
#6. Total transaction amount by account.
SELECT
    account_id,
    SUM(amount) AS total_transaction
FROM transactions
GROUP BY account_id;


#7. Top 10 accounts by transaction value.
SELECT
    account_id,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY account_id
ORDER BY total_amount DESC
LIMIT 10;


#8. Monthly transaction count.
SELECT
    YEAR(txn_date) AS year,
    MONTH(txn_date) AS month,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY YEAR(txn_date), MONTH(txn_date)
ORDER BY year, month;
###Loan Analysis
#9. Customer loan details.
SELECT
    c.name,
    l.loan_type,
    l.loan_amount,
    l.status
FROM customers c
INNER JOIN loans l
ON c.customer_id = l.customer_id;


#10. Total loan amount by branch.
SELECT
    branch_id,
    SUM(loan_amount) AS total_loans
FROM loans
GROUP BY branch_id;

#Employee Analysis
#11. Employee details with branch name.
SELECT
    e.employee_id,
    e.name,
    b.branch_name,
    e.role
FROM employees e
INNER JOIN branches b
ON e.branch_id = b.branch_id;


#12. Number of employees per branch.
SELECT
    branch_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY branch_id;


####Cards
#13. Customer card details.
SELECT
    c.name,
    ca.card_type,
    ca.status
FROM customers c
INNER JOIN cards ca
ON c.customer_id = ca.customer_id;


#14. Number of cards by type.
SELECT
    card_type,
    COUNT(*) AS total_cards
FROM cards
GROUP BY card_type;


###Support Tickets

#15. Customer support history.
SELECT
    c.name,
    s.issue_type,
    s.status
FROM customers c
INNER JOIN support_tickets s
ON c.customer_id = s.customer_id;


###CASE Statement
#16. Categorize customers by credit score.
SELECT
    customer_id,
    name,
    credit_score,
    CASE
        WHEN credit_score >= 750 THEN 'Excellent'
        WHEN credit_score >= 650 THEN 'Good'
        WHEN credit_score >= 550 THEN 'Average'
        ELSE 'Poor'
    END AS credit_category
FROM customers;


#17. Categorize account balance.
SELECT
    account_id,
    balance,
    CASE
        WHEN balance >= 100000 THEN 'High Balance'
        WHEN balance >= 50000 THEN 'Medium Balance'
        ELSE 'Low Balance'
    END AS balance_category
FROM accounts;


###HAVING

#18. Branches having more than 500 accounts.
SELECT
    branch_id,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY branch_id
HAVING COUNT(*) > 500;


#19. Customers with more than 3 transactions.
SELECT
    a.customer_id,
    COUNT(t.transaction_id) AS total_transactions
FROM accounts a
JOIN transactions t
ON a.account_id = t.account_id
GROUP BY a.customer_id
HAVING COUNT(t.transaction_id) > 3;


##UNION
#20. List all Active Accounts and Active Loans.
SELECT
    customer_id,
    'Account' AS source
FROM accounts
WHERE status = 'Active'

UNION

SELECT
    customer_id,
    'Loan' AS source
FROM loans
WHERE status = 'Active';


### LEFT JOIN

#21. Customers and their Accounts (LEFT JOIN)

SELECT
    c.customer_id,
    c.name,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
ORDER BY c.customer_id;


###. RIGHT JOIN

# Branches and Employees (RIGHT JOIN)

SELECT
    e.employee_id,
    e.name AS employee_name,
    b.branch_id,
    b.branch_name,
    b.city
FROM employees e
RIGHT JOIN branches b
ON e.branch_id = b.branch_id
ORDER BY b.branch_id;


####SELF JOIN

#Employees Working in the Same Branch

SELECT
    e1.employee_id AS Employee1_ID,
    e1.name AS Employee1,
    e2.employee_id AS Employee2_ID,
    e2.name AS Employee2,
    e1.branch_id
FROM employees e1
JOIN employees e2
ON e1.branch_id = e2.branch_id
AND e1.employee_id < e2.employee_id
ORDER BY e1.branch_id;


### UNION ALL

#24. UNION ALL Example

SELECT
    customer_id,
    'Account' AS Source
FROM accounts

UNION ALL

SELECT
    customer_id,
    'Loan' AS Source
FROM loans;

#Difference:


### Multiple Table JOIN

#25. Complete Customer Banking Information

SELECT
    c.customer_id,
    c.name,
    a.account_id,
    a.account_type,
    a.balance,
    b.branch_name,
    ca.card_type,
    l.loan_type,
    l.loan_amount
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN branches b
    ON a.branch_id = b.branch_id
LEFT JOIN cards ca
    ON c.customer_id = ca.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY c.customer_id;
