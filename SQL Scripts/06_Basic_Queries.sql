USE Banking_Transaction;

###Customer Analysis
#1. Display all customers.
SELECT *
FROM customers;


#2. Display only female customers.
SELECT *
FROM customers
WHERE gender='Female';


#3. Display customers from Mumbai.
SELECT *
FROM customers
WHERE city='Mumbai';


#4. Count total customers.
SELECT COUNT(*) AS Total_Customers
FROM customers;


#5. Show distinct occupations.
SELECT DISTINCT occupation
FROM customers;


###Account Analysis
#6. Display active accounts.
SELECT *
FROM accounts
WHERE status='Active';


#7. Top 10 highest balance accounts.
SELECT *
FROM accounts
ORDER BY balance DESC
LIMIT 10;


#8. Average account balance.
SELECT AVG(balance) AS Average_Balance
FROM accounts;


#9. Minimum account balance.
SELECT MIN(balance) AS Minimum_Balance
FROM accounts;


#10. Maximum account balance.
SELECT MAX(balance) AS Maximum_Balance
FROM accounts;


###Transaction Analysis
#11. Total number of transactions.
SELECT COUNT(*) AS Total_Transactions
FROM transactions;


#12. Total transaction amount.
SELECT SUM(amount) AS Total_Transaction_Amount
FROM transactions;


#13. Average transaction amount.
SELECT AVG(amount) AS Average_Transaction
FROM transactions;


#14. Highest transaction.
SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 1;


#15. Count transactions by type.
SELECT txn_type,
COUNT(*) AS Total
FROM transactions
GROUP BY txn_type;


###Loan Analysis
#16. Count loans by status.
SELECT status,
COUNT(*) AS Total_Loans
FROM loans
GROUP BY status;


#17. Average loan amount.
SELECT AVG(loan_amount) AS Average_Loan
FROM loans;


###Employee Analysis
#18. Highest paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 10;

###Card Analysis
#19. Count cards by type.
SELECT card_type,
COUNT(*) AS Total_Cards
FROM cards
GROUP BY card_type;


###Support Ticket Analysis
#20. Count tickets by status.
SELECT status,
COUNT(*) AS Total_Tickets
FROM support_tickets
GROUP BY status;
