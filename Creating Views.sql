/*Creating a views for the Californian customers*/
CREATE VIEW california_customer AS
SELECT customer_id, first_name, last_name, email
FROM customer
JOIN address a
ON customer.address_id = a.address_id
WHERE district = 'California';

/*Test the view by checking the customer payments*/
SELECT * 
FROM california_customer cc
JOIN payment p 
ON cc.customer_id = p.customer_id
WHERE amount > 5;

/*Create a new view for actors in action movies*/
CREATE VIEW actors_in_action_movies AS
SELECT a.first_name, a.last_name FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film_category fc 
ON fa.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id
WHERE c.name = 'Action';

SELECT * from actors_in_action_movies;

/*Creating a film category actor view*/
CREATE VIEW film_ctgry_actor AS
SELECT f.title,
  c.name category_name,
  a.first_name,
  a.last_name
FROM film f
  INNER JOIN film_category fc
  ON f.film_id = fc.film_id
  INNER JOIN category c
  ON fc.category_id = c.category_id
  INNER JOIN film_actor fa
  ON fa.film_id = f.film_id
  INNER JOIN actor a
  ON fa.actor_id = a.actor_id;
  
/*creating a family movies view*/
CREATE VIEW family_movies AS
SELECT  f.title, f.release_year
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE f.rating IN ('G', 'PG')
	AND c.name IN ('Animation', 'Children', 'Classics', 'Comedy',
					'Drama', 'Family')
ORDER BY f.release_year asc, title;

/*Test View*/
SELECT * FROM family_movies;
