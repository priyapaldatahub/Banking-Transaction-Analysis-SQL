USE Banking_Transaction;

#1: Customer Name

CREATE INDEX idx_customer_name
ON customers(name);

# 2: Customer City

CREATE INDEX idx_customer_city
ON customers(city);

#3: Account Customer

CREATE INDEX idx_account_customer
ON accounts(customer_id);

#4: Transaction Date

CREATE INDEX idx_transaction_date
ON transactions(txn_date);

# 5: Transaction Account

CREATE INDEX idx_transaction_account
ON transactions(account_id);

#6: Loan Customer

CREATE INDEX idx_loan_customer
ON loans(customer_id);

#7: Card Customer

CREATE INDEX idx_card_customer
ON cards(customer_id);

#8: Employee Branch

CREATE INDEX idx_employee_branch
ON employees(branch_id);

#Verify Indexes

SHOW INDEX FROM customers;

SHOW INDEX FROM accounts;

SHOW INDEX FROM transactions;

SHOW INDEX FROM loans;

SHOW INDEX FROM cards;

SHOW INDEX FROM employees;