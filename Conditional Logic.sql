/*Conditional Logic*/

/*You can set the row based on the condition*/
select first_name, last_name,
	case 
		when active = 1 then 'ACT'
        else 'INC'
	end activity_type
from customer;

/*Return the rentals for active customers*/
select c.first_name, c.last_name,
	case
		When active = 0 then "N-ACT"
        else
			(select count(*) from rental r
			 where r.customer_id = c.customer_id)
		end num_rentals
from customer c;

/*Number of film rentals for May, June, and July of 2005*/
select
	sum(case when monthname(rental_date) = 'May' then 1 else 0 end) May_rentals,
	sum(case when monthname(rental_date) = 'June' then 1 else 0 end) June_rentals,
	sum(case when monthname(rental_date) = 'July' then 1 else 0 end) July_rentals
from rental
Where rental_date between '2005-05-01' and '2005-08-01';

/*Returns either 'No available', 'Limited to 1', Limited to 2', 'Available', or 'Common' for film counted*/
select f.title,
	case (select count(*) s from inventory i
			where i.film_id = f.film_id)
		when 0 then 'No available'
        when 1 then 'Limited to 1'
        when 2 then 'Limited to 2'
		when 3 then 'Available'
		when 4 then 'Available'
        else 'Common'
	end film_availability
from film f;


/**/


/**/

