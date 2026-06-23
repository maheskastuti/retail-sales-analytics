# Retail Sales & Customer Analytics

SQL-based retail analytics project simulating real-world sales data analysis.

## Database Schema
- Customers
- Products
- Orders
- Order Items
- Payments

## Analysis Performed
- Total and monthly revenue trends
- Top 5 high-value customers
- Category-wise and product-wise revenue
- Repeat customer identification
- Payment method analysis
- City-wise revenue breakdown
- Full order details report (4-table JOIN)

## Tech Stack
- MySQL
- SQL (Joins, Aggregations, Window Functions, Group By)

## How to Run
1. Open MySQL Workbench
2. Run retail_sales_schema.sql first
3. Run retail_sales_data.sql second
4. Run retail_sales_analysis.sql to see all reports

## Excel Dashboard
- Retail_Sales_Customer_Analytics.xlsx contains 5 sheets:
  - Customers, Products, Orders & Payments datasets
  - Analysis sheet with VLOOKUP, RANK formulas, and city-wise revenue chart
  - Dashboard with live KPI cards (Total Revenue, Orders, Customers, Avg Order Value)
