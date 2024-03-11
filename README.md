# Restaurant Order Analysis for Taste of World Cafe a fictitious international cuisine restaurant

## Overview
This repository houses a detailed analysis of the Taste of World Cafe, focusing on customer ordering behavior, menu item performance, and sales analysis. Using a comprehensive dataset provided by Maven Analytics, this project breaks down into three primary objectives aimed at optimizing menu offerings and enhancing customer satisfaction.

## Data Structure
The analysis utilizes a dataset featuring:
- **Number of records**: 12,266
- **Number of fields**: 8
- **Data Composition**: Detailed across multiple tables, covering aspects such as order details, menu items.

## SQL File Features
- **Aggregate Functions**: Utilized `COUNT`, `MAX`, `MIN`, `SUM` for data summarization, aiding in the analysis of menu items, order quantities, and pricing strategies.
- **WITH Clause**: Employed CTEs (Common Table Expressions) with the `WITH` clause for creating temporary tables that simplify complex queries, making the analysis more structured and easier to understand.
- **ORDER BY**: Implemented `ORDER BY` for sorting data based on specific criteria, essential for organizing results according to item popularity, price, or order frequency.
- **UNION**: Used `UNION` to combine results from multiple queries into a single result set, particularly useful in juxtaposing different data perspectives like the most and least ordered items.
- **Conditional Expressions and Window Functions**: Incorporated conditional expressions (`CASE`) and window functions (`ROW_NUMBER`) for advanced data manipulation, enabling detailed item categorization and ranking within queries.
- **LEFT JOIN**: Used `LEFT JOIN` to combine order_details table with menu_item table.

## Project Objectives and Tasks

### Objective 1: Explore the Items Table
Gain insights into the 'menu_items' table by addressing the following queries:
1. **Menu Size**: Write a SQL query to determine the total number of items on the menu.
2. **Price Range**: Identify the least and most expensive items available on the menu.
3. **Italian Cuisine Analysis**: Establish how many Italian dishes are offered and determine the least and most expensive among them.
4. **Category Breakdown**: Analyze how many dishes are present within each category and calculate the average dish price for each category.

### Objective 2: Explore the Orders Table
Delve into the 'order_details' table to understand ordering patterns:
1. **Date Range Discovery**: Determine the date range covered by the table's entries.
2. **Order and Item Counts**: Ascertain how many orders were made and the total number of items ordered within this date range.
3. **Maximum Items per Order**: Identify which orders contained the most items.
4. **Bulk Orders**: Find out how many orders consisted of more than 12 items.

### Objective 3: Analyze Customer Behavior
Merge insights from both 'menu_items' and 'order_details' tables to uncover customer preferences and spending habits:
1. **Data Integration**: Combine the two tables into a single comprehensive table for deeper analysis.
2. **Ordering Trends**: Determine the least and most ordered items and identify their categories.
3. **Top Spenders**: Identify the top 5 orders with the highest total spent.
4. **Detailed Spend Analysis**:
    - Investigate the specifics of the highest spend order, including which items were purchased.
    - Delve into the details of the top 5 highest spend orders to understand customer preferences and high-value items.

## Insights and Implications
This project provides the Taste of World Cafe with actionable insights to refine its menu and pricing strategy, align offerings with customer preferences, and identify key drivers of sales performance. Through this analysis, the restaurant can tailor its approach to better meet customer demand and maximize profitability.

## Data Source
Data sourced from Maven Analytics presents a simulated environment reflective of real-world restaurant operations, facilitating an authentic analysis experience.


