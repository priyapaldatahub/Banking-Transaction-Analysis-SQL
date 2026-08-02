USE Banking_Transaction;
##Check for Orphan Records

#1. Employees → Branches
SELECT e.branch_id
FROM employees e
LEFT JOIN branches b
ON e.branch_id = b.branch_id
WHERE b.branch_id IS NULL;

#2. Accounts → Customers
SELECT a.customer_id
FROM accounts a
LEFT JOIN customers c
ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


#3. Accounts → Branches
SELECT a.branch_id
FROM accounts a
LEFT JOIN branches b
ON a.branch_id = b.branch_id
WHERE b.branch_id IS NULL;


#4. Transactions → Accounts
SELECT t.account_id
FROM transactions t
LEFT JOIN accounts a
ON t.account_id = a.account_id
WHERE a.account_id IS NULL;


#5. Cards → Customers
SELECT c.customer_id
FROM cards c
LEFT JOIN customers cu
ON c.customer_id = cu.customer_id
WHERE cu.customer_id IS NULL;


#6. Cards → Accounts
SELECT c.account_id
FROM cards c
LEFT JOIN accounts a
ON c.account_id = a.account_id
WHERE a.account_id IS NULL;


#7. Loans → Customers
SELECT l.customer_id
FROM loans l
LEFT JOIN customers c
ON l.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


#8. Loans → Branches
SELECT l.branch_id
FROM loans l
LEFT JOIN branches b
ON l.branch_id = b.branch_id
WHERE b.branch_id IS NULL;


#9. Loan Payments → Loans
SELECT lp.loan_id
FROM loan_payments lp
LEFT JOIN loans l
ON lp.loan_id = l.loan_id
WHERE l.loan_id IS NULL;


#10. Support Tickets → Customers
SELECT s.customer_id
FROM support_tickets s
LEFT JOIN customers c
ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


ALTER TABLE employees
ADD CONSTRAINT fk_employee_branch
FOREIGN KEY (branch_id)
REFERENCES branches(branch_id);

ALTER TABLE accounts
ADD CONSTRAINT fk_account_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE accounts
ADD CONSTRAINT fk_account_branch
FOREIGN KEY (branch_id)
REFERENCES branches(branch_id);

ALTER TABLE transactions
ADD CONSTRAINT fk_transaction_account
FOREIGN KEY (account_id)
REFERENCES accounts(account_id);

ALTER TABLE cards
ADD CONSTRAINT fk_card_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE cards
ADD CONSTRAINT fk_card_account
FOREIGN KEY (account_id)
REFERENCES accounts(account_id);

ALTER TABLE loans
ADD CONSTRAINT fk_loan_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE loans
ADD CONSTRAINT fk_loan_branch
FOREIGN KEY (branch_id)
REFERENCES branches(branch_id);

ALTER TABLE loan_payments
ADD CONSTRAINT fk_payment_loan
FOREIGN KEY (loan_id)
REFERENCES loans(loan_id);

ALTER TABLE support_tickets
ADD CONSTRAINT fk_ticket_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);