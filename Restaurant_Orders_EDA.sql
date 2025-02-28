SELECT *
FROM menu_items;

-- How many menus are there?
SELECT COUNT(DISTINCT menu_item_id) AS menu_amount
FROM menu_items;

-- How many categories are there?
SELECT COUNT(DISTINCT category) AS category_amount
FROM menu_items;

-- All categories
SELECT DISTINCT(category)
FROM menu_items;

-- How many dishes are there in each category?
SELECT
	category,
    COUNT(item_name) AS menu
FROM menu_items
GROUP BY category;

-- Top 5 most expensive menus
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 5;

-- What is the cheapest dish on the menu?
SELECT *
FROM menu_items
ORDER BY price
LIMIT 1;

-- Menus with "cheese" or "chicken" in the menu name ordered by price (descending)
SELECT *
FROM menu_items
WHERE
	item_name LIKE '%Cheese%' OR
	item_name LIKE '%Chicken%'
ORDER BY price DESC;

-- Maximum price, minimum price, and average price of each category
SELECT
	category,
    MAX(price) AS max_price,
    MIN(price) AS min_price,
    ROUND(AVG(price),2) AS avg_price
FROM menu_items
GROUP BY category;

-- The most expensive menu in each category
SELECT
    m.category,
    m.item_name,
    m.price
FROM
    menu_items AS m
JOIN
    (SELECT category, MAX(price) AS max_price FROM menu_items GROUP BY category) AS max_p
ON
    m.category = max_p.category AND m.price = max_p.max_price;
    
-- The cheapest menu in each category
SELECT
    m.category,
    m.item_name,
    m.price
FROM
    menu_items AS m
JOIN
    (SELECT category, MIN(price) AS min_price FROM menu_items GROUP BY category) AS min_p
ON
    m.category = min_p.category AND m.price = min_p.min_price;

SELECT *
FROM order_details;

-- How many order are there?
SELECT COUNT(DISTINCT order_id)
FROM order_details;

-- What are the top 5 most ordered items?
SELECT
	men.menu_item_id,
	men.item_name,
    men.category,
    men.price,
    top.order_quantity
FROM menu_items AS men
JOIN
    (SELECT 
		item_id,
		COUNT(*) AS order_quantity
	FROM order_details
	GROUP BY item_id) AS top
ON men.menu_item_id = top.item_id
ORDER BY order_quantity DESC
LIMIT 5;

-- What are top 5 least ordered items?
SELECT
	men.menu_item_id,
	men.item_name,
    men.category,
    men.price,
    least.order_quantity
FROM menu_items AS men
JOIN
    (SELECT 
		item_id,
		COUNT(*) AS order_quantity
	FROM order_details
	GROUP BY item_id) AS least
ON men.menu_item_id = least.item_id
ORDER BY order_quantity
LIMIT 5;

-- Top 5 highest-spending orders
SELECT
	ord.order_id,
	SUM(men.price) AS total_price
FROM order_details AS ord
LEFT JOIN menu_items AS men
ON ord.item_id = men.menu_item_id
GROUP BY order_id
ORDER BY total_price DESC
LIMIT 5;

-- What did the highest-spending orders buy?
SELECT
	ord.order_id,
    ord.item_id,
    men.item_name,
    men.category,
    men.price
FROM order_details AS ord
JOIN
	(SELECT
		ord.order_id,
		SUM(men.price) AS total_price
	FROM order_details AS ord
	LEFT JOIN menu_items AS men
	ON ord.item_id = men.menu_item_id
	GROUP BY order_id
	ORDER BY total_price DESC
	LIMIT 5) AS highest
ON ord.order_id = highest.order_id
JOIN menu_items AS men
ON men.menu_item_id = ord.item_id
ORDER BY
	ord.order_id,
    men.price DESC;
    
-- The amount of menu in highest-spending orders by category
SELECT
	men.category,
    COUNT(*) AS menu_amount
FROM order_details AS ord
JOIN
	(SELECT
		ord.order_id,
		SUM(men.price) AS total_price
	FROM order_details AS ord
	LEFT JOIN menu_items AS men
	ON ord.item_id = men.menu_item_id
	GROUP BY order_id
	ORDER BY total_price DESC
	LIMIT 5) AS highest
ON ord.order_id = highest.order_id
JOIN menu_items AS men
ON men.menu_item_id = ord.item_id
GROUP BY category
ORDER BY menu_amount DESC;

-- Were there certain times that had more or less orders?
SELECT
    HOUR(order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS order_count
FROM order_details
GROUP BY order_hour
ORDER BY order_count DESC;