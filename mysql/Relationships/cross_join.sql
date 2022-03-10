-- Finding Orders Placed By George: 2 Step Process --

SELECT id FROM customers WHERE last_name='George';

SELECT * FROM orders WHERE customer_id = 1;

-- mysql> source Relationships/cross_join.sql;
-- +----+
-- | id |
-- +----+
-- |  1 |
-- +----+
-- 1 row in set (0.00 sec)

-- +----+------------+--------+-------------+
-- | id | order_date | amount | customer_id |
-- +----+------------+--------+-------------+
-- |  1 | 2016-02-10 |  99.99 |           1 |
-- |  2 | 2017-11-11 |  35.50 |           1 |
-- +----+------------+--------+-------------+
-- 2 rows in set (0.00 sec)


-- Finding Orders Placed By George: Using a subquery

SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );
-- mysql> source Relationships/cross_join.sql;
-- +----+------------+--------+-------------+
-- | id | order_date | amount | customer_id |
-- +----+------------+--------+-------------+
-- |  1 | 2016-02-10 |  99.99 |           1 |
-- |  2 | 2017-11-11 |  35.50 |           1 |
-- +----+------------+--------+-------------+
-- 2 rows in set (0.00 sec)

-- Cross Join Craziness --

SELECT * FROM customers, orders; 
-- mysql> source Relationships/cross_join.sql;
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- | id | first_name | last_name | email            | id | order_date | amount | customer_id |
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
-- |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
-- |  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
-- |  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
-- |  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
-- |  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
-- |  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
-- |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
-- |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
-- |  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
-- |  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
-- |  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
-- |  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
-- |  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
-- |  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
-- |  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
-- |  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
-- |  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
-- |  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
-- |  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
-- |  6 | Mochi      | Ramdhan   | mochi@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
-- |  6 | Mochi      | Ramdhan   | mochi@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
-- |  6 | Mochi      | Ramdhan   | mochi@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
-- |  6 | Mochi      | Ramdhan   | mochi@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
-- |  6 | Mochi      | Ramdhan   | mochi@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
-- +----+------------+-----------+------------------+----+------------+--------+-------------+
-- 30 rows in set (0.00 sec)
