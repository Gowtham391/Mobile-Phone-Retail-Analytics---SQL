# 📱 Mobile Phone Retail Analytics

A SQL project analyzing sales, revenue, profitability, and customer behavior for a mobile phone retail store.

---

## 📋 About This Project

This project demonstrates SQL analytics on a mobile phone retail business. It includes a complete database with realistic data for brands, products, customers, orders, and payments.

The analysis covers:
- Revenue and profit calculations
- Monthly sales trends
- Product and brand performance
- Customer segmentation
- Regional sales analysis
- Payment method tracking
- Inventory management

---

## 🗂️ Database Structure

### Tables

**Brands**
- Stores information about phone manufacturers (Apple, Samsung, Xiaomi, etc.)

**Products**
- Phone models with pricing, storage capacity, and category
- Links to Brands table

**Customers**
- Customer details including region and tier status
- Tracks total spending and signup date

**Orders**
- Transaction records linking customers to products
- Includes quantity, order date, and delivery status

**Payments**
- Payment information for each order
- Tracks payment method, status, and amount

---

## 🚀 Getting Started

### Prerequisites
- MySQL, PostgreSQL, or any SQL database
- SQL client (MySQL Workbench, DBeaver, pgAdmin, etc.)

### Installation

1. **Create the database**
```sql
CREATE DATABASE mobile_retail_analytics;
USE mobile_retail_analytics;
```

2. **Run the schema file**
- Execute all CREATE TABLE statements from `mobile-retail-sql.sql`
- Creates the 5 main tables with proper relationships

3. **Load sample data**
- Run all INSERT statements to populate:
  - 8 brands
  - 15 products
  - 15 customers
  - 25 orders
  - 25 payments

4. **Run analysis queries**
- Execute the analytical queries to generate insights

---

## 📊 Analysis Included

### 1. Revenue & Profit Analysis
Calculates total revenue, profit, and profit margin across all transactions.

### 2. Monthly Trends
Shows revenue and profit patterns over time (January - October 2024).

### 3. Top Products
Identifies best-selling products by revenue and profitability.

### 4. Top Customers
Ranks customers by lifetime value and purchase frequency.

### 5. Category Performance
Compares profitability across product categories (Flagship, Standard, Mid-range, Budget).

### 6. Brand Performance
Analyzes sales and margins for each brand.

### 7. Regional Analysis
Breaks down sales by geographic region (North, South, East, West).

### 8. Payment Methods
Tracks payment preferences and success rates.

### 9. Profit Margins by Brand
Detailed margin comparison across manufacturers.

### 10. RFM Customer Segmentation
Segments customers based on Recency, Frequency, and Monetary value.

### 11. Basket Analysis
Identifies products frequently purchased together.

### 12. Inventory Turnover
Evaluates stock performance and sell-through rates.

---

## 📈 Sample Insights

**Revenue:** Total sales of ₹23,974.67 with 32.82% profit margin

**Top Product:** iPhone 15 Pro Max (2 units sold, ₹2,799.98 revenue)

**Top Customer:** Vikram Rao (₹4,200 lifetime value)

**Best Region:** North (₹7,299.95 revenue)

**Popular Payment:** Credit Card (37% of transactions)

**Best Margin Category:** Mid-range phones (36.03% margin)

---

## 🛠️ Technologies Used

- **Database:** MySQL / PostgreSQL
- **Language:** SQL
- **Analysis:** Aggregations, JOINs, CTEs, Date functions

---


## 💡 Use Cases

This project demonstrates:
- Database design and normalization
- Complex SQL queries with multiple JOINs
- Business metrics calculation
- Customer analytics and segmentation
- Data-driven decision making

---

## 🔄 Future Enhancements

- Add product returns and refunds tracking
- Include product reviews and ratings
- Expand time period to multiple years
- Add supplier and inventory management
- Create seasonal analysis

---

## 📝 License

This project is open source and available for learning purposes.

