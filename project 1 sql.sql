drop table if exists books;
create table books(
Book_ID	serial primary key,
Title	varchar(100),
Author	varchar(100),
Genre	varchar(50),
Published_Year	int,
Price	numeric(10,2),
Stock	int
);
select*from books;

create table customer(
Customer_ID	int primary key,
Name	varchar(100),
Email	varchar(100),
Phone	BIGINT,
City	varchar(50),
Country	varchar(50)
);

select*from customer;
drop table if exists Orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,      
    Customer_ID BIGINT references customer (Customer_ID) ,       
    Book_ID BIGINT references books (book_id),           
    Order_Date DATE NOT NULL,           
    Quantity INT NOT NULL,             
    Total_Amount NUMERIC(10, 2) NOT NULL  
);

select*from Orders;

--retrieve all books in the fiction genre
select * from books
where genre='Fiction';

--find book published after the year 1950
select * from books
where published_year>1950;

--list all the customer from Pune
select* from customer
where city='Pune';

---show order placed in october 2025
select* from Orders
where order_date between '2025-10-01' and '2025-10-30';

--retrieve the stock of book available
select sum(stock) as total_stock
from books;

--find the detail of most expensive book
select * from books order by price desc limit 1;

--show all customer who order more than 1 quantity of book
select * from Orders
where quantity>1;

--retrieve all the orders where the total amount exceeds $100
select * from Orders
where total_amount>100;

--list all the genre available in the book tab;e
select distinct genre from books;

--find the book with lowest stock
select * from books order by stock asc limit 5;

--calculate the total revenue generated from the orders
select sum(total_amount) as revenue from Orders;

--ADVANCE QUERIES
--RETRIEVE THE TOTAL NUMBER OF BOOK SOLD FOR EACH GENRE
SELECT b.genre,sum(o.quantity) as total_book_sold
from Orders o
join
books b on o.book_id=b.book_id
group by b.genre;

--find thr average price of the book in the fantsy genre
select avg(price) from books
where genre='Fantasy';

--list a customer who have placed atleast 2 orders:
select * from customer;
select * from Orders;
select c.name , c.customer_id, count(o.order_id) as order_placed
FROM customer c
JOIN Orders o 
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

--fine the most frequently ordered book
select b.title,b.book_id, count(o.order_id) as frequently_order
from books b
join
Orders o
on o.book_id=b.book_id
group by b.book_id ,b.title
order by frequently_order DESC limit 2;

--show the top 3 most expensive book of 'fantasy genre'
select * from books
where genre='Fantasy'
order by price desc limit 3;

--retrieve the total quantity of book sold by each author
select b.book_id ,b.title,b.author, sum(o.quantity) as total_quantity_retrieve 
from books b
join Orders o
on o.book_id=b.book_id
group by b.book_id,b.title,b.author;

--list the cities where customers spent over $ 30 are located
select c.name, c.customer_id,o.order_id ,sum(o.total_amount), c.city 
from Orders o 
join
customer c
on o.customer_id=c.customer_id
group by c.name ,c.customer_id ,c.city,o.order_id
having sum(o.total_amount)> 30;

