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

/*Make sure do not use Where for group by instead use have thef filter hapens on the count*/
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
*/


