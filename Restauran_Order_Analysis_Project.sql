--OBJECTIVE-1;

/**View the menu_items table and write a query to find the number of items on the menu**/

SELECT COUNT(menu_item_id) AS Num_of_item
FROM menu_items;

/**What are the least and most expensive items on the menu?**//

WITH Most_expensive AS (
    SELECT item_name, 
           price AS item_price, 
           'Most Expensive' AS price_category
    FROM menu_items
    ORDER BY price DESC
    LIMIT 1
), Least_expensive AS (
    SELECT item_name, 
           price AS item_price, 
           'Least Expensive' AS price_category
    FROM menu_items
    ORDER BY price ASC
    LIMIT 1
)
SELECT * FROM Most_expensive
UNION
SELECT * FROM Least_expensive;

/**How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?**/

SELECT category, COUNT(category) AS Num_of_dishes
FROM menu_items
WHERE category='Italian';


WITH PriceExtremes AS (
    SELECT 
        item_name, 
        price AS item_price,
        CASE 
            WHEN ROW_NUMBER() OVER (ORDER BY price DESC) = 1 THEN 'Most Expensive'
            WHEN ROW_NUMBER() OVER (ORDER BY price ASC) = 1 THEN 'Least Expensive'
        END AS price_category
    FROM menu_items
    WHERE category = 'Italian'
)
SELECT item_name, item_price, price_category FROM PriceExtremes
WHERE price_category IS NOT NULL;


/**How many dishes are in each category? What is the average dish price within each category?**/

With number_of_dish AS( 
	SELECT category, COUNT(category) AS num_of_dishes
	FROM menu_items
	GROUP BY category),
Average_price AS(
	SELECT category, ROUND(AVG(price),2) AS Avg_price
    FROM menu_items
    GROUP BY category)
SELECT nd.category, nd.num_of_dishes, ap.Avg_price
FROM number_of_dish nd
JOIN Average_price ap
ON nd.category=ap.category;

--OBJECTIVE-2;

/**What is the date range of the table?**/

SELECT MIN(order_date) AS star_date, MAX(order_date) AS end_date
FROM order_details;


/**How many orders were made within this date range? How many items were ordered within this date range?**/

SELECT COUNT(DISTINCT order_id) AS num_of_order, COUNT(item_id) AS num_of_item
FROM order_details;

/**Which orders had the most number of items?**/

SELECT order_id, COUNT(item_id) AS num_of_items
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) = (
  SELECT MAX(item_counts)
  FROM (
    SELECT COUNT(item_id) AS item_counts
    FROM order_details
    GROUP BY order_id
  ) AS subquery
);

/**How many orders had more than 12 items?**/

SELECT COUNT(*) AS orders_with_more_than_12_items
FROM (
    SELECT order_id, COUNT(order_id)
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS number_of_orders;

/**OBJECTIVE-3**/

/**Combine the menu_items and order_details tables into a single table**/

SELECT *
FROM order_details od
LEFT JOIN menu_items mn
	ON od.item_id=mn.menu_item_id;

/**What were the least and most ordered items? What categories were they in?**/

(SELECT item_name, category, COUNT(order_details_id) AS num_ordered, 'Most Ordered' AS Order_frequency
FROM order_details od
LEFT JOIN menu_items mn
    ON od.item_id = mn.menu_item_id
GROUP BY item_name, category
ORDER BY num_ordered DESC
LIMIT 1)

UNION 

(SELECT item_name, category, COUNT(order_details_id) AS num_ordered, 'Least Ordered' AS Order_frequency
FROM order_details od
LEFT JOIN menu_items mn
    ON od.item_id = mn.menu_item_id
GROUP BY item_name, category
HAVING COUNT(order_details_id) > 0
ORDER BY num_ordered ASC
LIMIT 1);

/**What were the top 5 orders that spent the most money?**/

SELECT order_id, SUM(price) AS total_spent
FROM order_details od
LEFT JOIN menu_items mn
    ON od.item_id = mn.menu_item_id 
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;

/**View the details of the highest spend order. Which specific items were purchased?**/

SELECT category, COUNT(item_id) AS num_item
FROM order_details od
LEFT JOIN menu_items mn
    ON od.item_id = mn.menu_item_id 
WHERE order_id=440
GROUP BY category;

/**View the details of the top 5 highest spend orders**/

--To get the top high spend orders the following query is used:

SELECT order_id, SUM(price) AS total_spent
FROM order_details od
LEFT JOIN menu_items mn
    ON od.item_id = mn.menu_item_id 
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5

-- Here are the top spend order id: 440,2075,1957, 330, 2675. Now the following query is used to get the details: 

SELECT order_id, category, COUNT(item_id) AS num_item
FROM order_details od
LEFT JOIN menu_items mn
    ON od.item_id = mn.menu_item_id 
WHERE order_id IN (440,2075,1957, 330, 2675)
GROUP BY order_id, category;