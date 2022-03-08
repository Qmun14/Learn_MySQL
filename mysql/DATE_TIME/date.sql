CREATE  people (
     name VARCHAR(100),
     birthdate DATE,
     birthtime TIME,
     birthdt DATETIME
);
-- mysql> DESC people;
-- +-----------+--------------+------+-----+---------+-------+
-- | Field     | Type         | Null | Key | Default | Extra |
-- +-----------+--------------+------+-----+---------+-------+
-- | name      | varchar(100) | YES  |     | NULL    |       |
-- | birthdate | date         | YES  |     | NULL    |       |
-- | birthtime | time         | YES  |     | NULL    |       |
-- | birthdt   | datetime     | YES  |     | NULL    |       |
-- +-----------+--------------+------+-----+---------+-------+
-- 4 rows in set (0.00 sec)

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
-- mysql> SELECT * FROM people;
-- +-------+------------+-----------+---------------------+
-- | name  | birthdate  | birthtime | birthdt             |
-- +-------+------------+-----------+---------------------+
-- | Padma | 1993-11-11 | 10:07:35  | 1993-11-11 10:07:35 |
-- | Larry | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
-- +-------+------------+-----------+---------------------+
-- 2 rows in set (0.00 sec)

mysql> SELECT CURDATE();
-- +------------+
-- | CURDATE()  |
-- +------------+
-- | 2022-03-08 |
-- +------------+
-- 1 row in set (0.00 sec)

mysql> SELECT CURTIME();
-- +-----------+
-- | CURTIME() |
-- +-----------+
-- | 13:16:32  |
-- +-----------+
-- 1 row in set (0.00 sec)

mysql> SELECT NOW();
-- +---------------------+
-- | NOW()               |
-- +---------------------+
-- | 2022-03-08 13:17:15 |
-- +---------------------+
-- 1 row in set (0.01 sec)

-- # Formatting Dates (and Times)
-- # =======================================
-- # DAY()
-- # DAYNAME()
-- # DAYOFWEEK()
-- # DAYOFYEAR()

SELECT name, birthdate, DAY(birthdate) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +-------+------------+----------------+
-- | name  | birthdate  | DAY(birthdate) |
-- +-------+------------+----------------+
-- | Padma | 1993-11-11 |             11 |
-- | Larry | 1943-12-25 |             25 |
-- +-------+------------+----------------+
-- 2 rows in set (0.00 sec)

SELECT name, birthdate, DAYNAME(birthdate) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +-------+------------+--------------------+
-- | name  | birthdate  | DAYNAME(birthdate) |
-- +-------+------------+--------------------+
-- | Padma | 1993-11-11 | Thursday           |
-- | Larry | 1943-12-25 | Saturday           |
-- +-------+------------+--------------------+
-- 2 rows in set (0.01 sec)

SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +-------+------------+----------------------+
-- | name  | birthdate  | DAYOFWEEK(birthdate) |
-- +-------+------------+----------------------+
-- | Padma | 1993-11-11 |                    5 |
-- | Larry | 1943-12-25 |                    7 |
-- +-------+------------+----------------------+
-- 2 rows in set (0.00 sec)

SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +-------+------------+----------------------+
-- | name  | birthdate  | DAYOFYEAR(birthdate) |
-- +-------+------------+----------------------+
-- | Padma | 1993-11-11 |                  315 |
-- | Larry | 1943-12-25 |                  359 |
-- +-------+------------+----------------------+
-- 2 rows in set (0.00 sec)

SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +-------+---------------------+--------------------+
-- | name  | birthdt             | DAYOFYEAR(birthdt) |
-- +-------+---------------------+--------------------+
-- | Padma | 1993-11-11 10:07:35 |                315 |
-- | Larry | 1943-12-25 04:10:42 |                359 |
-- +-------+---------------------+--------------------+
-- 2 rows in set (0.00 sec)

-- # =============================================== COOLEST FUNCTIONS ========================================

SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +------------------------------------------+
-- | DATE_FORMAT(birthdt, 'Was born on a %W') |
-- +------------------------------------------+
-- | Was born on a Thursday                   |
-- | Was born on a Saturday                   |
-- +------------------------------------------+
-- 2 rows in set (0.00 sec)

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +----------------------------------+
-- | DATE_FORMAT(birthdt, '%m/%d/%Y') |
-- +----------------------------------+
-- | 11/11/1993                       |
-- | 12/25/1943                       |
-- +----------------------------------+
-- 2 rows in set (0.00 sec)

SELECT DATE_FORMAT(birthdt, '%d-%M-%Y') FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +----------------------------------+
-- | DATE_FORMAT(birthdt, '%d-%M-%Y') |
-- +----------------------------------+
-- | 11-November-1993                 |
-- | 25-December-1943                 |
-- +----------------------------------+
-- 2 rows in set (0.00 sec)

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +-------------------------------------------+
-- | DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') |
-- +-------------------------------------------+
-- | 11/11/1993 at 10:07                       |
-- | 12/25/1943 at 04:10                       |
-- +-------------------------------------------+
-- 2 rows in set (0.00 sec)







