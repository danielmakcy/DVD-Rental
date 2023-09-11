-- Query 2 - Film Popularity 
-- Use Case: Compare the popularity by each store / category

WITH Monthly_Rental AS
(SELECT extract (year from rental_date) as Year, extract (month from rental_date) as Month, i.store_id, i.film_id, count(1) as count FROM RENTAL r 
--JOIN PAYMENT p on p.rental_id = r.rental_id
JOIN Inventory i on i.inventory_id = r.inventory_id
Group by extract (year from rental_date) , extract (month from rental_date), i.store_id, i.film_id
Order by extract (year from rental_date) , extract (month from rental_date)
) 


select mr.store_id, c.name as category, sum(mr.count) from film f
JOIN film_category fc on f.film_id = fc.film_id
JOIN category c on c.category_id = fc.category_id
JOIN monthly_Rental mr on mr.film_id = f.film_id
Group by mr.store_id, c.name
Order by mr.store_id, c.name;

