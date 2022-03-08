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

-- # ================================================ DATE ARITHMETIC ============================================================

-- # DATEDIFF()
-- # DATE_ADD()
-- # +/-

SELECT name, birthdate, DATEDIFF(CURRENT_DATE(), birthdate) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------+------------+-------------------------------------+
-- | name    | birthdate  | DATEDIFF(CURRENT_DATE(), birthdate) |
-- +---------+------------+-------------------------------------+
-- | Padma   | 1993-11-11 |                               10344 |
-- | Larry   | 1943-12-25 |                               28563 |
-- | Toaster | 2022-03-08 |                                   0 |
-- +---------+------------+-------------------------------------+
-- 3 rows in set (0.00 sec)

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------------------+-------------------------------------+
-- | birthdt             | DATE_ADD(birthdt, INTERVAL 1 MONTH) |
-- +---------------------+-------------------------------------+
-- | 1993-11-11 10:07:35 | 1993-12-11 10:07:35                 |
-- | 1943-12-25 04:10:42 | 1944-01-25 04:10:42                 |
-- | 2022-03-08 14:38:31 | 2022-04-08 14:38:31                 |
-- +---------------------+-------------------------------------+
-- 3 rows in set (0.00 sec)

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------------------+---------------------------------------+
-- | birthdt             | DATE_ADD(birthdt, INTERVAL 10 SECOND) |
-- +---------------------+---------------------------------------+
-- | 1993-11-11 10:07:35 | 1993-11-11 10:07:45                   |
-- | 1943-12-25 04:10:42 | 1943-12-25 04:10:52                   |
-- | 2022-03-08 14:38:31 | 2022-03-08 14:38:41                   |
-- +---------------------+---------------------------------------+
-- 3 rows in set (0.00 sec)

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------------------+---------------------------------------+
-- | birthdt             | DATE_ADD(birthdt, INTERVAL 3 QUARTER) |
-- +---------------------+---------------------------------------+
-- | 1993-11-11 10:07:35 | 1994-08-11 10:07:35                   |
-- | 1943-12-25 04:10:42 | 1944-09-25 04:10:42                   |
-- | 2022-03-08 14:38:31 | 2022-12-08 14:38:31                   |
-- +---------------------+---------------------------------------+
-- 3 rows in set (0.00 sec)

SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------------------+----------------------------+
-- | birthdt             | birthdt + INTERVAL 1 MONTH |
-- +---------------------+----------------------------+
-- | 1993-11-11 10:07:35 | 1993-12-11 10:07:35        |
-- | 1943-12-25 04:10:42 | 1944-01-25 04:10:42        |
-- | 2022-03-08 14:38:31 | 2022-04-08 14:38:31        |
-- +---------------------+----------------------------+
-- 3 rows in set (0.00 sec)

SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------------------+----------------------------+
-- | birthdt             | birthdt - INTERVAL 5 MONTH |
-- +---------------------+----------------------------+
-- | 1993-11-11 10:07:35 | 1993-06-11 10:07:35        |
-- | 1943-12-25 04:10:42 | 1943-07-25 04:10:42        |
-- | 2022-03-08 14:38:31 | 2021-10-08 14:38:31        |
-- +---------------------+----------------------------+
-- 3 rows in set (0.00 sec)

SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
-- mysql> source DATE_TIME/date.sql;
-- +---------------------+------------------------------------------------+
-- | birthdt             | birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR |
-- +---------------------+------------------------------------------------+
-- | 1993-11-11 10:07:35 | 1995-02-11 20:07:35                            |
-- | 1943-12-25 04:10:42 | 1945-03-25 14:10:42                            |
-- | 2022-03-08 14:38:31 | 2023-06-09 00:38:31                            |
-- +---------------------+------------------------------------------------+
-- 3 rows in set (0.00 sec)

--  ========================================= DATE TIME & TIMESTAMP =================================================================
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
-- mysql> DESC comments;
-- +------------+--------------+------+-----+-------------------+-------+
-- | Field      | Type         | Null | Key | Default           | Extra |
-- +------------+--------------+------+-----+-------------------+-------+
-- | content    | varchar(100) | YES  |     | NULL              |       |
-- | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |       |
-- +------------+--------------+------+-----+-------------------+-------+

INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');

-- mysql> SELECT * FROM comments;
-- +--------------------------+---------------------+
-- | content                  | created_at          |
-- +--------------------------+---------------------+
-- | lol what a funny article | 2022-03-08 21:18:36 |
-- | I found this offensive   | 2022-03-08 21:18:55 |
-- | Ifasfsadfsadfsad         | 2022-03-08 21:26:43 |
-- +--------------------------+---------------------+
-- 3 rows in set (0.00 sec)

SELECT * FROM comments ORDER BY created_at DESC;
-- mysql> source DATE_TIME/date.sql;
-- +--------------------------+---------------------+
-- | content                  | created_at          |
-- +--------------------------+---------------------+
-- | Ifasfsadfsadfsad         | 2022-03-08 21:26:43 |
-- | I found this offensive   | 2022-03-08 21:18:55 |
-- | lol what a funny article | 2022-03-08 21:18:36 |
-- +--------------------------+---------------------+
-- 3 rows in set (0.00 sec)

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
-- mysql> DESC comments2;
-- +------------+--------------+------+-----+-------------------+-----------------------------+
-- | Field      | Type         | Null | Key | Default           | Extra                       |
-- +------------+--------------+------+-----+-------------------+-----------------------------+
-- | content    | varchar(100) | YES  |     | NULL              |                             |
-- | changed_at | timestamp    | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
-- +------------+--------------+------+-----+-------------------+-----------------------------+
-- 2 rows in set (0.00 sec)

INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
-- mysql> source DATE_TIME/date.sql;
-- +----------------------+---------------------+
-- | content              | changed_at          |
-- +----------------------+---------------------+
-- | dasdasdasd           | 2022-03-08 21:33:56 |
-- | lololololo           | 2022-03-08 21:34:08 |
-- | I LIKE CATS AND DOGS | 2022-03-08 21:34:20 |
-- +----------------------+---------------------+
-- 3 rows in set (0.00 sec)

 UPDATE comments2 SET content = 'THIS IS NOT GIBBERISH' WHERE content = 'dasdasdasd';
-- mysql> SELECT * FROM comments2;
-- +-----------------------+---------------------+
-- | content               | changed_at          |
-- +-----------------------+---------------------+
-- | THIS IS NOT GIBBERISH | 2022-03-08 21:38:26 |
-- | lololololo            | 2022-03-08 21:34:08 |
-- | I LIKE CATS AND DOGS  | 2022-03-08 21:34:20 |
-- +-----------------------+---------------------+
-- 3 rows in set (0.00 sec)

SELECT * FROM comments2 ORDER BY changed_at DESC;
-- mysql> source DATE_TIME/date.sql;
-- +-----------------------+---------------------+
-- | content               | changed_at          |
-- +-----------------------+---------------------+
-- | THIS IS NOT GIBBERISH | 2022-03-08 21:38:26 |
-- | I LIKE CATS AND DOGS  | 2022-03-08 21:34:20 |
-- | lololololo            | 2022-03-08 21:34:08 |
-- +-----------------------+---------------------+
-- 3 rows in set (0.00 sec)

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);                                                                --QUERY INI JUGA BISA UNTUK MENGATUR PEMBUATAN TABLE YANG TIMESTAMP BERUBAH KETIKA DI UPDATE KE WAKTU SAAT INI







