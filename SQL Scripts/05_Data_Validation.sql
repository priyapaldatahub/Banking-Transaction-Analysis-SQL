USE Banking_Transaction;
#Total Records in Each Table

SELECT COUNT(*) AS Total_Branches FROM branches;

SELECT COUNT(*) AS Total_Customers FROM customers;

SELECT COUNT(*) AS Total_Employees FROM employees;

SELECT COUNT(*) AS Total_Accounts FROM accounts;

SELECT COUNT(*) AS Total_Cards FROM cards;

SELECT COUNT(*) AS Total_Loans FROM loans;

SELECT COUNT(*) AS Total_Loan_Payments FROM loan_payments;

SELECT COUNT(*) AS Total_Transactions FROM transactions;

SELECT COUNT(*) AS Total_Support_Tickets FROM support_tickets;


#Check for NULL values in primary key
SELECT * FROM branches WHERE branch_id IS NULL;
SELECT * FROM customers WHERE customer_id IS NULL;
SELECT * FROM employees WHERE employee_id IS NULL;
SELECT * FROM accounts WHERE account_id IS NULL;
SELECT * FROM cards WHERE card_id IS NULL;
SELECT * FROM loans WHERE loan_id IS NULL;
SELECT * FROM loan_payments WHERE payment_id IS NULL;
SELECT * FROM transactions WHERE transaction_id IS NULL;
SELECT * FROM support_tickets WHERE ticket_id IS NULL;

#Check for duplicate primary keys
-- Branches
SELECT branch_id, COUNT(*) AS duplicate_count
FROM branches
GROUP BY branch_id
HAVING COUNT(*) > 1;

-- Customers
SELECT customer_id, COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

#Employee
SELECT employee_id, COUNT(*) AS duplicate_count
FROM employees
GROUP BY employee_id
HAVING COUNT(*) > 1;


# Accounts
SELECT account_id, COUNT(*) AS duplicate_count
FROM accounts
GROUP BY account_id
HAVING COUNT(*) > 1;

# Cards
SELECT card_id, COUNT(*) AS duplicate_count
FROM cards
GROUP BY card_id
HAVING COUNT(*) > 1;

# Loans
SELECT loan_id, COUNT(*) AS duplicate_count
FROM loans
GROUP BY loan_id
HAVING COUNT(*) > 1;


#Loan Payments
SELECT payment_id, COUNT(*) AS duplicate_count
FROM loan_payments
GROUP BY payment_id
HAVING COUNT(*) > 1;


# Transactions
SELECT transaction_id, COUNT(*) AS duplicate_count
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;


#Support Tickets
SELECT ticket_id, COUNT(*) AS duplicate_count
FROM support_tickets
GROUP BY ticket_id
HAVING COUNT(*) > 1;


#Business Rule Validation
-- 1. Accounts with Negative Balance
SELECT *
FROM accounts
WHERE balance < 0;


-- 2. Customers with Invalid Credit Score
-- Valid Range: 300 - 900
SELECT *
FROM customers
WHERE credit_score NOT BETWEEN 300 AND 900;


-- 3. Customers with Negative Annual Income
SELECT *
FROM customers
WHERE annual_income < 0;



-- 4. Accounts with Invalid Status
SELECT *
FROM accounts
WHERE status NOT IN ('Active','Inactive','Closed','Frozen');


-- 5. Accounts Opened Before Customer Joined
SELECT
    a.account_id,
    c.customer_id,
    c.join_date,
    a.open_date
FROM accounts a
JOIN customers c
ON a.customer_id = c.customer_id
WHERE a.open_date < c.join_date;


-- 6. Loan Amount Should Be Greater Than Zero
SELECT *
FROM loans
WHERE loan_amount <= 0;


-- 7. Interest Rate Should Be Positive
SELECT *
FROM loans
WHERE interest_rate <= 0;


-- 8. Loan Term Should Be Greater Than Zero
SELECT *
FROM loans
WHERE term_months <= 0;



-- 9. Invalid Loan Status
SELECT *
FROM loans
WHERE status NOT IN ('Active','Closed','Completed','Defaulted');



-- 10. Loan Payment Amount Should Be Positive
SELECT *
FROM loan_payments
WHERE amount_paid <= 0;



-- 11. Principal Component Should Be Positive
SELECT *
FROM loan_payments
WHERE principal_component < 0;



-- 12. Interest Component Should Be Positive
SELECT *
FROM loan_payments
WHERE interest_component < 0;


-- 13. Principal + Interest Should Equal Amount Paid
SELECT *
FROM loan_payments
WHERE ROUND(principal_component + interest_component,2)
<> ROUND(amount_paid,2);



-- 14. Transaction Amount Should Be Positive
SELECT *
FROM transactions
WHERE amount <= 0;



-- 15. Invalid Transaction Type
SELECT *
FROM transactions
WHERE txn_type NOT IN
('Deposit',
 'Withdrawal',
 'Transfer In',
 'Transfer Out',
 'Interest Credit',
 'Fee Debit');



-- 16. Invalid Transaction Channel
SELECT *
FROM transactions
WHERE channel IS NULL
   OR TRIM(channel)='';



-- 17. Card Expiry Date Should Be After Issue Date
SELECT *
FROM cards
WHERE expiry_date <= issue_date;



-- 18. Credit Limit Cannot Be Negative
SELECT *
FROM cards
WHERE credit_limit < 0;



-- 19. Invalid Card Status
SELECT *
FROM cards
WHERE status NOT IN ('Active','Inactive','Blocked','Expired');



-- 20. Employee Salary Should Be Positive
SELECT *
FROM employees
WHERE salary <= 0;



-- 21. Employee Hiring Date Should Not Be Future Date
SELECT *
FROM employees
WHERE hiring_date > CURDATE();



-- 22. Customer Date of Birth Should Not Be Future Date
SELECT *
FROM customers
WHERE date_of_birth > CURDATE();



-- 23. Customer Join Date Should Not Be Future Date
SELECT *
FROM customers
WHERE join_date > CURDATE();



-- 24. Loan Start Date Should Not Be Future Date
SELECT *
FROM loans
WHERE start_date > CURDATE();



-- 25. Transaction Date Should Not Be Future Date
SELECT *
FROM transactions
WHERE txn_date > CURDATE();



-- 26. Support Ticket Resolution Date Cannot Be Before Open Date
SELECT *
FROM support_tickets
WHERE date_resolved IS NOT NULL
AND date_resolved < date_opened;



-- 27. Satisfaction Score Should Be Between 1 and 5
SELECT *
FROM support_tickets
WHERE satisfaction_score NOT BETWEEN 1 AND 5
AND satisfaction_score IS NOT NULL;



-- 28. Duplicate Phone Numbers
SELECT phone,
COUNT(*) AS duplicate_count
FROM customers
GROUP BY phone
HAVING COUNT(*) > 1;


-- 29. Duplicate Email Addresses
SELECT email,
COUNT(*) AS duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;



-- 30. Customers Without Any Account
SELECT c.customer_id,
       c.name
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.customer_id IS NULL;
WHERE a.customer_id IS NULL;