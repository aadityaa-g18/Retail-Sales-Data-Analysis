SELECT * FROM ORDERS
-------------------------- EASY LEVEL -----------------------------------
-- 1. Total Number of Orders:
SELECT COUNT(DISTINCT(order_id)) AS total_orders 
FROM orders

-- 2. Total sales, profit and quantity
SELECT ROUND(SUM(sale_price * quantity),2) as Total_Sales,
       ROUND(SUM(profit),2) as Total_Profit,
	   SUM(quantity) as Total_Quantity
FROM orders

-- 3. Sales per Region
SELECT region as Regions,
ROUND(SUM(sale_price * quantity),2) as Total_Sales
FROM orders
GROUP BY region
ORDER BY Total_sales DESC

-- 4. Top 10 products by total sales
SELECT DISTINCT(product_id) AS Products, SUM(sale_price * quantity) as Total_Sales
FROM orders
GROUP BY Products
ORDER BY Total_Sales DESC LIMIT 10

-- 5. Orders Per Year
SELECT EXTRACT(YEAR FROM order_date) AS Order_Year, COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY Order_Year
ORDER BY Total_Orders DESC


-------------------------- MEDIUM LEVEL -----------------------------------

-- 1. Monthly Sales and Profit Trend
SELECT EXTRACT(MONTH FROM order_date) AS Order_Month,
ROUND(SUM(sale_price * quantity),2) AS Total_Sales,
ROUND(SUM(profit),2) AS Total_Profit
FROM orders
GROUP BY Order_Month
ORDER BY Order_Month

-- 2. Average Discount and Profit by category
SELECT category, ROUND(AVG(discount),2) AS Average_Discount,
ROUND(AVG(profit),2) AS Average_Profit
FROM orders
GROUP BY category
ORDER BY Average_Profit DESC

-- 3. Top 5 sub-categories by profit in each region
WITH ranked_profit AS (
    SELECT 
        region,
        sub_category,
        ROUND(SUM(profit), 2) AS total_profit,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(profit) DESC) AS rank
    FROM orders
    GROUP BY region, sub_category
)
SELECT 
    region,
    sub_category,
    total_profit
FROM ranked_profit
WHERE rank <= 5
ORDER BY region, total_profit DESC;

-- 4. Sales contribution by customer segment
SELECT segment, ROUND(SUM(sale_price * quantity),2) AS Total_Sales,
ROUND(100 * SUM(sale_price * quantity)/(SELECT SUM(sale_price * quantity) FROM orders),2) AS pct_contribution
FROM orders
GROUP BY segment
ORDER BY Total_Sales

-- 5. Discount vs Profit correlation data
SELECT discount, ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY discount
ORDER BY discount DESC;



-------------------------- HARD LEVEL -----------------------------------

-- 1.Year-over-Year (YoY) sales and profit growth
WITH yearly_data AS (
  SELECT 
      EXTRACT(YEAR FROM order_date) AS year,
      SUM(sale_price * quantity) AS total_sales,
      SUM(profit) AS total_profit
  FROM orders
  GROUP BY year
)
SELECT 
    year,
    total_sales,
    total_profit,
    ROUND(((total_sales - LAG(total_sales) OVER (ORDER BY year)) / LAG(total_sales) OVER (ORDER BY year)) * 100, 2) AS sales_yoy_growth,
    ROUND(((total_profit - LAG(total_profit) OVER (ORDER BY year)) / LAG(total_profit) OVER (ORDER BY year)) * 100, 2) AS profit_yoy_growth
FROM yearly_data
ORDER BY year;


-- 2. Top 5 states with highest profit growth (2022→2023)
WITH yearly_profit AS (
  SELECT 
      state,
      EXTRACT(YEAR FROM order_date) AS year,
      SUM(profit) AS total_profit
  FROM orders
  WHERE EXTRACT(YEAR FROM order_date) IN (2022, 2023)
  GROUP BY state, year
)
SELECT 
    a.state,
    ROUND(((b.total_profit - a.total_profit) / NULLIF(a.total_profit, 0)) * 100, 2) AS profit_growth_percent
FROM yearly_profit a
JOIN yearly_profit b ON a.state = b.state AND a.year = 2022 AND b.year = 2023
ORDER BY profit_growth_percent DESC
LIMIT 5;

-- 3. Sub-categories with profit despite >30% discount
SELECT sub_category, ROUND(SUM(profit), 2) AS total_profit, ROUND(AVG(discount)*100, 2) AS avg_discount_percent
FROM orders
WHERE discount > 0.3
GROUP BY sub_category
HAVING SUM(profit) > 0
ORDER BY total_profit DESC;

-- 4. Profit margin (%) by category
SELECT category, 
       ROUND(SUM(profit) / SUM(sale_price * quantity) * 100, 2) AS profit_margin_percent
FROM orders
GROUP BY category
ORDER BY profit_margin_percent DESC;

-- 5. Region vs Category profit matrix
SELECT region, category, ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY region, category
ORDER BY region, category;





