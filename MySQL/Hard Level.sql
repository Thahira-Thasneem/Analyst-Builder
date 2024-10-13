
-- Temperature Fluctuations
-- Solution:

WITH new_cte AS(
  SELECT *, LAG(temperature,1) OVER(ORDER BY date) AS temp2
   FROM temperatures) 
  SELECT date FROM new_cte
WHERE temperature > temp2;

-- Kelly's 3rd Purchase
-- Solution:

SELECT customer_id, transaction_id, amount, amount*0.67 AS discounted_amount
FROM (SELECT customer_id, transaction_id, amount,
 ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY transaction_id) AS row_num
 FROM purchases) AS subquery
WHERE row_num = 3
ORDER BY customer_id;



