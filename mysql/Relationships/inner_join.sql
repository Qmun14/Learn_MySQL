-- IMPLICIT INNER JOIN

SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;

-- mysql> source Relationships/inner_join.sql;
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- | id | first_name | last_name | email            | id | order_date | amount | customer_id |
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
-- |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
-- |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
-- |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- 5 rows in set (0.00 sec)


-- IMPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;
    
-- mysql> source Relationships/inner_join.sql;
-- +------------+-----------+------------+--------+
-- | first_name | last_name | order_date | amount |
-- +------------+-----------+------------+--------+
-- | Boy        | George    | 2016-02-10 |  99.99 |
-- | Boy        | George    | 2017-11-11 |  35.50 |
-- | George     | Michael   | 2014-12-12 | 800.67 |
-- | George     | Michael   | 2015-01-03 |  12.50 |
-- | Bette      | Davis     | 1999-04-11 | 450.25 |
-- +------------+-----------+------------+--------+
-- 5 rows in set (0.00 sec)


-- EXPLICIT INNER JOINS =========>>>>>>>>> ini yang harus dipakai berdasarkan konvensi yang tak tertulis dalam dunia Pemrograman Internasional <<<==== 

SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
-- mysql> source Relationships/inner_join.sql;
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- | id | first_name | last_name | email            | id | order_date | amount | customer_id |
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
-- |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
-- |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
-- |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- 5 rows in set (0.00 sec)
    
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;

-- mysql> source Relationships/inner_join.sql;
-- +------------+-----------+------------+--------+
-- | first_name | last_name | order_date | amount |
-- +------------+-----------+------------+--------+
-- | Boy        | George    | 2016-02-10 |  99.99 |
-- | Boy        | George    | 2017-11-11 |  35.50 |
-- | George     | Michael   | 2014-12-12 | 800.67 |
-- | George     | Michael   | 2015-01-03 |  12.50 |
-- | Bette      | Davis     | 1999-04-11 | 450.25 |
-- +------------+-----------+------------+--------+
-- 5 rows in set (0.00 sec)
    
SELECT *
FROM orders
JOIN customers
    ON customers.id = orders.customer_id;
    
-- mysql> source Relationships/inner_join.sql;
-- +----+------------+--------+-------------+----+------------+-----------+------------------+
-- | id | order_date | amount | customer_id | id | first_name | last_name | email            |
-- +----+------------+--------+-------------+----+------------+-----------+------------------+
-- |  1 | 2016-02-10 |  99.99 |           1 |  1 | Boy        | George    | george@gmail.com |
-- |  2 | 2017-11-11 |  35.50 |           1 |  1 | Boy        | George    | george@gmail.com |
-- |  3 | 2014-12-12 | 800.67 |           2 |  2 | George     | Michael   | gm@gmail.com     |
-- |  4 | 2015-01-03 |  12.50 |           2 |  2 | George     | Michael   | gm@gmail.com     |
-- |  5 | 1999-04-11 | 450.25 |           5 |  5 | Bette      | Davis     | bette@aol.com    |
-- +----+------------+--------+-------------+----+------------+-----------+------------------+
-- 5 rows in set (0.00 sec)