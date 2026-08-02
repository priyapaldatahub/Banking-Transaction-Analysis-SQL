USE Banking_Transaction;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
USE Banking_Transaction;
##import of branches table.
LOAD DATA LOCAL INFILE 'C:\\Users\\Priya\\OneDrive\\Desktop\\Bank_projectsql\\dataset\\branches.csv'
INTO TABLE branches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM branches LIMIT 10;

SELECT opened_date
FROM branches
LIMIT 10;

TRUNCATE TABLE branches;

LOAD DATA LOCAL INFILE 'C:\\Users\\Priya\\OneDrive\\Desktop\\Bank_projectsql\\dataset\\branches.csv'
INTO TABLE branches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    branch_id,
    branch_name,
    city,
    state,
    @opened_date,
    ifsc_code
)
SET opened_date = STR_TO_DATE(@opened_date, '%d-%m-%Y');

SELECT branch_id, opened_date
FROM branches
LIMIT 10;

SELECT * FROM branches LIMIT 10;

##customer table
LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/customers (3).csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    customer_id,
    name,
    gender,
    @date_of_birth,
    city,
    state,
    phone,
    email,
    occupation,
    annual_income,
    @join_date,
    credit_score
)
SET
    date_of_birth = STR_TO_DATE(@date_of_birth, '%d-%m-%Y'),
    join_date = STR_TO_DATE(@join_date, '%d-%m-%Y');
    
#total record 
SELECT COUNT(*) AS total_customers
FROM customers;

#first 10
SELECT *
FROM customers
LIMIT 10;


#employee table
USE Banking_Transaction;

LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    employee_id,
    name,
    branch_id,
    role,
    @hiring_date,
    salary
)
SET
    hiring_date = STR_TO_DATE(@hiring_date, '%d-%m-%Y');
    DESCRIBE employees;
    
    
    #account table
    USE Banking_Transaction;

LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/accounts.csv'
INTO TABLE accounts
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    account_id,
    customer_id,
    branch_id,
    account_type,
    balance,
    @open_date,
    status
)
SET
    open_date = STR_TO_DATE(@open_date, '%d-%m-%Y');
    
    #cards table
    USE Banking_Transaction;

LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/cards.csv'
INTO TABLE cards
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    card_id,
    customer_id,
    account_id,
    card_type,
    @issue_date,
    @expiry_date,
    credit_limit,
    status
)
SET
    issue_date = STR_TO_DATE(@issue_date, '%d-%m-%Y'),
    expiry_date = STR_TO_DATE(@expiry_date, '%d-%m-%Y');
    
    
    #loans table
LOAD DATA LOCAL INFILE "C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/loans.csv"
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(loan_id,
customer_id,
branch_id,
loan_type,
loan_amount,
interest_rate,
term_months,
@start_date,
status
)
SET
    start_date = STR_TO_DATE(@start_date, '%d-%m-%Y')
    
    
    #loan payments
    USE Banking_Transaction;

LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/loan_payments.csv'
INTO TABLE loan_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    payment_id,
    loan_id,
    @payment_date,
    amount_paid,
    principal_component,
    interest_component,
    late_payment_flag
)
SET
    payment_date = STR_TO_DATE(@payment_date, '%d-%m-%Y');
    
    #support ticket
    USE Banking_Transaction;

LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/support_tickets.csv'
INTO TABLE support_tickets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    ticket_id,
    customer_id,
    issue_type,
    @date_opened,
    @date_resolved,
    status,
    satisfaction_score
)
SET
    date_opened = STR_TO_DATE(@date_opened, '%d-%m-%Y'),
    date_resolved = STR_TO_DATE(@date_resolved, '%d-%m-%Y');
    
    
    #Transaction
   SELECT COUNT(*) FROM transactions;
   SELECT * FROM transactions LIMIT 5;
   SELECT
    COUNT(*) AS total_rows,
    SUM(transaction_id IS NULL) AS transaction_id_nulls,
    SUM(account_id IS NULL) AS account_id_nulls,
    SUM(txn_date IS NULL) AS txn_date_nulls,
    SUM(txn_type IS NULL) AS txn_type_nulls,
    SUM(amount IS NULL) AS amount_nulls,
    SUM(channel IS NULL) AS channel_nulls,
    SUM(merchant_category IS NULL) AS merchant_category_nulls
FROM transactions;


LOAD DATA LOCAL INFILE 'C:/Temp/transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    transaction_id,
    account_id,
    @txn_date,
    txn_type,
    amount,
    channel,
    merchant_category
)
SET txn_date = STR_TO_DATE(@txn_date, '%d-%m-%Y');



TRUNCATE TABLE transactions;
LOAD DATA LOCAL INFILE 'C:/Users/Priya/OneDrive/Desktop/Bank_projectsql/dataset/transactions_100k.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    transaction_id,
    account_id,
    txn_date,
    txn_type,
    amount,
    channel,
    merchant_category
);