--- LEFT JOINS ---

SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
    
-- mysql> source Relationships/left_join.sql;  --===============>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AMBIL SEMUA DATA TABEL DI SEBELAH KIRI, DAN AMBIL DI TABEL KANAN YG HANYA ADA IRISANNYA DENGAN YANG KIRI
-- +----+------------+-----------+------------------+------+------------+--------+-------------+
-- | id | first_name | last_name | email            | id   | order_date | amount | customer_id |
-- +----+------------+-----------+------------------+------+------------+--------+-------------+
-- |  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
-- |  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
-- |  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
-- |  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
-- |  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
-- |  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
-- |  6 | Mochi      | Ramdhan   | mochi@gmail.com  | NULL | NULL       |   NULL |        NULL |
-- +----+------------+-----------+------------------+------+------------+--------+-------------+
-- 8 rows in set (0.01 sec)


SELECT
      first_name,
      last_name,
      order_date,
      amount
FROM customers
LEFT JOIN orders
      ON customers.id = orders.customer_id;

-- mysql> source Relationships/left_join.sql;
-- +------------+-----------+------------+--------+
-- | first_name | last_name | order_date | amount |
-- +------------+-----------+------------+--------+
-- | Boy        | George    | 2016-02-10 |  99.99 |
-- | Boy        | George    | 2017-11-11 |  35.50 |
-- | George     | Michael   | 2014-12-12 | 800.67 |
-- | George     | Michael   | 2015-01-03 |  12.50 |
-- | Bette      | Davis     | 1999-04-11 | 450.25 |
-- | David      | Bowie     | NULL       |   NULL |
-- | Blue       | Steele    | NULL       |   NULL |
-- | Mochi      | Ramdhan   | NULL       |   NULL |
-- +------------+-----------+------------+--------+
-- 8 rows in set (0.00 sec)


SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent         -- ===>>>>>>  '{IFNULL}' DISINI UNTUK MELAKUKAN LOGIC APABILA ADA ISI COLUM YG NULL MAKA LAKUKAN KONDISI YG MAU DIPAKAI
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

-- mysql> source Relationships/left_join.sql;
-- +------------+-----------+-------------+
-- | first_name | last_name | total_spent |
-- +------------+-----------+-------------+
-- | David      | Bowie     |        0.00 |
-- | Mochi      | Ramdhan   |        0.00 |
-- | Blue       | Steele    |        0.00 |
-- | Boy        | George    |      135.49 |
-- | Bette      | Davis     |      450.25 |
-- | George     | Michael   |      813.17 |
-- +------------+-----------+-------------+
-- 6 rows in set (0.00 sec)
