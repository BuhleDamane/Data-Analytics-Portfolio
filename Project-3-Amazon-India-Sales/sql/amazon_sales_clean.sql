-- ================================================================
-- AMAZON SALES ANALYSIS - SQL QUERIES
-- Project: E-Commerce Business Intelligence Analysis
-- Analyst: Buhle Damane
-- Date: January 2026
-- Database: amazon_sales_analysis
-- ================================================================
-- 
-- Business Context:
-- This analysis examines Amazon India sales data to understand:
-- - Revenue performance and trends
-- - Product category profitability
-- - Geographic sales distribution
-- - Customer segmentation (B2B vs B2C)
-- - Operational efficiency and order fulfillment
-- - Impact of promotions on sales
-- 
-- Dataset: Amazon Sale Report (E-commerce transactions)
-- Time Period: [Will be determined after data verification]
-- 
-- ================================================================

USE amazon_sales_analysis;

-- ================================================================
-- QUERY 1: Executive Summary - Key Performance Indicators
-- ================================================================
-- Purpose: High-level overview of business performance
-- Shows total orders, revenue, cancellation rate, and key metrics

SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(CASE WHEN order_status LIKE '%Shipped%' THEN 1 ELSE 0 END) AS shipped_orders,
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS cancellation_rate_pct,
    SUM(qty) AS total_units_sold,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    COUNT(DISTINCT sku) AS unique_products,
    COUNT(DISTINCT ship_state) AS states_covered
FROM sales_data;


-- ================================================================
-- QUERY 2: Revenue by Product Category
-- ================================================================
-- Purpose: Identify which product categories drive the most revenue
-- Critical for inventory planning and marketing focus

SELECT 
    category,
    COUNT(DISTINCT order_id) AS num_orders,
    SUM(qty) AS units_sold,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    ROUND(SUM(amount) / (SELECT SUM(amount) FROM sales_data WHERE order_status LIKE '%Shipped%') * 100, 2) AS revenue_share_pct
FROM sales_data
WHERE order_status LIKE '%Shipped%'
GROUP BY category
ORDER BY total_revenue DESC;


-- ================================================================
-- QUERY 3: Top 20 Best-Selling Products by Revenue
-- ================================================================
-- Purpose: Identify star products that generate most sales
-- Helps prioritize inventory and marketing efforts

SELECT 
    sku,
    style,
    category,
    size,
    COUNT(DISTINCT order_id) AS times_ordered,
    SUM(qty) AS total_units,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_price_point
FROM sales_data
WHERE order_status LIKE '%Shipped%'
GROUP BY sku, style, category, size
ORDER BY total_revenue DESC
LIMIT 20;


-- ================================================================
-- QUERY 4: Geographic Performance - Top States
-- ================================================================
-- Purpose: Understand which states are our strongest markets
-- Identifies regional opportunities and market penetration

SELECT 
    ship_state,
    COUNT(DISTINCT order_id) AS num_orders,
    SUM(qty) AS units_sold,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) AS cancelled_orders,
    ROUND(COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) / COUNT(*) * 100, 2) AS cancel_rate_pct
FROM sales_data
GROUP BY ship_state
ORDER BY total_revenue DESC
LIMIT 15;


-- ================================================================
-- QUERY 5: Top Cities by Sales Volume
-- ================================================================
-- Purpose: City-level analysis for targeted local marketing
-- Shows urban centers with highest purchase activity

SELECT 
    ship_city,
    ship_state,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_order_size,
    SUM(qty) AS units_sold
FROM sales_data
WHERE order_status LIKE '%Shipped%'
GROUP BY ship_city, ship_state
HAVING COUNT(DISTINCT order_id) >= 3  -- Filter for cities with meaningful volume
ORDER BY revenue DESC
LIMIT 25;


-- ================================================================
-- QUERY 6: Monthly Sales Trend Analysis
-- ================================================================
-- Purpose: Track revenue patterns over time
-- Identifies seasonal trends, growth trajectory, and peak periods

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    DATE_FORMAT(order_date, '%b %Y') AS month_name,
    COUNT(DISTINCT order_id) AS orders,
    SUM(qty) AS units_sold,
    ROUND(SUM(amount), 2) AS monthly_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) AS cancellations
FROM sales_data
GROUP BY DATE_FORMAT(order_date, '%Y-%m'), DATE_FORMAT(order_date, '%b %Y')
ORDER BY month;


-- ================================================================
-- QUERY 7: B2B vs B2C Customer Segment Analysis
-- ================================================================
-- Purpose: Compare business customers vs individual consumers
-- Shows which segment is more valuable and their buying patterns

SELECT 
    CASE 
        WHEN b2b = 'TRUE' THEN 'B2B (Business)'
        WHEN b2b = 'FALSE' THEN 'B2C (Consumer)'
        ELSE 'Unspecified'
    END AS customer_segment,
    COUNT(DISTINCT order_id) AS num_orders,
    SUM(qty) AS total_units,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS revenue_per_order,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) AS cancellations
FROM sales_data
GROUP BY b2b
ORDER BY total_revenue DESC;


-- ================================================================
-- QUERY 8: Shipping Service Level Performance
-- ================================================================
-- Purpose: Compare standard vs expedited shipping
-- Analyze if customers pay for faster shipping and its impact

SELECT 
    ship_service_level,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    SUM(qty) AS units_shipped,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) AS cancellations,
    ROUND(COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) / COUNT(*) * 100, 2) AS cancel_rate_pct
FROM sales_data
GROUP BY ship_service_level
ORDER BY revenue DESC;


