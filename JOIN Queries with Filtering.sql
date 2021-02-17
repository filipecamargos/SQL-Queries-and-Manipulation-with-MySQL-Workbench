
/*Join the customer and the address on id*/
select c.first_name, a.address
from customer c inner join address a
	on c.address_id = a.address_id;

/*Filtering with the Where*/    
select c.first_name, a.address
from customer c, address a
Where c.address_id = a.address_id;

/*Filtering with the Where and AND*/   
select c.first_name, a.address
From customer c, address a
Where c.address_id = a.address_id
    AND a.postal_code = 52137;

/*JOIN with more than one table*/
select c.first_name, a.address, ct.city
from customer as c
	Inner Join address as a
	on c.address_id = a.address_id
    Inner join city as ct
    ON a.city_id = ct.city_id;
    
/*Ex of JOIN with more than on table with filtering*/
SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
	INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
WHERE a.district = 'California';

SELECT f.title
FROM film f
	INNER JOIN film_actor fa
	ON f.film_id = fa.film_id
	INNER JOIN actor a
	ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';

SELECT a1.address address1, a2.address address2, a1.city_id
FROM address a1
	INNER JOIN address a2
WHERE a1.city_id = a2.city_id
	AND a1.address_id <> a2.address_id;
