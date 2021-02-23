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

/*Multicolumn sbqueries can be implemented
all actors with the last name Monroe and all films rated PG, and the containing query 
then uses this information to retrieve all cases where an actor named Monroe appeared in a PG film */
SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE fa.actor_id IN (SELECT actor_id FROM actor WHERE last_name = 'MONROE')
						AND fa.film_id IN
						(SELECT film_id FROM film WHERE rating = 'PG');

/*The folloing query can make specific counts and return based on the filter
For example you can get the custoer who have rented exactly 20 movies*/
SELECT c.first_name, c.last_name
FROM customer c
WHERE 20 = (SELECT COUNT(*) FROM rental r
			WHERE r.customer_id = c.customer_id)
