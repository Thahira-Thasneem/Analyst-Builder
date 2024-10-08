
-- 1. Senior Citizen Discount
-- Solution:

SELECT customer_id
FROM customers
WHERE TIMESTAMPDIFF(Year, birth_date, '2023-01-01') >= 55
ORDER BY customer_id;

-- 2. LinkedIn Famous
-- Solution:

SELECT post_id, (actions/impressions * 100) AS popularity
FROM linkedin_posts
WHERE (actions/impressions * 100) >= 1
ORDER BY popularity DESC;

-- 3. Company Wide Increase
-- Solution:

SELECT *,
(CASE 
  WHEN pay_level = 1 THEN salary*1.1
  WHEN pay_level = 2 THEN salary*1.15
  WHEN pay_level = 3 THEN salary*3
  ELSE salary
  END) AS new_salary
FROM employees;

-- 4. Media Addicts
-- Solution:

SELECT first_name 
FROM user_time
JOIN users
ON user_time.user_id = users.user_id
WHERE media_time_minutes > (SELECT AVG(media_time_minutes) FROM user_time)
ORDER BY first_name;

-- 5. Bike Price
-- Solution:

SELECT ROUND(AVG(bike_price),2) AS avg_bike_price
FROM inventory
WHERE bike_sold = 'Y' AND bike_price IS NOT NULL;

-- 6. Direct Reports
-- Solution:

SELECT m.employee_id AS manager_id, m.position AS manager_position, COUNT(*) AS num_dir_reports
FROM direct_reports AS e
JOIN direct_reports AS m
ON e.managers_id = m.employee_id
WHERE m.position LIKE '%Manager%'
GROUP BY m.employee_id, m.position;

-- 7. Food Divides Us
-- Solution:

SELECT region
FROM food_regions
GROUP BY region
ORDER BY fast_food_millions DESC
LIMIT 1;

-- 8. Kroger's Members
-- Solution:

SELECT ROUND((COUNT(has_member_card = 'Y')/COUNT(kroger_id))*100,2) AS cust_percent
FROM customers;

-- 9. Tech Layoffs
-- Solution:

SELECT company, ROUND((employees_fired/company_size)*100,2) AS percent_laid_off
FROM tech_layoffs
ORDER BY company;

-- 10. Separation
-- Solution:

SELECT SUBSTRING(id,1,5) AS n_id, SUBSTRING(id,6) AS first_name
FROM bad_data;

-- 11. TMI (Too Much Information)
-- Solution:

SELECT customer_id, SUBSTRING(full_name,1,LOCATE(' ', full_name)) AS first_name
FROM customers;

-- 12. Shrink-flation
-- Solution:

SELECT product_name, 
       ROUND((new_size-original_size)/original_size*100,0) AS size_change_percent,
       ROUND((new_price-original_price)/original_price*100,0) AS price_change_percent, 
       (CASE WHEN (original_size-new_size > 0) OR (new_price-original_price > 0) THEN 'True' ELSE 'False' END) AS shrinkflation_flag

FROM products
ORDER BY product_name;


