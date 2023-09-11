WITH film_rentals AS (
  SELECT inventory.film_id, COUNT(*) AS rental_count
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  GROUP BY inventory.film_id
)
SELECT f.title, fr.rental_count
FROM film f
JOIN film_rentals fr ON f.film_id = fr.film_id
WHERE fr.rental_count > 1;
SELECT amount, customer_id, 
avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, EXTRACT(month FROM payment_date) as month
FROM payment
ORDER BY month desc;




select * from rental where return_date is NULL


SELECT extract (year from rental_date) , extract (month from rental_date), extract (day from rental_date), count(1)  FROM RENTAL
Group by extract (year from rental_date) , extract (month from rental_date), extract (day from rental_date)
Order by extract (year from rental_date) , extract (month from rental_date), extract (day from rental_date);

select f.film_id, f.title, f.description, c.name as category from film f
JOIN film_category fc on f.film_id = fc.film_id
JOIN category c on c.category_id = fc.category_id
Order by c.name;

Select s.store_id, cc.country, c.city, a.district from store s
JOIN address a on s.address_id = a.address_id
JOIN city c on c.city_id = a.city_id
JOIN country cc on cc.country_id = c.country_id


select count(*) from store;

select count(*) from payment;