-- ================================================================
-- QUERY 9: Fulfillment Channel Comparison
-- ================================================================
-- Purpose: Amazon fulfillment vs Merchant fulfillment analysis
-- Shows efficiency and success rates of each method

SELECT 
    fulfilment,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    SUM(CASE WHEN order_status LIKE '%Shipped%' THEN 1 ELSE 0 END) AS successful_deliveries,
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(SUM(CASE WHEN order_status LIKE '%Shipped%' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS success_rate_pct
FROM sales_data
GROUP BY fulfilment
ORDER BY revenue DESC;


-- ================================================================
-- QUERY 10: Product Size Distribution Analysis
-- ================================================================
-- Purpose: Which clothing sizes sell the most
-- Critical for inventory planning and stock allocation

SELECT 
    size,
    COUNT(DISTINCT order_id) AS orders,
    SUM(qty) AS units_sold,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_price,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM sales_data WHERE order_status LIKE '%Shipped%' AND size IS NOT NULL) * 100, 2) AS size_mix_pct
FROM sales_data
WHERE order_status LIKE '%Shipped%' 
  AND size IS NOT NULL
  AND size != ''
GROUP BY size
ORDER BY units_sold DESC;


-- ================================================================
-- QUERY 11: Cancelled Orders Deep Dive
-- ================================================================
-- Purpose: Understand patterns in cancelled orders
-- Identifies revenue loss and problematic areas

SELECT 
    category,
    ship_state,
    COUNT(DISTINCT order_id) AS cancelled_count,
    ROUND(SUM(amount), 2) AS lost_revenue,
    ROUND(AVG(amount), 2) AS avg_cancelled_order_value,
    ship_service_level
FROM sales_data
WHERE order_status = 'Cancelled'
GROUP BY category, ship_state, ship_service_level
HAVING cancelled_count >= 2
ORDER BY lost_revenue DESC
LIMIT 20;


-- ================================================================
-- QUERY 12: Promotion Impact Analysis
-- ================================================================
-- Purpose: Do promotions drive more sales?
-- Compare orders with vs without promotional codes

SELECT 
    CASE 
        WHEN promotion_ids IS NULL OR promotion_ids = '' THEN 'No Promotion'
        ELSE 'With Promotion'
    END AS promotion_status,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    SUM(qty) AS units_sold,
    COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) AS cancellations,
    ROUND(COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) / COUNT(*) * 100, 2) AS cancel_rate_pct
FROM sales_data
GROUP BY promotion_status
ORDER BY revenue DESC;


-- ================================================================
-- QUERY 13: Quarterly Performance Summary
-- ================================================================
-- Purpose: Year-over-year quarterly comparison
-- Shows business growth and seasonal patterns by quarter

SELECT 
    YEAR(order_date)                                    AS year,
    QUARTER(order_date)                                 AS quarter,
    CONCAT('Q', QUARTER(order_date), ' ', YEAR(order_date)) AS period,
    COUNT(DISTINCT order_id)                            AS orders,
    ROUND(SUM(amount), 2)                               AS quarterly_revenue,
    ROUND(AVG(amount), 2)                               AS avg_order_value,
    SUM(qty)                                            AS units_sold
FROM sales_data
WHERE order_status LIKE '%Shipped%'
GROUP BY 
    YEAR(order_date), 
    QUARTER(order_date),
    CONCAT('Q', QUARTER(order_date), ' ', YEAR(order_date))  
ORDER BY year, quarter;

-- ================================================================
-- QUERY 14: Day of Week Sales Pattern
-- ================================================================
-- Purpose: Which days see the most orders
-- Optimize marketing timing and staffing

SELECT 
    DAYNAME(order_date) AS day_of_week,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_order_value,
    SUM(qty) AS units_sold
FROM sales_data
WHERE order_status LIKE '%Shipped%'
GROUP BY DAYNAME(order_date), DAYOFWEEK(order_date)
ORDER BY DAYOFWEEK(order_date);


-- ================================================================
-- QUERY 15: Category Performance by Size
-- ================================================================
-- Purpose: Detailed category breakdown with size distribution
-- Shows which sizes drive revenue within each category

SELECT 
    category,
    size,
    COUNT(DISTINCT order_id) AS orders,
    SUM(qty) AS units,
    ROUND(SUM(amount), 2) AS revenue,
    ROUND(AVG(amount), 2) AS avg_price
FROM sales_data
WHERE order_status LIKE '%Shipped%' 
  AND size IS NOT NULL
  AND size != ''
GROUP BY category, size
ORDER BY category, revenue DESC;


-- ================================================================
-- QUERY 16: High-Value Orders Analysis
-- ================================================================
-- Purpose: Identify premium orders (top 10% by value)
-- Understand characteristics of high-value customers

SELECT 
    order_id,
    order_date,
    category,
    size,
    ROUND(amount, 2) AS order_value,
    ship_city,
    ship_state,
    b2b,
    ship_service_level,
    fulfilment
FROM (
    SELECT 
        *,
        NTILE(10) OVER (ORDER BY amount) AS decile
    FROM sales_data
    WHERE order_status LIKE '%Shipped%'
) AS bucketed
WHERE decile = 10
ORDER BY amount DESC
LIMIT 50;

-- Alternative for older MySQL versions (if PERCENTILE_CONT doesn't work):
-- Replace the subquery with a fixed threshold like: AND amount >= 1500


-- ================================================================
-- END OF ANALYSIS QUERIES
-- ================================================================
-- 
-- Next Steps:
-- 1. Run each query and review results
-- 2. Export results to CSV for Tableau visualization
-- 3. Document key insights and findings
-- 4. Create interactive dashboard in Tableau
-- 
-- ================================================================