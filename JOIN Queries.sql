/*This query uses LEFT JOIN to return the amount added up for each costumer*/
SELECT c.customer_id, c.first_name, sum(p.amount) amount
FROM customer c
	LEFT JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

/*The same example above using the RIGHT JOIN*/
SELECT c.customer_id, c.first_name, sum(p.amount) amount
FROM payment p 
	RIGHT JOIN customer c
    ON p.customer_id = c.customer_id
GROUP BY c.customer_id;

/*USING CROSS JOIN TO CREATE A DATA SET {1,2,3, ..., 99, 100}*/
SELECT ones.x + tens.x + 1
FROM
 (SELECT 0 x UNION ALL
  SELECT 1 x UNION ALL
  SELECT 2 x UNION ALL
  SELECT 3 x UNION ALL
  SELECT 4 x UNION ALL
  SELECT 5 x UNION ALL
  SELECT 6 x UNION ALL
  SELECT 7 x UNION ALL
  SELECT 8 x UNION ALL
  SELECT 9 x
 ) ones
  CROSS JOIN
 (SELECT 0 x UNION ALL
  SELECT 10 x UNION ALL
  SELECT 20 x UNION ALL
  SELECT 30 x UNION ALL
  SELECT 40 x UNION ALL
  SELECT 50 x UNION ALL
  SELECT 60 x UNION ALL
  SELECT 70 x UNION ALL
  SELECT 80 x UNION ALL
  SELECT 90 x
 ) tens;
 
 /*Retrun all the movies in the inventory that start with MU and their IDs*/
 SELECT f.title, i.inventory_id
 FROM inventory i
	RIGHT JOIN film f
    ON f.film_id = i.film_id
 WHERE f.title LIKE 'MU%'
 ORDER BY i.inventory_id, f.title;
 
/*Using the querie above you can now get the movies out of stock*/
SELECT f.title, i.inventory_id
 FROM inventory i
	RIGHT JOIN film f
    ON f.film_id = i.film_id
 WHERE f.title LIKE 'MU%'
 HAVING i.inventory_id IS NULL;
 
 
 
 