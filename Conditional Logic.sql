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


/**/


/**/


/**/


/**/

