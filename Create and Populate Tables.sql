/*Creating a new Table as account table*/
CREATE TABLE `sakila`.`account` (
  `account_id` INT NOT NULL,
  `avail_balance` DOUBLE NOT NULL,
  `last_activity_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`));
  
/*Populate the new table with data*/
