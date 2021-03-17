/*autocommit by default is set to on*/
Set autocommit = off;

/*start a transaction*/
start transaction;

/*UPDATE ACCOUNT 123 */
UPDATE account
SET avail_balance = avail_balance - 50
WHERE account_id = 123;

/*UPDATE ACCOUNT 789 */
UPDATE account
SET avail_balance = avail_balance + 50
WHERE account_id = 789;

/*set new transactions*/
INSERT INTO transaction
	(txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
	(1003, '2020-11-29 15:02:35', 123, 'D', 50 ),
    (1004, '2020-11-29 15:03:04', 789, 'C', 50 ); 
    
/*Don't forget to commit*/
commit;
