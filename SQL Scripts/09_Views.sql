USE Banking_Transaction;

#View 1: Customer Account Summary
CREATE VIEW vw_customer_accounts AS
SELECT
    c.customer_id,
    c.name,
    c.city,
    a.account_id,
    a.account_type,
    a.balance,
    a.status
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;

#Test it:

SELECT * FROM vw_customer_accounts;

#View 2: Customer Loan Details
CREATE VIEW vw_customer_loans AS
SELECT
    c.customer_id,
    c.name,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.status
FROM customers c
JOIN loans l
ON c.customer_id = l.customer_id;
SELECT * FROM vw_customer_loans;


#View 3: Transaction Details
CREATE VIEW vw_transaction_details AS
SELECT
    t.transaction_id,
    t.txn_date,
    t.txn_type,
    t.amount,
    a.account_id,
    c.customer_id,
    c.name
FROM transactions t
JOIN accounts a
ON t.account_id = a.account_id
JOIN customers c
ON a.customer_id = c.customer_id;


#View 4: Branch Performance
CREATE VIEW vw_branch_performance AS
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(a.account_id) AS total_accounts,
    SUM(a.balance) AS total_balance
FROM branches b
LEFT JOIN accounts a
ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;


#View 5: Employee Details
CREATE VIEW vw_employee_details AS
SELECT
    e.employee_id,
    e.name,
    e.role,
    b.branch_name,
    b.city
FROM employees e
JOIN branches b
ON e.branch_id = b.branch_id;


# 6: Card Information
CREATE VIEW vw_card_details AS
SELECT
    c.customer_id,
    c.name,
    ca.card_type,
    ca.credit_limit,
    ca.status
FROM customers c
JOIN cards ca
ON c.customer_id = ca.customer_id;


#View 7: Support Ticket Summary
CREATE VIEW vw_support_summary AS
SELECT
    c.customer_id,
    c.name,
    s.issue_type,
    s.status,
    s.satisfaction_score
FROM customers c
JOIN support_tickets s
ON c.customer_id = s.customer_id;


#View 8: Loan Payment Summary
CREATE VIEW vw_loan_payment_summary AS
SELECT
    l.loan_id,
    c.name,
    l.loan_amount,
    SUM(lp.amount_paid) AS total_paid
FROM loans l
JOIN customers c
ON l.customer_id = c.customer_id
JOIN loan_payments lp
ON l.loan_id = lp.loan_id
GROUP BY l.loan_id, c.name, l.loan_amount;


SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SELECT * FROM vw_customer_accounts LIMIT 10;
SELECT * FROM vw_customer_loans LIMIT 10;
SELECT * FROM vw_transaction_details LIMIT 10;
SELECT * FROM vw_branch_performance LIMIT 10;
SELECT * FROM vw_employee_details LIMIT 10;
SELECT * FROM vw_card_details LIMIT 10;
SELECT * FROM vw_support_summary LIMIT 10;
SELECT * FROM vw_loan_payment_summary LIMIT 10;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';