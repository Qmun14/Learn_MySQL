--  ==============--------UNTUK IMPLEMENTASI RIGHT JOIN SAMA DENGAN LEFT JOIN, KITA GUNAKAN DATABASE BARU DAN TABEL BARU UNTUK KONDISI INI ------------------------===================
 
 CREATE DATABASE pesanan_pelanggan;
 
 -- ========== WORKING WITH ON DELETE CASCADE ===============--

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

-- mysql> DESC customers;
-- +------------+--------------+------+-----+---------+----------------+
-- | Field      | Type         | Null | Key | Default | Extra          |
-- +------------+--------------+------+-----+---------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | first_name | varchar(100) | YES  |     | NULL    |                |
-- | last_name  | varchar(100) | YES  |     | NULL    |                |
-- | email      | varchar(100) | YES  |     | NULL    |                |
-- +------------+--------------+------+-----+---------+----------------+
-- 4 rows in set (0.00 sec)
 
 
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE                -- =====>>>>> ON DELETE CASCADE adalah kondisi Untuk Foreign Key di mana ketika Parent Pemilik Primary Key di Hapus maka Children yg Memiliki Foreign Key ikut Terhapus juga secara otomatis dan tidak membuat Error Warning
);

-- mysql> DESC orders;
-- +-------------+--------------+------+-----+---------+----------------+
-- | Field       | Type         | Null | Key | Default | Extra          |
-- +-------------+--------------+------+-----+---------+----------------+
-- | id          | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | order_date  | date         | YES  |     | NULL    |                |
-- | amount      | decimal(8,2) | YES  |     | NULL    |                |
-- | customer_id | int(11)      | YES  | MUL | NULL    |                |
-- +-------------+--------------+------+-----+---------+----------------+
-- 4 rows in set (0.00 sec)


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

-- mysql> SELECT * FROM customers;
-- +----+------------+-----------+------------------+
-- | id | first_name | last_name | email            |
-- +----+------------+-----------+------------------+
-- |  1 | Boy        | George    | george@gmail.com |
-- |  2 | George     | Michael   | gm@gmail.com     |
-- |  3 | David      | Bowie     | david@gmail.com  |
-- |  4 | Blue       | Steele    | blue@gmail.com   |
-- |  5 | Bette      | Davis     | bette@aol.com    |
-- +----+------------+-----------+------------------+
-- 5 rows in set (0.00 sec)


INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
-- mysql> SELECT * FROM orders;
-- +----+------------+--------+-------------+
-- | id | order_date | amount | customer_id |
-- +----+------------+--------+-------------+
-- |  1 | 2016-02-10 |  99.99 |           1 |
-- |  2 | 2017-11-11 |  35.50 |           1 |
-- |  3 | 2014-12-12 | 800.67 |           2 |
-- |  4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | 1999-04-11 | 450.25 |           5 |
-- +----+------------+--------+-------------+
-- 5 rows in set (0.00)

mysql> DELETE FROM customers WHERE first_name = 'Boy';
Query OK, 1 row affected (0.01 sec)

-- mysql> SELECT *  FROM orders;
-- +----+------------+--------+-------------+
-- | id | order_date | amount | customer_id |
-- +----+------------+--------+-------------+
-- |  3 | 2014-12-12 | 800.67 |           2 |
-- |  4 | 2015-01-03 |  12.50 |           2 |
-- |  5 | 1999-04-11 | 450.25 |           5 |
-- +----+------------+--------+-------------+
-- 3 rows in set (0.00 sec)

       

 