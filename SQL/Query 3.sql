-- Query 3 - Customer Behaviour
-- Use Case: Compare customer's rental behaviour (return early, on-time or Overdue) by different type of film (rental duration, rental_rate)

WITH rental_status AS (
SELECT r.rental_id, 
	CASE WHEN extract (day from r.return_date - r.rental_date) < f.rental_duration THEN 'EARLY' 
	     WHEN extract (day from r.return_date - r.rental_date) = f.rental_duration THEN 'ONTIME' 
		 ELSE 'OVERDUE'
	END as status, 
	p.amount, f.rental_duration, f.rental_rate, p.amount-f.rental_rate as diff from rental r
LEFT JOIN payment p ON p.rental_id = r.rental_id
JOIN inventory i on i.inventory_id = r.inventory_id
JOIN film f on f.film_id = i.film_id
WHERE p.rental_id is not NULL
)

select rental_duration, status, count(*) As total_no_of_film
from rental_status
GROUP by 1,2
ORDER by 1,2,3;

