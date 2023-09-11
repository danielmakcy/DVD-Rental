--Query 4  - Promotion 
-- Use Case : Identify list of customer that have lower than average rental in the past period.

WITH Revenue AS (
SELECT r.customer_id, sum(p.amount) as revenue FROM RENTAL r 
JOIN PAYMENT p on p.rental_id = r.rental_id
JOIN Inventory i on i.inventory_id = r.inventory_id
Group by r.customer_id
Order by 1
)

SELECT ct.city, first_name, last_name, email, r.revenue from customer c
JOIN Revenue r on r.customer_id = c.customer_id
JOIN Address a on a.address_id = c.address_id
JOIN City ct on ct.city_id = a.address_id
WHERE r.revenue < (SELECT avg(revenue) from Revenue)
order by ct.city;
