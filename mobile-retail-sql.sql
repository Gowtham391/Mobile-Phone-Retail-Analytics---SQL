# Mobile Phone Retail Analytics - SQL Project

## 📱 Mobile Phone Retail Analytics Project
### Complete SQL Database with Revenue & Profitability Analysis

---

## 🛠 Database Setup

### Create Database
```sql
CREATE DATABASE mobile_retail_analytics;
USE mobile_retail_analytics;
```

---

## 📊 Table 1: BRANDS
```sql
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) NOT NULL UNIQUE,
    country_origin VARCHAR(50),
    market_position VARCHAR(20)
);

INSERT INTO Brands VALUES
(1, 'Apple', 'USA', 'Premium'),
(2, 'Samsung', 'South Korea', 'Premium'),
(3, 'Xiaomi', 'China', 'Budget'),
(4, 'OnePlus', 'China', 'Mid-range'),
(5, 'Google Pixel', 'USA', 'Premium'),
(6, 'Motorola', 'USA', 'Mid-range'),
(7, 'Realme', 'China', 'Budget'),
(8, 'Nokia', 'Finland', 'Budget');
```

---

## 📱 Table 2: PRODUCTS
```sql
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL,
    model_year INT,
    storage_capacity VARCHAR(20),
    cost_price DECIMAL(10, 2),
    selling_price DECIMAL(10, 2),
    stock_quantity INT,
    category VARCHAR(30),
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

INSERT INTO Products VALUES
(1, 'iPhone 15 Pro Max', 1, 2024, '256GB', 900.00, 1399.99, 25, 'Flagship'),
(2, 'iPhone 15', 1, 2024, '128GB', 650.00, 899.99, 40, 'Standard'),
(3, 'Samsung Galaxy S24 Ultra', 2, 2024, '512GB', 850.00, 1349.99, 30, 'Flagship'),
(4, 'Samsung Galaxy S24', 2, 2024, '256GB', 600.00, 999.99, 45, 'Standard'),
(5, 'Xiaomi 14 Ultra', 3, 2024, '512GB', 450.00, 799.99, 60, 'Mid-range'),
(6, 'Xiaomi 13', 3, 2023, '256GB', 280.00, 499.99, 80, 'Budget'),
(7, 'OnePlus 12', 4, 2024, '256GB', 400.00, 799.99, 50, 'Mid-range'),
(8, 'OnePlus 11', 4, 2023, '128GB', 300.00, 599.99, 70, 'Budget'),
(9, 'Google Pixel 9 Pro', 5, 2024, '256GB', 750.00, 1199.99, 35, 'Flagship'),
(10, 'Google Pixel 9', 5, 2024, '128GB', 500.00, 799.99, 55, 'Standard'),
(11, 'Motorola Edge 50 Pro', 6, 2024, '256GB', 380.00, 699.99, 45, 'Mid-range'),
(12, 'Motorola G24', 6, 2024, '128GB', 180.00, 349.99, 100, 'Budget'),
(13, 'Realme GT 6', 7, 2024, '256GB', 350.00, 699.99, 65, 'Mid-range'),
(14, 'Realme 12', 7, 2024, '128GB', 150.00, 299.99, 120, 'Budget'),
(15, 'Nokia G100', 8, 2023, '128GB', 120.00, 249.99, 90, 'Budget');
```

---

