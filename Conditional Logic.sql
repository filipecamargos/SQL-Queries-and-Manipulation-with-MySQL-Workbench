/*Conditional Logic*/

/*You can set the row based on the condition*/
select first_name, last_name,
	case 
		when active = 1 then 'ACT'
        else 'INC'
	end activity_type
from customer;