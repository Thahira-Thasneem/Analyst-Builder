
-- 1. Tesla Models

-- Solution:

SELECT *, (car_price - production_cost)*cars_sold AS profit
FROM tesla_models
GROUP BY tesla_model
ORDER BY profit DESC
LIMIT 1;

-- 2. Heart Attack Risk

-- Solution:

SELECT * FROM patients
WHERE (age >= 50 AND cholesterol >= 240 AND weight >= 200 )
ORDER BY cholesterol DESC;

-- 3. Apply Discount

-- Solution:

SELECT COUNT(customer_id)
FROM customers
WHERE total_purchase > 200 OR age>= 65;

-- 4. Million Dollar Store

-- Solution:

SELECT store_id, round(AVG(revenue),2) AS avg_revenue
FROM stores
GROUP BY store_id
HAVING AVG(revenue) > 1000000
ORDER BY store_id;

-- 5. Chocolate

-- Solution:

SELECT * 
FROM bakery_items
WHERE product_name LIKE '%Chocolate%';

-- 6. On The Way Out

-- Solution:

SELECT employee_id
FROM employees
ORDER BY birth_date ASC
LIMIT 3;

-- 7. Sandwich Generation

-- Solution:

SELECT bread_name, meat_name
FROM bread_table
CROSS JOIN meat_table
ORDER BY bread_name, meat_name;

-- 8. Electric Bike Replacement

-- Solution:

SELECT COUNT(bike_id) 
FROM bikes
WHERE miles > 10000;

-- 9. Car Failure

-- Solution:

SELECT owner_name, vehicle 
FROM inspections 
WHERE NOT(critical_issues > 0 OR minor_issues > 3)
ORDER BY owner_name ASC;

-- 10. Perfect Data Analyst

-- Solution:

SELECT candidate_id
FROM candidates 
WHERE sql_experience = 'X' AND (python = 'X' OR r_programming = 'X') AND problem_solving = 'X' AND domain_knowledge = 'X'  
ORDER BY candidate_id;

-- 11. Costco Rotisserie Loss

-- Solution:

SELECT ROUND(SUM(lost_revenue_millions),0)
FROM sales;
