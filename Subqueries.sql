/*Get the latest customer by using a simple sub query*/
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = (SELECT MAX(customer_id) FROM customer);

/*Seting a condition to filter the result with a subquery*/
SELECT city_id, city
FROM city
WHERE country_id <> (SELECT country_id FROM country WHERE country = 'India');

/*The example below returns all the cities in the specified countries*/
SELECT city_id, city
FROM city
WHERE country_id IN (SELECT country_id
					FROM country WHERE country IN ('Canada', 'Mexico'));

/*Use the All or NOT IN operator to make single comparation in every value in a set
This query will get all the customer who has not got a free rental*/
SELECT first_name, last_name
FROM customer
WHERE customer_id <> ALL (SELECT customer_id 
							FROM payment
							WHERE amount = 0);
                            
SELECT first_name, last_name
FROM customer
WHERE customer_id NOT IN (SELECT customer_id 
							FROM payment
							WHERE amount = 0);

/**/


/**/


/**/