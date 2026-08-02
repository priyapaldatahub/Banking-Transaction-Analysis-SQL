USE Banking_Transaction;

# Prevent Negative Account Balance
DELIMITER $$

CREATE TRIGGER trg_prevent_negative_balance
BEFORE UPDATE ON accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Balance cannot be negative';
    END IF;
END $$

DELIMITER ;
#Test
UPDATE accounts
SET balance = -500
WHERE account_id = 1;


##Prevent Negative Loan Amount
DELIMITER $$

CREATE TRIGGER trg_check_loan_amount
BEFORE INSERT ON loans
FOR EACH ROW
BEGIN
    IF NEW.loan_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Loan amount must be greater than zero';
    END IF;
END $$

DELIMITER ;
#Test
INSERT INTO loans
VALUES
(
999999,
1,
1,
'Home Loan',
-10000,
8.5,
60,
'2024-01-01',
'Active'
);
#Prevent Future Transaction Date
DELIMITER $$

CREATE TRIGGER trg_transaction_date
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.txn_date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Transaction date cannot be in future';
    END IF;
END $$

DELIMITER ;
#Test
INSERT INTO transactions
VALUES
(
999999,
1,
'2035-01-01',
'Deposit',
1000,
'UPI',
'Shopping'
);
# Prevent Invalid Credit Score
DELIMITER $$

CREATE TRIGGER trg_credit_score
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF NEW.credit_score < 300
       OR NEW.credit_score > 900 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Invalid Credit Score';

    END IF;
END $$

DELIMITER ;
#Test
INSERT INTO customers
VALUES
(
999999,
'Test User',
'Female',
'1998-01-01',
'Mumbai',
'Maharashtra',
9876543210,
'test@test.com',
'Engineer',
500000,
'2024-01-01',
950
);
# Prevent Card Expiry Before Issue Date
DELIMITER $$

CREATE TRIGGER trg_card_dates
BEFORE INSERT ON cards
FOR EACH ROW
BEGIN
    IF NEW.expiry_date <= NEW.issue_date THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Expiry Date must be after Issue Date';

    END IF;
END $$

DELIMITER ;
#Test
INSERT INTO cards
VALUES
(
999999,
1,
1,
'Credit',
'2025-01-01',
'2024-01-01',
100000,
'Active'
);

#Verify Triggers
SHOW TRIGGERS;