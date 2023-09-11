--Query 4  - Promotion 
-- Use Case : Identify list of customer that have lower than average rental in the past period.

WITH Monthly_Revenue AS (
SELECT i.store_id, r.customer_id, sum(p.amount) as revenue FROM RENTAL r 
JOIN PAYMENT p on p.rental_id = r.rental_id
JOIN Inventory i on i.inventory_id = r.inventory_id
Group by i.store_id, r.customer_id
),

Average_Rental AS (
SELECT Store_id, avg(revenue) as avg_revenue from Monthly_Revenue
Group by 1
)

SELECT c.store_id, first_name, last_name, email, mr.revenue, ar.avg_revenue from customer c 
JOIN Average_Rental ar on ar.store_id = c.store_id
JOIN Monthly_Revenue mr on mr.customer_id = c.customer_id
WHERE mr.revenue < ar.avg_revenue
order by c.store_id;
