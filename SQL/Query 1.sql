-- Query 1 - Performance
-- Use Case: Compare monthly revenue (per active customer) of each store

WITH Monthly_Revenue AS (
SELECT extract (year from rental_date) as Year, extract (month from rental_date) as Month, i.store_id, r.customer_id, sum(p.amount) as revenue FROM RENTAL r 
JOIN PAYMENT p on p.rental_id = r.rental_id
JOIN Inventory i on i.inventory_id = r.inventory_id
Group by extract (year from rental_date) , extract (month from rental_date), i.store_id, r.customer_id
Order by extract (year from rental_date) , extract (month from rental_date)
),

Active_Customer AS (
SELECT c.store_id, count(1) as Total_Active_Cust from customer c
WHERE c.active = 1 
GROUP by c.store_id
)


SELECT r.store_id, r.year, r.month, sum(r.revenue / c.total_active_cust) from Monthly_Revenue r
JOIN Active_Customer c on c.store_id = r.store_id
GROUP by r.year, r.month, r.store_id;


--SELECT * from Active_Customer

--SELECT r.store_id, r.year, r.month, sum(r.revenue) from Monthly_Revenue r
--GROUP by r.year, r.month, r.store_id; 