## 👥 Table 3: CUSTOMERS
```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    region VARCHAR(50),
    signup_date DATE,
    customer_tier VARCHAR(20),
    total_spent DECIMAL(12, 2) DEFAULT 0
);

INSERT INTO Customers VALUES
(1, 'Rajesh Kumar', 'rajesh@email.com', 'North', '2023-05-15', 'Gold', 3500.00),
(2, 'Priya Singh', 'priya@email.com', 'South', '2023-08-22', 'Silver', 2100.00),
(3, 'Amit Patel', 'amit@email.com', 'West', '2023-10-10', 'Silver', 1800.00),
(4, 'Sneha Das', 'sneha@email.com', 'East', '2024-01-05', 'Bronze', 899.99),
(5, 'Vikram Rao', 'vikram@email.com', 'North', '2024-02-14', 'Gold', 4200.00),
(6, 'Ananya Gupta', 'ananya@email.com', 'South', '2024-03-20', 'Silver', 1599.99),
(7, 'Rohan Verma', 'rohan@email.com', 'West', '2024-04-11', 'Bronze', 699.99),
(8, 'Divya Malhotra', 'divya@email.com', 'East', '2024-05-08', 'Bronze', 1199.99),
(9, 'Arjun Sharma', 'arjun@email.com', 'North', '2024-06-15', 'Silver', 2799.98),
(10, 'Kavya Nair', 'kavya@email.com', 'South', '2024-07-01', 'Gold', 3899.98),
(11, 'Sanjay Chopra', 'sanjay@email.com', 'West', '2024-07-25', 'Bronze', 799.99),
(12, 'Neha Iyer', 'neha@email.com', 'East', '2024-08-12', 'Silver', 1699.99),
(13, 'Aditya Desai', 'aditya@email.com', 'North', '2024-09-03', 'Bronze', 499.99),
(14, 'Isha Reddy', 'isha@email.com', 'South', '2024-09-18', 'Gold', 2699.98),
(15, 'Nikhil Bhat', 'nikhil@email.com', 'West', '2024-10-05', 'Silver', 2199.99);
```

---

## 📦 Table 4: ORDERS
```sql
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    delivery_date DATE,
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Orders VALUES
(1, 1, 1, 1, '2024-01-10', '2024-01-15', 'Delivered'),
(2, 2, 4, 1, '2024-01-15', '2024-01-20', 'Delivered'),
(3, 3, 5, 2, '2024-01-20', '2024-01-25', 'Delivered'),
(4, 4, 12, 1, '2024-02-01', '2024-02-05', 'Delivered'),
(5, 5, 3, 1, '2024-02-10', '2024-02-15', 'Delivered'),
(6, 6, 6, 1, '2024-02-14', '2024-02-18', 'Delivered'),
(7, 1, 9, 1, '2024-03-05', '2024-03-10', 'Delivered'),
(8, 7, 14, 2, '2024-03-10', '2024-03-15', 'Delivered'),
(9, 8, 2, 1, '2024-03-18', '2024-03-22', 'Delivered'),
(10, 10, 1, 1, '2024-04-02', '2024-04-06', 'Delivered'),
(11, 9, 7, 1, '2024-04-15', '2024-04-20', 'Delivered'),
(12, 2, 10, 1, '2024-05-01', '2024-05-05', 'Delivered'),
(13, 14, 4, 2, '2024-05-12', '2024-05-16', 'Delivered'),
(14, 5, 5, 1, '2024-06-08', '2024-06-13', 'Delivered'),
(15, 12, 11, 1, '2024-06-20', '2024-06-25', 'Delivered'),
(16, 3, 3, 1, '2024-07-05', '2024-07-10', 'Delivered'),
(17, 10, 2, 1, '2024-07-15', '2024-07-19', 'Delivered'),
(18, 6, 8, 1, '2024-08-01', '2024-08-05', 'Delivered'),
(19, 15, 13, 1, '2024-08-18', '2024-08-23', 'Delivered'),
(20, 1, 10, 1, '2024-09-10', '2024-09-15', 'Delivered'),
(21, 4, 6, 1, '2024-09-22', '2024-09-27', 'Delivered'),
(22, 11, 14, 2, '2024-10-05', '2024-10-10', 'Delivered'),
(23, 9, 1, 1, '2024-10-15', '2024-10-20', 'Delivered'),
(24, 2, 7, 1, '2024-10-25', '2024-10-29', 'Delivered'),
(25, 13, 12, 1, '2024-10-30', NULL, 'Processing');
```

---

