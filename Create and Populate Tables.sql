/*Creating a new Table as account table*/
CREATE TABLE `sakila`.`account` (
  `account_id` INT UNSIGNED NOT NULL,
  `avail_balance` DOUBLE NOT NULL,
  `last_activity_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`));
  
/*Populate the new table with data*/
INSERT INTO account
	(account_id, avail_balance, last_activity_date)
VALUES
	(123, 500, now()),
    (789, 75, now());
    
/*Get the data back to check the values*/
SELECT * FROM account;

/*Create a transaction table*/
CREATE TABLE `sakila`.`transaction` (
  `txn_id` INT UNSIGNED NOT NULL,
  `txn_date` DATETIME NULL,
  `account_id` INT NULL,
  `txn_type_cd` VARCHAR(1) NOT NULL,
  `amount` DOUBLE NULL,
  PRIMARY KEY (`txn_id`));
  
/*Populate the transaction table*/
INSERT INTO account
	(account_id, avail_balance, last_activity_date)
VALUES
	(123, 500, now()),
    (789, 75, now());