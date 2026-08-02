USE Banking_Transaction;

## Get Customer Details by ID
DELIMITER $$

CREATE PROCEDURE GetCustomerByID(IN p_customer_id INT)
BEGIN
    SELECT *
    FROM customers
    WHERE customer_id = p_customer_id;
END $$

DELIMITER ;

CALL GetCustomerByID(100);

# Get Account Details by Customer ID
DELIMITER $$

CREATE PROCEDURE GetAccountsByCustomer(IN p_customer_id INT)
BEGIN
    SELECT
        account_id,
        account_type,
        balance,
        status
    FROM accounts
    WHERE customer_id = p_customer_id;
END $$

DELIMITER ;

CALL GetAccountsByCustomer(100);

# Total Balance of a Customer
DELIMITER $$

CREATE PROCEDURE GetTotalBalance(IN p_customer_id INT)
BEGIN
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    WHERE customer_id = p_customer_id
    GROUP BY customer_id;
END $$

DELIMITER ;


CALL GetTotalBalance(100);


#Transactions Between Two Dates
DELIMITER $$

CREATE PROCEDURE GetTransactionsByDate(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT *
    FROM transactions
    WHERE txn_date BETWEEN start_date AND end_date;
END $$

DELIMITER ;

CALL GetTransactionsByDate('2023-01-01','2023-12-31');


#Branch-wise Total Account Balance
DELIMITER $$

CREATE PROCEDURE GetBranchBalance()
BEGIN
    SELECT
        b.branch_id,
        b.branch_name,
        SUM(a.balance) AS total_balance
    FROM branches b
    JOIN accounts a
    ON b.branch_id = a.branch_id
    GROUP BY b.branch_id, b.branch_name
    ORDER BY total_balance DESC;
END $$

DELIMITER ;

CALL GetBranchBalance();

SHOW PROCEDURE STATUS
WHERE Db = DATABASE();