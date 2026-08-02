USE Banking_Transaction;
#Branches table
CREATE TABLE branches (
    branch_id INT NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    ifsc_code VARCHAR(20) UNIQUE,

    PRIMARY KEY (branch_id)
);
DESCRIBE branches;
SHOW TABLES;

#customer table
CREATE TABLE customers (
    customer_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    occupation VARCHAR(100),
    annual_income DECIMAL(12,2),
    credit_score INT,
    join_date DATE,

    PRIMARY KEY (customer_id)
);
DESCRIBE customers;

#Employee table

CREATE TABLE employees (
    employee_id INT NOT NULL,
    branch_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(12,2),
    hire_date DATE,

    PRIMARY KEY (employee_id)
);

DESCRIBE employees;

#Account table
CREATE TABLE accounts (
    account_id INT NOT NULL,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type VARCHAR(30),
    balance DECIMAL(15,2),
    open_date DATE,
    status VARCHAR(20),

    PRIMARY KEY (account_id)
);
DESCRIBE accounts;

#card table
CREATE TABLE cards (
    card_id INT NOT NULL,
    customer_id INT NOT NULL,
    account_id INT NOT NULL,
    card_type VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    credit_limit DECIMAL(15,2),
    status VARCHAR(20),

    PRIMARY KEY (card_id)
);

DESCRIBE cards;

#loans table
CREATE TABLE loans (
    loan_id INT NOT NULL,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    loan_type VARCHAR(50),
    loan_amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    term_months INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),

    PRIMARY KEY (loan_id)
);

DESCRIBE loans;

#Loans payment 
CREATE TABLE loan_payments (
    payment_id INT NOT NULL,
    loan_id INT NOT NULL,
    payment_date DATE,
    amount_paid DECIMAL(15,2),
    principal_component DECIMAL(15,2),
    interest_component DECIMAL(15,2),
    late_payment_flag BOOLEAN,

    PRIMARY KEY (payment_id)
);

DESCRIBE loan_payments;

#Transactions Table
CREATE TABLE transactions (
    transaction_id BIGINT NOT NULL,
    account_id INT NOT NULL,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(15,2),
    channel VARCHAR(30),
    merchant_category VARCHAR(100),

    PRIMARY KEY (transaction_id)
);

DESCRIBE transactions;

#Support Tickets Table
CREATE TABLE support_tickets (
    ticket_id INT NOT NULL,
    customer_id INT NOT NULL,
    issue_type VARCHAR(100),
    priority VARCHAR(20),
    status VARCHAR(20),
    date_opened DATE,
    date_resolved DATE,
    satisfaction_score INT,

    PRIMARY KEY (ticket_id)
);

DESCRIBE support_tickets;

SHOW TABLES;