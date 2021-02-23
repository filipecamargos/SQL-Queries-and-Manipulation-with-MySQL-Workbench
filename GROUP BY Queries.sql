/*Ex on how to get the grouped by*/
SELECT customer_id
FROM rental
GROUP BY customer_id;

/*
Now we can apply the count to count how many rows for the group:
The aggregate function count() counts the number of rows in each group, 
and the asterisk tells the server to count everything in the group. Using 
the combination of a group by clause and the count() aggregate function, 
you are able to generate exactly the data needed to answer the business 
question without having to look at the raw data.
*/
SELECT customer_id, count(*) as rentals
FROM rental
GROUP BY customer_id;

/*Now we can order it by what customer has brought more*/
SELECT customer_id, count(*) as rentals
FROM rental
GROUP BY customer_id
ORDER BY rentals desc;

/*Using Having for filtering data*/
SELECT customer_id, count(*) as rentals
FROM rental
GROUP BY customer_id
HAVING rentals >= 40;

/*
Using MAX(), MIN(), AVG(), SUM(), COUNT() in the payment table
*/
SELECT MAX(amount) as max_amount,
	MIN(amount) minimum_amount,
    round(AVG(amount), 2) avarage_amount,
    SUM(amount) total_amount,
    COUNT(*) number_of_amount
FROM payment;

/*
Example on how to specified how the data should be grouped
*/
SELECT customer_id,
	MAX(amount) as max_amount,
	MIN(amount) minimum_amount,
    round(AVG(amount), 2) avarage_amount,
    SUM(amount) total_amount,
    COUNT(*) number_of_amount
FROM payment
GROUP BY customer_id;

/*
Using distinct with count
Below in the payment there are 16049 instance of id for each payment
But for the num_customers there are 599 since DISTINCT was used in the count
*/
SELECT COUNT(customer_id) intance_of_ids_in_the_payments,
	COUNT(DISTINCT customer_id) num_customers
FROM payment;

/*
 Find the maximum number of days between when a one date and the other
*/
SELECT MAX(datediff(return_date,rental_date))
FROM rental;

/*
Multicolumn Grouping can be performed
This query finds the number of films 
for each film rating for each actor
*/
SELECT fa.actor_id, f.rating, count(*) as total
FROM film_actor as fa
	INNER JOIN film as f
    ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating
ORDER BY 1, 2;

/*Getting the number of rows*/
SELECT count(*) as total_rows
FROM payment;

/*Count the number of payments made by each customer*/
SELECT customer_id, count(*) as payments, sum(amount) as total
FROM payment
GROUP BY customer_id;

/*Filtering the Data*/
SELECT customer_id, count(*) as payments, sum(amount) as total
FROM payment
GROUP BY customer_id
HAVING payments >= 40;


