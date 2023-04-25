CREATE DATABASE fohnsdorf_bank;
USE fohnsdorf_bank;

CREATE TABLE accounts (
    account_number INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (account_number, account_holder, balance)
VALUES (1000, 'Wolfgang Szombath', 5000.00),
       (1001, 'Markus Gschaider', 3000.00),
       (1002, 'Christian Kaiser', 10000.00);

DELIMITER //
CREATE PROCEDURE perform_transfer(
    IN sender_account_number INT,
    IN receiver_account_number INT,
    IN transfer_amount DECIMAL(10, 2)
)
BEGIN
    DECLARE sender_new_balance DECIMAL(10, 2);
    DECLARE receiver_new_balance DECIMAL(10, 2);

    START TRANSACTION;

    SELECT balance INTO sender_new_balance
    FROM accounts
    WHERE account_number = sender_account_number;

    SELECT balance INTO receiver_new_balance
    FROM accounts
    WHERE account_number = receiver_account_number;

    SET sender_new_balance = sender_new_balance - transfer_amount;
    SET receiver_new_balance = receiver_new_balance + transfer_amount;

    IF sender_new_balance >= 0 THEN
        UPDATE accounts
        SET balance = sender_new_balance
        WHERE account_number = sender_account_number;

        UPDATE accounts
        SET balance = receiver_new_balance
        WHERE account_number = receiver_account_number;

        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END//
DELIMITER ;

CALL perform_transfer(1000, 1001, 1000); -- Wolfgang Szombath überweist 1000 an Markus Gschaider

CALL perform_transfer(1001, 1002, 500); -- Markus Gschaider überweist 500 an Christian Kaiser
SELECT * FROM accounts;

CALL perform_transfer(1000, 1002, 6000); -- Diese Transaktion sollte fehlschlagen, da Wolfgang Szombath nicht genug Geld hat
SELECT * FROM accounts;

