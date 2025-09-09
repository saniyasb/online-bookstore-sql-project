# 📚 Online Bookstore SQL Project  

This project simulates an **online bookstore database** and demonstrates how SQL can be used to answer real-world business questions such as customer behavior, bestselling books, revenue, and inventory management.  

---

## 🔎 Key Features  

### 👥 Customer Insights  
- Identify frequent buyers (2+ orders)  
- Find top spenders ranked by total amount  
- Detect inactive customers with no orders  

### 📚 Book Analytics  
- List the most frequently ordered books  
- Get the top 5 bestselling titles  
- Track order quantities per book  

### 🏙️ City & Sales Trends  
- Analyze customer spending by city  
- Generate city-wise revenue reports  
- Compare customer activity across locations  

### 📦 Inventory Management  
- Calculate remaining stock after fulfilling all orders  
- Flag low-stock or out-of-stock books  
- Monitor bestselling titles for restocking  

---

## 🛠️ Skills Demonstrated  
- Writing advanced SQL queries  
- Using **JOINs** (`INNER JOIN`, `LEFT JOIN`)  
- Aggregation with `SUM`, `COUNT`, `MAX`, `COALESCE`  
- Grouping with `GROUP BY` and filtering with `HAVING`  
- Ordering results to get top/bottom performers  
- Business-oriented query design  

---

## 📂 Project Structure  
- `bookstore_schema.sql` → Database schema (Books, Customers, Orders)  
- `bookstore_queries.sql` → All queries with comments  
- `README.md` → Project documentation  

---

## 🚀 Example Queries  

### Top 5 Bestselling Books  
```sql
SELECT b.book_id, b.title, SUM(o.quantity) AS total_sold
FROM books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title
ORDER BY total_sold DESC
LIMIT 5;
