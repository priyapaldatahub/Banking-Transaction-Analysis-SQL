USE Banking_Transaction;

###SUBQUERIES

#1. Customers whose annual income is above the average income.
SELECT customer_id,
       name,
       annual_income
FROM customers
WHERE annual_income >
(
    SELECT AVG(annual_income)
    FROM customers
);


#2. Accounts having balance greater than average balance.
SELECT account_id,
       customer_id,
       balance
FROM accounts
WHERE balance >
(
    SELECT AVG(balance)
    FROM accounts
);


#3. Customer(s) having the highest credit score.
SELECT customer_id,
       name,
       credit_score
FROM customers
WHERE credit_score =
(
    SELECT MAX(credit_score)
    FROM customers
);


#4. Employee(s) earning the highest salary.
SELECT employee_id,
       name,
       salary
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);


#5. Largest loan amount.
SELECT *
FROM loans
WHERE loan_amount =
(
    SELECT MAX(loan_amount)
    FROM loans
);


#6. Largest transaction.
SELECT *
FROM transactions
WHERE amount =
(
    SELECT MAX(amount)
    FROM transactions
);


#7. Branch having maximum total loan amount.
SELECT branch_id,
       SUM(loan_amount) AS total_loan
FROM loans
GROUP BY branch_id
HAVING SUM(loan_amount)=
(
SELECT MAX(total_loan)
FROM
(
SELECT SUM(loan_amount) AS total_loan
FROM loans
GROUP BY branch_id
) x
);


#8. Customers having more than average account balance.
SELECT DISTINCT customer_id
FROM accounts
GROUP BY customer_id
HAVING AVG(balance)>
(
SELECT AVG(balance)
FROM accounts
);


### CORRELATED SUBQUERY
#9. Highest balance account in each branch.
SELECT *
FROM accounts a
WHERE balance=
(
SELECT MAX(balance)
FROM accounts
WHERE branch_id=a.branch_id
);


#10. Highest paid employee in each branch.
SELECT *
FROM employees e
WHERE salary=
(
SELECT MAX(salary)
FROM employees
WHERE branch_id=e.branch_id
);


#11. Largest loan in each loan type.
SELECT *
FROM loans l
WHERE loan_amount=
(
SELECT MAX(loan_amount)
FROM loans
WHERE loan_type=l.loan_type
);


#12. Customer having maximum balance in each city.
SELECT c.customer_id,
       c.name,
       c.city,
       a.balance
FROM customers c
JOIN accounts a
ON c.customer_id=a.customer_id
WHERE a.balance=
(
SELECT MAX(a2.balance)
FROM customers c2
JOIN accounts a2
ON c2.customer_id=a2.customer_id
WHERE c2.city=c.city
);



### EXISTS
#13. Customers having at least one account.
SELECT *
FROM customers c
WHERE EXISTS
(
SELECT *
FROM accounts a
WHERE a.customer_id=c.customer_id
);


#14. Customers who have taken a loan.
SELECT *
FROM customers c
WHERE EXISTS
(
SELECT *
FROM loans l
WHERE l.customer_id=c.customer_id
);


#15. Accounts having transactions.
SELECT *
FROM accounts a
WHERE EXISTS
(
SELECT *
FROM transactions t
WHERE t.account_id=a.account_id
);


#16. Customers who raised support tickets.
SELECT *
FROM customers c
WHERE EXISTS
(
SELECT *
FROM support_tickets s
WHERE s.customer_id=c.customer_id
);



###NOT EXISTS

#17. Customers without loans.
SELECT *
FROM customers c
WHERE NOT EXISTS
(
SELECT *
FROM loans l
WHERE l.customer_id=c.customer_id
);


#18. Customers without cards.
SELECT *
FROM customers c
WHERE NOT EXISTS
(
SELECT *
FROM cards ca
WHERE ca.customer_id=c.customer_id
);


#19. Accounts without transactions.
SELECT *
FROM accounts a
WHERE NOT EXISTS
(
SELECT *
FROM transactions t
WHERE t.account_id=a.account_id
);


#20. Customers without support tickets.
SELECT *
FROM customers c
WHERE NOT EXISTS
(
SELECT *
FROM support_tickets s
WHERE s.customer_id=c.customer_id
);


###ADVANCED BUSINESS ANALYSIS
#21. Top 10 customers by transaction amount.
SELECT
c.customer_id,
c.name,
SUM(t.amount) AS total_transaction
FROM customers c
JOIN accounts a
ON c.customer_id=a.customer_id
JOIN transactions t
ON a.account_id=t.account_id
GROUP BY c.customer_id,c.name
ORDER BY total_transaction DESC
LIMIT 10;


#22. Branch with highest account balance.
SELECT
branch_id,
SUM(balance) total_balance
FROM accounts
GROUP BY branch_id
ORDER BY total_balance DESC
LIMIT 1;


#23. Most popular transaction type.
SELECT
txn_type,
COUNT(*) total_transactions
FROM transactions
GROUP BY txn_type
ORDER BY total_transactions DESC
LIMIT 1;


#24. Customer having maximum number of accounts.
SELECT
customer_id,
COUNT(account_id) total_accounts
FROM accounts
GROUP BY customer_id
ORDER BY total_accounts DESC
LIMIT 1;


#25. Branch having maximum number of customers.
SELECT
branch_id,
COUNT(DISTINCT customer_id) total_customers
FROM accounts
GROUP BY branch_id
ORDER BY total_customers DESC
LIMIT 1;