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

/**/


/**/


/**/