## 💳 Table 5: PAYMENTS
```sql
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    transaction_amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payments VALUES
(1, 1, 'Credit Card', 'Success', 1399.99, '2024-01-10'),
(2, 2, 'Debit Card', 'Success', 999.99, '2024-01-15'),
(3, 3, 'UPI', 'Success', 1599.98, '2024-01-20'),
(4, 4, 'Credit Card', 'Success', 349.99, '2024-02-01'),
(5, 5, 'Debit Card', 'Success', 1349.99, '2024-02-10'),
(6, 6, 'UPI', 'Success', 499.99, '2024-02-14'),
(7, 7, 'Credit Card', 'Success', 1199.99, '2024-03-05'),
(8, 8, 'Digital Wallet', 'Success', 599.98, '2024-03-10'),
(9, 9, 'UPI', 'Success', 899.99, '2024-03-18'),
(10, 10, 'Credit Card', 'Success', 1399.99, '2024-04-02'),
(11, 11, 'Debit Card', 'Success', 799.99, '2024-04-15'),
(12, 12, 'UPI', 'Success', 799.99, '2024-05-01'),
(13, 13, 'Credit Card', 'Success', 1999.98, '2024-05-12'),
(14, 14, 'Debit Card', 'Success', 799.99, '2024-06-08'),
(15, 15, 'UPI', 'Success', 699.99, '2024-06-20'),
(16, 16, 'Digital Wallet', 'Success', 1349.99, '2024-07-05'),
(17, 17, 'Credit Card', 'Success', 899.99, '2024-07-15'),
(18, 18, 'Debit Card', 'Success', 599.99, '2024-08-01'),
(19, 19, 'UPI', 'Success', 699.99, '2024-08-18'),
(20, 20, 'Credit Card', 'Success', 799.99, '2024-09-10'),
(21, 21, 'Debit Card', 'Success', 499.99, '2024-09-22'),
(22, 22, 'Digital Wallet', 'Success', 599.98, '2024-10-05'),
(23, 23, 'UPI', 'Success', 1399.99, '2024-10-15'),
(24, 24, 'Credit Card', 'Success', 799.99, '2024-10-25'),
(25, 25, 'Debit Card', 'Pending', 349.99, '2024-10-30');
```

---

## 🔍 ANALYTICAL QUERIES

### Query 1: Total Revenue & Profit Analysis
```sql
SELECT 
    SUM(p.selling_price * o.quantity) AS total_revenue,
    SUM((p.selling_price - p.cost_price) * o.quantity) AS total_profit,
    ROUND(
        (SUM((p.selling_price - p.cost_price) * o.quantity) / 
         SUM(p.selling_price * o.quantity) * 100), 2
    ) AS profit_margin_percentage
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success';
```

**Expected Output:** Shows total revenue, profit, and profit margin for all successful transactions.

---

### Query 2: Monthly Revenue & Profit Trend
```sql
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.selling_price * o.quantity) AS monthly_revenue,
    SUM((p.selling_price - p.cost_price) * o.quantity) AS monthly_profit,
    ROUND(
        (SUM((p.selling_price - p.cost_price) * o.quantity) / 
         SUM(p.selling_price * o.quantity) * 100), 2
    ) AS profit_margin
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;
```

**Expected Output:** Monthly breakdown showing revenue trends and profitability over time.

---

### Query 3: Top 10 Products by Revenue
```sql
SELECT 
    p.product_id,
    p.product_name,
    b.brand_name,
    p.category,
    COUNT(o.order_id) AS units_sold,
    SUM(o.quantity) AS total_quantity,
    ROUND(SUM(p.selling_price * o.quantity), 2) AS product_revenue,
    ROUND(SUM((p.selling_price - p.cost_price) * o.quantity), 2) AS product_profit
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Brands b ON p.brand_id = b.brand_id
JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success'
GROUP BY p.product_id, p.product_name, b.brand_name, p.category
ORDER BY product_revenue DESC
LIMIT 10;
```

**Expected Output:** Top performing products by revenue with profit metrics.

---

### Query 4: Top 10 Customers by Spending
```sql
SELECT 
    c.customer_id,
    c.customer_name,
    c.region,
    c.customer_tier,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.selling_price * o.quantity) AS customer_lifetime_value,
    ROUND(AVG(p.selling_price * o.quantity), 2) AS avg_order_value
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id
LEFT JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success' OR pm.payment_id IS NULL
GROUP BY c.customer_id, c.customer_name, c.region, c.customer_tier
ORDER BY customer_lifetime_value DESC
LIMIT 10;
```

**Expected Output:** Top spending customers with tier information.

---

