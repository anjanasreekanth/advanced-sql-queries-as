DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name VARCHAR(50)
);

CREATE TABLE orders (
 id INT PRIMARY KEY,
 customer_id INT NULL,
 order_date DATE,
 total_amount DECIMAL(10, 2),
 FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Smith'),
(4, 'Bob', 'Brown');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2023-01-01', 100.00),
(2, 1, '2023-02-01', 150.00),
(3, 2, '2023-01-01', 200.00),
(4, 3, '2023-04-01', 250.00),
(5, 3, '2023-04-01', 300.00),
(6, NULL, '2023-04-01', 100.00);

select * from customers;
select * From orders;

-- using JOIN to combine data from customers and orders
SELECT customers.first_name, customers.last_name, orders.total_amount
FROM customers
INNER JOIN orders ON orders.customer_id = customers.id; 

-- using left join
SELECT customers.id,CONCAT(customers.first_name," ", customers.last_name) AS Name, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id; 

-- GROUP BY queries with aggregate functions like SUM and COUNT
SELECT customer_id, SUM(total_amount) 
FROM orders
GROUP BY customer_id;

-- Apply WHERE clause to filter data
SELECT  customer_id, order_date, SUM(total_amount) 
FROM orders
WHERE customer_id = 1
GROUP BY order_date;

-- Apply HAVING clause to filter data

SELECT  customer_id, order_date, SUM(total_amount) 
FROM orders
GROUP BY order_date, customer_id
HAVING SUM(total_amount) < 200;

-- using SubQueries to create dynamic filters
SELECT customer_id, order_date, total_amount
FROM orders
WHERE customer_id IN (SELECT id from customers where last_name = "SMITH");











