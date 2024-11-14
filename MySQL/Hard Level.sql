
-- Temperature Fluctuations
-- Solution:

WITH new_cte AS(
  SELECT *, LAG(temperature,1) OVER(ORDER BY date) AS temp2
   FROM temperatures) 
  SELECT date FROM new_cte
WHERE temperature > temp2;

-- Cake Vs Pie
-- Solution:

SELECT date_sold, 
ABS(SUM(CASE WHEN product = 'Cake' THEN amount_sold ELSE 0 END) -
    SUM(CASE WHEN product = 'Pie' THEN amount_sold ELSE 0 END)) AS difference, 
(CASE WHEN
SUM(CASE WHEN product = 'Cake' THEN amount_sold ELSE 0 END) >
SUM(CASE WHEN product = 'Pie' THEN amount_sold ELSE 0 END)
THEN 'Cake' ELSE 'Pie' END) AS sold_more 
FROM desserts
GROUP BY date_sold
ORDER BY date_sold
;

-- Kelly's 3rd Purchase
-- Solution:

SELECT customer_id, transaction_id, amount, amount*0.67 AS discounted_amount
FROM (SELECT customer_id, transaction_id, amount,
 ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY transaction_id) AS row_num
 FROM purchases) AS subquery
WHERE row_num = 3
ORDER BY customer_id;



