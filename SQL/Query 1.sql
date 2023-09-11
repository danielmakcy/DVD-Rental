-- Query 1 - Performance
-- Use Case: Compare revenue (per active customer) from each city

WITH Revenue AS (
SELECT cy.city, sum(p.amount) as revenue FROM RENTAL r 
JOIN PAYMENT p on p.rental_id = r.rental_id
JOIN CUSTOMER c on c.customer_id = r.customer_id
JOIN ADDRESS a on a.address_id = c.address_id
JOIN CITY cy on cy.city_id = a.city_id
Group by cy.city
ORDER by sum(p.amount) DESC 
),

Active_Customer AS (
SELECT ct.city, count(1) as Total_Active_Cust from customer c
JOIN ADDRESS a on a.address_id = c.address_id
JOIN CITY ct on ct.city_id = a.city_id
WHERE c.active = 1 
GROUP by ct.city
)

SELECT r.city, r.revenue as Total_Revenue,  r.revenue/ac.total_active_cust as Revenue_per_Cust from Revenue r
JOIN Active_Customer ac on ac.city = r.city
Order by r.revenue DESC;