### Query 5: Profit Margin by Product Category
```sql
SELECT 
    p.category,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(p.selling_price * o.quantity), 2) AS category_revenue,
    ROUND(SUM((p.selling_price - p.cost_price) * o.quantity), 2) AS category_profit,
    ROUND(
        (SUM((p.selling_price - p.cost_price) * o.quantity) / 
         SUM(p.selling_price * o.quantity) * 100), 2
    ) AS profit_margin_percent
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success'
GROUP BY p.category
ORDER BY category_profit DESC;
```

**Expected Output:** Profitability breakdown by product category (Flagship, Standard, Mid-range, Budget).

---

### Query 6: Brand Performance Analysis
```sql
SELECT 
    b.brand_id,
    b.brand_name,
    b.market_position,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(p.selling_price * o.quantity), 2) AS brand_revenue,
    ROUND(SUM((p.selling_price - p.cost_price) * o.quantity), 2) AS brand_profit,
    ROUND(
        (SUM((p.selling_price - p.cost_price) * o.quantity) / 
         SUM(p.selling_price * o.quantity) * 100), 2
    ) AS profit_margin
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Brands b ON p.brand_id = b.brand_id
JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success'
GROUP BY b.brand_id, b.brand_name, b.market_position
ORDER BY brand_revenue DESC;
```

**Expected Output:** Performance metrics by brand with profitability.

---

### Query 7: Regional Performance & Trends
```sql
SELECT 
    c.region,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(p.selling_price * o.quantity), 2) AS regional_revenue,
    ROUND(SUM((p.selling_price - p.cost_price) * o.quantity), 2) AS regional_profit,
    ROUND(
        (SUM((p.selling_price - p.cost_price) * o.quantity) / 
         SUM(p.selling_price * o.quantity) * 100), 2
    ) AS profit_margin
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
JOIN Payments pm ON o.order_id = pm.order_id
WHERE pm.payment_status = 'Success'
GROUP BY c.region
ORDER BY regional_revenue DESC;
```

**Expected Output:** Regional sales and profitability insights.

---

### Query 8: Payment Method Analysis
```sql
SELECT 
    pm.payment_method,
    COUNT(pm.payment_id) AS total_transactions,
    COUNT(CASE WHEN pm.payment_status = 'Success' THEN 1 END) AS successful_payments,
    COUNT(CASE WHEN pm.payment_status = 'Pending' THEN 1 END) AS pending_payments,
    COUNT(CASE WHEN pm.payment_status = 'Failed' THEN 1 END) AS failed_payments,
    ROUND(
        (COUNT(CASE WHEN pm.payment_status = 'Success' THEN 1 END) / 
         COUNT(pm.payment_id) * 100), 2
    ) AS success_rate,
    ROUND(SUM(CASE WHEN pm.payment_status = 'Success' THEN pm.transaction_amount ELSE 0 END), 2) AS successful_revenue
FROM Payments pm
GROUP BY pm.payment_method
ORDER BY successful_revenue DESC;
```

**Expected Output:** Payment method preferences and success rates.

---

### Query 9: Brand-wise Profit Margin Comparison
```sql
SELECT 
    b.brand_name,
    COUNT(DISTINCT p.product_id) AS num_products,
    ROUND(AVG(p.selling_price), 2) AS avg_selling_price,
    ROUND(AVG(p.cost_price), 2) AS avg_cost_price,
    ROUND(AVG((p.selling_price - p.cost_price) / p.cost_price * 100), 2) AS avg_margin_percent,
    ROUND(SUM((p.selling_price - p.cost_price) * o.quantity), 2) AS total_profit
FROM Products p
JOIN Brands b ON p.brand_id = b.brand_id
LEFT JOIN Orders o ON p.product_id = o.product_id
GROUP BY b.brand_name
ORDER BY avg_margin_percent DESC;
```

**Expected Output:** Margin analysis comparing different brands.

---

