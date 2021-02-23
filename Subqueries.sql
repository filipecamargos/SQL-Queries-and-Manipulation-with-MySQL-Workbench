/*Get the latest customer by using a simple sub query*/
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = (SELECT MAX(customer_id) FROM customer);

/**/


/**/


/**/


/**/


/**/


/**/