# Restaurant-Orders-EDA

## Project Title
Restaurant Orders EDA

## Project Overview
This project explores restaurant sales data using SQL, focusing on menu pricing, customer ordering patterns, and revenue trends. The dataset consists of two tables:  

- menu_items: Contains details of menu offerings, including item ID, item names, categories, and prices.
- Field descriptions:
  - menu_item_id = Unique ID of a menu item
  - item_name = Name of a menu item
  - category = Category or type of cuisine of the menu item
  - price = Price of the menu item (US Dollars $)

- order_details: Tracks customer orders with timestamps.
- Field descriptions:
  - order_details_id = Unique ID of an item in an order
  - order_id = ID of an order
  - order_date = Date an order was put in (MM/DD/YY)
  - order_time = Time an order was put in (HH:MM:SS AM/PM)
  - item_id = Matches the menu_item_id in the menu_items table

## Key Objectives & Insights:
- Menu Analysis:
  - Counted the total number of menu items and categorized them by cuisine type.
  - Identified the most and least expensive menu items, along with the price range within each category.
  - Analyzed dishes containing keywords like "cheese" or "chicken" to identify popular ingredients.
  - Found the most and least expensive items within each category to understand pricing structures.

- Order Behavior Analysis:
  - Determined the total number of unique orders.
  - Identified the top five most and least ordered items to assess customer preferences.
  - Ranked the top five highest-spending orders and analyzed their contents.
  - Categorized menu items in the highest-spending orders to reveal ordering trends.
  - Analyzed ordering patterns by time of day, identifying peak and low-order hours.

## SQL Techniques Used:
- Data Aggregation: COUNT(), SUM(), AVG(), MIN(), MAX(), ROUND()
- Filtering & Sorting: WHERE, ORDER BY, LIMIT
- Grouping & Subqueries: GROUP BY, nested SELECT queries
- Joins: INNER JOIN, LEFT JOIN for combining order and menu data
- Time-Based Analysis: HOUR() function to analyze order trends by time

## Results & Takeaways:
- Peak ordering hours were identified, which can help in staff scheduling and operational efficiency.
- The highest-priced menu items were not always the most frequently ordered, highlighting the importance of affordability and customer preference.
- Some menu categories had significant price variations, indicating potential pricing optimization opportunities.
- High-spending customers purchased a diverse range of items, offering insights into strategic menu bundling.

## Conclusion
This project demonstrates my ability to extract meaningful business insights from raw data using SQL, showcasing skills in database querying, data analysis, and reporting.