### Query 10: RFM Segmentation (Customer Value Analysis)
```sql
WITH RFM AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.customer_tier,
        MAX(o.order_date) AS last_purchase_date,
        COUNT(o.order_id) AS frequency,
        SUM(p.selling_price * o.quantity) AS monetary_value,
        DATEDIFF(CURDATE(), MAX(o.order_date)) AS days_since_purchase
    FROM Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
    LEFT JOIN Products p ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name, c.customer_tier
)
SELECT 
    customer_id,
    customer_name,
    customer_tier,
    frequency AS purchase_frequency,
    ROUND(monetary_value, 2) AS lifetime_value,
    days_since_purchase,
    CASE 
        WHEN days_since_purchase <= 30 AND monetary_value >= 2000 THEN 'VIP Active'
        WHEN days_since_purchase <= 90 AND monetary_value >= 1500 THEN 'High Value'
        WHEN days_since_purchase <= 90 THEN 'Active Customer'
        WHEN days_since_purchase > 90 AND monetary_value >= 1000 THEN 'At Risk'
        ELSE 'Inactive'
    END AS customer_segment
FROM RFM
ORDER BY monetary_value DESC;
```

**Expected Output:** Customer segmentation based on RFM analysis for targeted marketing.

---

### Query 11: Products Bought Together (Basket Analysis)
```sql
SELECT 
    p1.product_name AS product_a,
    p2.product_name AS product_b,
    COUNT(*) AS frequency,
    ROUND(SUM(p1.selling_price + p2.selling_price), 2) AS combined_value
FROM Orders o1
JOIN Orders o2 ON o1.customer_id = o2.customer_id 
    AND o1.order_id != o2.order_id
    AND o1.product_id < o2.product_id
JOIN Products p1 ON o1.product_id = p1.product_id
JOIN Products p2 ON o2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
HAVING COUNT(*) > 0
ORDER BY frequency DESC
LIMIT 15;
```

**Expected Output:** Cross-sell opportunities identifying products frequently purchased together.

---

### Query 12: Inventory Stock vs Sales Performance
```sql
SELECT 
    p.product_id,
    p.product_name,
    b.brand_name,
    p.stock_quantity AS current_stock,
    COUNT(o.order_id) AS units_sold,
    ROUND(COUNT(o.order_id) / NULLIF(p.stock_quantity, 0) * 100, 2) AS sell_through_rate,
    ROUND((COUNT(o.order_id) / (COUNT(o.order_id) + p.stock_quantity) * 100), 2) AS inventory_turnover_ratio
FROM Products p
JOIN Brands b ON p.brand_id = b.brand_id
LEFT JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, b.brand_name, p.stock_quantity
ORDER BY sell_through_rate DESC;
```

**Expected Output:** Stock management insights with turnover ratios.

---

## 📈 Key Metrics Summary

| Metric | Purpose |
|--------|---------|
| **Total Revenue** | Overall business performance |
| **Profit Margin %** | Pricing strategy effectiveness |
| **Monthly Trends** | Seasonality and growth patterns |
| **Top Products** | Best sellers and focus areas |
| **Customer Segmentation** | Targeted marketing opportunities |
| **Regional Performance** | Geographic expansion potential |
| **Payment Success Rate** | Payment processing quality |
| **RFM Analysis** | Customer lifetime value prediction |
| **Basket Analysis** | Cross-sell opportunities |
| **Inventory Turnover** | Stock management efficiency |

---

## 🎯 How to Use This Project

1. **Create the database** and run all table creation queries
2. **Insert sample data** to populate the tables
3. **Run analytical queries** one by one to generate reports
4. **Customize** the queries with your own business logic
5. **Build dashboards** in Power BI/Tableau using these queries
6. **Present findings** to stakeholders

---

## 💡 Portfolio Enhancement Tips

✅ **For Interviews:**
- Explain each query's business logic
- Show understanding of JOINs, aggregation, and window functions
- Mention optimization techniques (indexes, query planning)

✅ **For GitHub:**
- Add comments explaining business context
- Include expected outputs/sample results
- Document assumptions about data

✅ **For Job Applications:**
- Highlight RFM segmentation and customer analytics
- Emphasize business problem-solving approach
- Note profitability focus (not just revenue)

---

## 🔗 Related Technologies

- **SQL Database:** MySQL, PostgreSQL, SQL Server
- **Visualization:** Power BI, Tableau, Looker
- **Business Intelligence:** Data warehouse design
- **Advanced Analytics:** Predictive customer modeling

---
