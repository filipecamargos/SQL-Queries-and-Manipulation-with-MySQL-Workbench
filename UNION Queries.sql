/*Creating a union between customer and actor with a new column defining the type*/
SELECT 'customer' type, c.first_name, c.last_name
FROM customer c	
UNION ALL
SELECT 'Actor' type, a.last_name, a.last_name
FROM actor a
ORDER BY first_name;

/*Exclude duplicates by using only the set UNION / If all is used there will be two Jeniffers*/
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION /*ALL*/
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

/*Example of Unions and append the result on the bottom of each example*/
Select sum(p.amount)
FROM payment p
WHERE date(payment_date) Between '2005-05-01' AND '2005-06-01'
UNION
Select sum(p.amount)
FROM payment p
WHERE date(payment_date) Between '2005-06-02' AND '2005-07-01'
UNION
Select sum(p.amount)
FROM payment p
WHERE date(payment_date) Between '2005-07-02' AND '2005-08-01'
UNION
Select sum(p.amount)
FROM payment p
WHERE date(payment_date) Between '2005-08-02' AND '2005-09-01';

/*Find all the names for people in the Sakila DB*/
/*Customer and Actor*/
SELECT c.first_name, c.last_name, "customer" as identification 
FROM customer as c
UNION ALL
SELECT a.first_name, a.last_name, "actor" as identification 
FROM actor as a
ORDER BY first_name;

/*FIND the person who is a customer and actor*/
SELECT distinct concat(first_name," ", last_name) as name
FROM customer
WHERE concat(first_name," ", last_name) 
IN (SELECT concat(first_name," ",last_name) as name 
											FROM actor);
                                            
/*Examples on UNION*/

SELECT a.first_name, a.last_name, "a" type
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION
SELECT c.first_name, c.last_name, "c" type
FROM customer c
WHERE c.last_name LIKE 'L%';

SELECT a.first_name, a.last_name, "a" type
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION
SELECT c.first_name, c.last_name, "c" type
FROM customer c
WHERE c.last_name LIKE 'L%'
ORDER BY last_name;

SELECT 1 num, 'one' str
UNION
SELECT 2 num, 'two' str
UNION
SELECT 3 num, 'three' str
UNION
SELECT 2 num, 'two' str;

