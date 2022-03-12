 == BUAT DATABASES BARU =======

mysql> CREATE DATABASE tv_show_app;
-- mysql> SELECT DATABASE();
-- +-------------+
-- | DATABASE()  |
-- +-------------+
-- | tv_show_app |
-- +-------------+


-- CREATING THE REVIEWERS TABLE

CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- CREATING THE SERIES TABLE

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),                -- ===>> bisa pake YEAR(4), ini hanya Contoh.
    genre VARCHAR(100)
);

-- CREATING THE REVIEWS TABLE

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);
-- mysql> DESC reviews;
-- +-------------+--------------+------+-----+---------+----------------+
-- | Field       | Type         | Null | Key | Default | Extra          |
-- +-------------+--------------+------+-----+---------+----------------+
-- | id          | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | rating      | decimal(2,1) | YES  |     | NULL    |                |
-- | series_id   | int(11)      | YES  | MUL | NULL    |                |
-- | reviewer_id | int(11)      | YES  | MUL | NULL    |                |
-- +-------------+--------------+------+-----+---------+----------------+
-- 4 rows in set (0.00 sec)

-- INSERTING A BUNCH OF DATA

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

-- mysql> SELECT * FROM series;
-- +----+-----------------------+---------------+-----------+
-- | id | title                 | released_year | genre     |
-- +----+-----------------------+---------------+-----------+
-- |  1 | Archer                |          2009 | Animation |
-- |  2 | Arrested Development  |          2003 | Comedy    |
-- |  3 | Bob's Burgers         |          2011 | Animation |
-- |  4 | Bojack Horseman       |          2014 | Animation |
-- |  5 | Breaking Bad          |          2008 | Drama     |
-- |  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
-- |  7 | Fargo                 |          2014 | Drama     |
-- |  8 | Freaks and Geeks      |          1999 | Comedy    |
-- |  9 | General Hospital      |          1963 | Drama     |
-- | 10 | Halt and Catch Fire   |          2014 | Drama     |
-- | 11 | Malcolm In The Middle |          2000 | Comedy    |
-- | 12 | Pushing Daisies       |          2007 | Comedy    |
-- | 13 | Seinfeld              |          1989 | Comedy    |
-- | 14 | Stranger Things       |          2016 | Drama     |
-- +----+-----------------------+---------------+-----------+
-- 14 rows in set (0.00 sec)

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Mochi', 'Ramdhan'),
    ('Marlon', 'Crafford');.

-- mysql> SELECT * FROM reviewers;
-- +----+------------+-----------+
-- | id | first_name | last_name |
-- +----+------------+-----------+
-- |  1 | Thomas     | Stoneman  |
-- |  2 | Wyatt      | Skaggs    |
-- |  3 | Kimbra     | Masters   |
-- |  4 | Domingo    | Cortes    |
-- |  5 | Colt       | Steele    |
-- |  6 | Pinkie     | Petit     |
-- |  7 | Mochi      | Ramdhan   |
-- |  8 | Marlon     | Crafford  |
-- +----+------------+-----------+
-- 8 rows in set (0.00 sec)

INSERT INTO reviews (series_id, reviewer_id, rating)
  VALUES (1, 1, 8.0), (1, 2, 7.5), (1, 3, 8.5), (1, 4, 7.7), (1, 5, 8.9),
  (2, 1, 8.1), (2, 4, 6.0), (2, 3, 8.0), (2, 6, 8.4), (2, 5, 9.9),
  (3, 1, 7.0), (3, 6, 7.5), (3, 4, 8.0), (3, 3, 7.1), (3, 5, 8.0),
  (4, 1, 7.5), (4, 3, 7.8), (4, 4, 8.3), (4, 2, 7.6), (4, 5, 8.5),
  (5, 1, 9.5), (5, 3, 9.0), (5, 4, 9.1), (5, 2, 9.3), (5, 5, 9.9),
  (6, 2, 6.5), (6, 3, 7.8), (6, 4, 8.8), (6, 2, 8.4), (6, 5, 9.1),
  (7, 2, 9.1), (7, 5, 9.7),
  (8, 4, 8.5), (8, 2, 7.8), (8, 6, 8.8), (8, 5, 9.3),
  (9, 2, 5.5), (9, 3, 6.8), (9, 4, 5.8), (9, 6, 4.3), (9, 5, 4.5),
  (10, 5, 9.9),
  (13, 3, 8.0), (13, 4, 7.2),
  (14, 2, 8.5), (14, 3, 8.9), (14, 4, 8.9);

-- mysql> SELECT * FROM reviews;
-- +----+--------+-----------+-------------+
-- | id | rating | series_id | reviewer_id |
-- +----+--------+-----------+-------------+
-- |  1 |    8.0 |         1 |           1 |
-- |  2 |    7.5 |         1 |           2 |
-- |  3 |    8.5 |         1 |           3 |
-- |  4 |    7.7 |         1 |           4 |
-- |  5 |    8.9 |         1 |           5 |
-- |  6 |    8.1 |         2 |           1 |
-- |  7 |    6.0 |         2 |           4 |
-- |  8 |    8.0 |         2 |           3 |
-- |  9 |    8.4 |         2 |           6 |
-- | 10 |    9.9 |         2 |           5 |
-- | 11 |    7.0 |         3 |           1 |
-- | 12 |    7.5 |         3 |           6 |
-- | 13 |    8.0 |         3 |           4 |
-- | 14 |    7.1 |         3 |           3 |
-- | 15 |    8.0 |         3 |           5 |
-- | 16 |    7.5 |         4 |           1 |
-- | 17 |    7.8 |         4 |           3 |
-- | 18 |    8.3 |         4 |           4 |
-- | 19 |    7.6 |         4 |           2 |
-- | 20 |    8.5 |         4 |           5 |
-- | 21 |    9.5 |         5 |           1 |
-- | 22 |    9.0 |         5 |           3 |
-- | 23 |    9.1 |         5 |           4 |
-- | 24 |    9.3 |         5 |           2 |
-- | 25 |    9.9 |         5 |           5 |
-- | 26 |    6.5 |         6 |           2 |
-- | 27 |    7.8 |         6 |           3 |
-- | 28 |    8.8 |         6 |           4 |
-- | 29 |    8.4 |         6 |           2 |
-- | 30 |    9.1 |         6 |           5 |
-- | 31 |    9.1 |         7 |           2 |
-- | 32 |    9.7 |         7 |           5 |
-- | 33 |    8.5 |         8 |           4 |
-- | 34 |    7.8 |         8 |           2 |
-- | 35 |    8.8 |         8 |           6 |
-- | 36 |    9.3 |         8 |           5 |
-- | 37 |    5.5 |         9 |           2 |
-- | 38 |    6.8 |         9 |           3 |
-- | 39 |    5.8 |         9 |           4 |
-- | 40 |    4.3 |         9 |           6 |
-- | 41 |    4.5 |         9 |           5 |
-- | 42 |    9.9 |        10 |           5 |
-- | 43 |    8.0 |        13 |           3 |
-- | 44 |    7.2 |        13 |           4 |
-- | 45 |    8.5 |        14 |           2 |
-- | 46 |    8.9 |        14 |           3 |
-- | 47 |    8.9 |        14 |           4 |
-- +----+--------+-----------+-------------+
-- 47 rows in set (0.00 sec)

SELECT * FROM series;
SELECT  title, 
        genre,
        rating
FROM series
JOIN reviews 
    ON series.id = reviews.series_id;

-- ======================= CHALLANE TV SHOWS 1 ========================
SELECT 
    title,
    AVG(rating) AS avg_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
    GROUP BY series.id
    ORDER BY avg_rating
    ;
-- mysql> source Relationships/ReviewersMovies.sql
-- +----------------------+------------+
-- | title                | avg_rating |
-- +----------------------+------------+
-- | General Hospital     |    5.38000 |
-- | Bob's Burgers        |    7.52000 |
-- | Seinfeld             |    7.60000 |
-- | Bojack Horseman      |    7.94000 |
-- | Arrested Development |    8.08000 |
-- | Archer               |    8.12000 |
-- | Curb Your Enthusiasm |    8.12000 |
-- | Freaks and Geeks     |    8.60000 |
-- | Stranger Things      |    8.76667 |
-- | Breaking Bad         |    9.36000 |
-- | Fargo                |    9.40000 |
-- | Halt and Catch Fire  |    9.90000 |
-- +----------------------+------------+
-- 12 rows in set (0.00 sec)

-- ======================= CHALLANE TV SHOWS 2 ===========================

SELECT * FROM reviewers;
SELECT first_name,
        last_name,
        rating
FROM reviewers
JOIN reviews
    ON reviewers.id = reviews.reviewer_id;
                                                    ---=======DALAM HAL INI MASUK KE INNER JOIN DI MANA KONDISI BISA DI BULAK BALIK
SELECT
    first_name,
    last_name,
    rating
FROM reviews
INNER JOIN reviewers
    ON reviewers.id = reviews.reviewer_id;

-- mysql> source Relationships/ReviewersMovies.sql
-- +------------+-----------+--------+
-- | first_name | last_name | rating |
-- +------------+-----------+--------+
-- | Thomas     | Stoneman  |    8.0 |
-- | Thomas     | Stoneman  |    8.1 |
-- | Thomas     | Stoneman  |    7.0 |
-- | Thomas     | Stoneman  |    7.5 |
-- | Thomas     | Stoneman  |    9.5 |
-- | Wyatt      | Skaggs    |    7.5 |
-- | Wyatt      | Skaggs    |    7.6 |
-- | Wyatt      | Skaggs    |    9.3 |
-- | Wyatt      | Skaggs    |    6.5 |
-- | Wyatt      | Skaggs    |    8.4 |
-- | Wyatt      | Skaggs    |    9.1 |
-- | Wyatt      | Skaggs    |    7.8 |
-- | Wyatt      | Skaggs    |    5.5 |
-- | Wyatt      | Skaggs    |    8.5 |
-- | Kimbra     | Masters   |    8.5 |
-- | Kimbra     | Masters   |    8.0 |
-- | Kimbra     | Masters   |    7.1 |
-- | Kimbra     | Masters   |    7.8 |
-- | Kimbra     | Masters   |    9.0 |
-- | Kimbra     | Masters   |    7.8 |
-- | Kimbra     | Masters   |    6.8 |
-- | Kimbra     | Masters   |    8.0 |
-- | Kimbra     | Masters   |    8.9 |
-- | Domingo    | Cortes    |    7.7 |
-- | Domingo    | Cortes    |    6.0 |
-- | Domingo    | Cortes    |    8.0 |
-- | Domingo    | Cortes    |    8.3 |
-- | Domingo    | Cortes    |    9.1 |
-- | Domingo    | Cortes    |    8.8 |
-- | Domingo    | Cortes    |    8.5 |
-- | Domingo    | Cortes    |    5.8 |
-- | Domingo    | Cortes    |    7.2 |
-- | Domingo    | Cortes    |    8.9 |
-- | Colt       | Steele    |    8.9 |
-- | Colt       | Steele    |    9.9 |
-- | Colt       | Steele    |    8.0 |
-- | Colt       | Steele    |    8.5 |
-- | Colt       | Steele    |    9.9 |
-- | Colt       | Steele    |    9.1 |
-- | Colt       | Steele    |    9.7 |
-- | Colt       | Steele    |    9.3 |
-- | Colt       | Steele    |    4.5 |
-- | Colt       | Steele    |    9.9 |
-- | Pinkie     | Petit     |    8.4 |
-- | Pinkie     | Petit     |    7.5 |
-- | Pinkie     | Petit     |    8.8 |
-- | Pinkie     | Petit     |    4.3 |
-- +------------+-----------+--------+
-- 47 rows in set (0.00 sec)

-- ================================================================================

-- ==================== -- CHALLENGE 4 - UNREVIEWED SERIES -- ==================

SELECT * FROM series;

SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;

-- mysql> source Relationships/ReviewersMovies.sql;
-- +-----------------------+
-- | unreviewed_series     |
-- +-----------------------+
-- | Malcolm In The Middle |
-- | Pushing Daisies       |
-- +-----------------------+
-- 2 rows in set (0.00 sec)

-- =================================================================================

-- ===============================-- Challenge 5 - GENRE AVG RATINGS -- =========
SELECT 
        genre,
        ROUND(
            AVG(rating),
            2
        ) AS average_rating
FROM series 
INNER JOIN reviews
    ON series.id = reviews.series_id
GROUP BY genre; 

-- mysql> source Relationships/ReviewersMovies.sql;
-- +-----------+----------------+
-- | genre     | average_rating |
-- +-----------+----------------+
-- | Animation |           7.86 |
-- | Comedy    |           8.16 |
-- | Drama     |           8.04 |
-- +-----------+----------------+
-- 3 rows in set (0.00 sec)

 --================================================================================


-- ========================-- CHALLENGE 6 - Reviewer Stats -- ==========================
SELECT first_name,
        last_name,
        COUNT(rating) AS COUNT,
        IFNULL(MIN(rating), 0) AS MIN,
        IFNULL(MAX(rating), 0) AS MAX,
        ROUND(IFNULL(AVG(rating), 0), 2) AS AVERAGE,
        CASE
            WHEN COUNT(rating) >= 10 THEN 'SUPER USER'
            WHEN COUNT(rating) > 0 THEN 'ACTIVE'
            ELSE 'UNACTIVE'            
        END AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- mysql> source Relationships/ReviewersMovies.sql;
-- +------------+-----------+-------+-----+-----+---------+------------+
-- | first_name | last_name | COUNT | MIN | MAX | AVERAGE | STATUS     |
-- +------------+-----------+-------+-----+-----+---------+------------+
-- | Thomas     | Stoneman  |     5 | 7.0 | 9.5 |    8.02 | ACTIVE     |
-- | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 |    7.80 | ACTIVE     |
-- | Kimbra     | Masters   |     9 | 6.8 | 9.0 |    7.99 | ACTIVE     |
-- | Domingo    | Cortes    |    10 | 5.8 | 9.1 |    7.83 | SUPER USER |
-- | Pinkie     | Petit     |     4 | 4.3 | 8.8 |    7.25 | ACTIVE     |
-- | Colt       | Steele    |    10 | 4.5 | 9.9 |    8.77 | SUPER USER |
-- | Mochi      | Ramdhan   |     0 | 0.0 | 0.0 |    0.00 | UNACTIVE   |
-- | Marlon     | Crafford  |     0 | 0.0 | 0.0 |    0.00 | UNACTIVE   |
-- +------------+-----------+-------+-----+-----+---------+------------+
-- 8 rows in set (0.00 sec)

SELECT
  first_name,
  last_name,
  COUNT(rating) AS COUNT,
  Ifnull(MIN(rating), 0) AS MIN,
  Ifnull(MAX(rating), 0) AS MAX,
  ROUND(Ifnull(AVG(rating), 0), 2) AS AVG,
   IF(COUNT(rating) > 0, 'ACTIVE', 'UNACTIVE') AS STATUS
FROM reviewers
LEFT JOIN reviews
  ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;
-- mysql> source Relationships/ReviewersMovies.sql;
-- +------------+-----------+-------+-----+-----+------+----------+
-- | first_name | last_name | COUNT | MIN | MAX | AVG  | STATUS   |
-- +------------+-----------+-------+-----+-----+------+----------+
-- | Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02 | ACTIVE   |
-- | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80 | ACTIVE   |
-- | Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.99 | ACTIVE   |
-- | Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83 | ACTIVE   |
-- | Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77 | ACTIVE   |
-- | Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25 | ACTIVE   |
-- | Mochi      | Ramdhan   |     0 | 0.0 | 0.0 | 0.00 | UNACTIVE |
-- | Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00 | UNACTIVE |
-- +------------+-----------+-------+-----+-----+------+----------+
-- 8 rows in set (0.00 sec)

 -- =======================-- CHALLENGE 7 - 3 TABLES! --================
SELECT title,
        rating,
        CONCAT(first_name, ' ', last_name) AS 'Reviewers Name'
FROM reviewers
INNER JOIN reviews
    ON reviewers.id = reviews.reviewer_id
INNER JOIN series
    ON series.id = reviews.series_id
ORDER BY title
;
-- mysql> source Relationships/ReviewersMovies.sql;
-- +----------------------+--------+-----------------+
-- | title                | rating | Reviewers Name  |
-- +----------------------+--------+-----------------+
-- | Archer               |    7.7 | Domingo Cortes  |
-- | Archer               |    8.9 | Colt Steele     |
-- | Archer               |    8.0 | Thomas Stoneman |
-- | Archer               |    7.5 | Wyatt Skaggs    |
-- | Archer               |    8.5 | Kimbra Masters  |
-- | Arrested Development |    8.0 | Kimbra Masters  |
-- | Arrested Development |    8.4 | Pinkie Petit    |
-- | Arrested Development |    9.9 | Colt Steele     |
-- | Arrested Development |    8.1 | Thomas Stoneman |
-- | Arrested Development |    6.0 | Domingo Cortes  |
-- | Bob's Burgers        |    8.0 | Domingo Cortes  |
-- | Bob's Burgers        |    7.1 | Kimbra Masters  |
-- | Bob's Burgers        |    8.0 | Colt Steele     |
-- | Bob's Burgers        |    7.0 | Thomas Stoneman |
-- | Bob's Burgers        |    7.5 | Pinkie Petit    |
-- | Bojack Horseman      |    7.8 | Kimbra Masters  |
-- | Bojack Horseman      |    8.3 | Domingo Cortes  |
-- | Bojack Horseman      |    7.6 | Wyatt Skaggs    |
-- | Bojack Horseman      |    8.5 | Colt Steele     |
-- | Bojack Horseman      |    7.5 | Thomas Stoneman |
-- | Breaking Bad         |    9.0 | Kimbra Masters  |
-- | Breaking Bad         |    9.1 | Domingo Cortes  |
-- | Breaking Bad         |    9.3 | Wyatt Skaggs    |
-- | Breaking Bad         |    9.9 | Colt Steele     |
-- | Breaking Bad         |    9.5 | Thomas Stoneman |
-- | Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
-- | Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
-- | Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
-- | Curb Your Enthusiasm |    9.1 | Colt Steele     |
-- | Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
-- | Fargo                |    9.1 | Wyatt Skaggs    |
-- | Fargo                |    9.7 | Colt Steele     |
-- | Freaks and Geeks     |    9.3 | Colt Steele     |
-- | Freaks and Geeks     |    8.5 | Domingo Cortes  |
-- | Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
-- | Freaks and Geeks     |    8.8 | Pinkie Petit    |
-- | General Hospital     |    4.3 | Pinkie Petit    |
-- | General Hospital     |    4.5 | Colt Steele     |
-- | General Hospital     |    5.5 | Wyatt Skaggs    |
-- | General Hospital     |    6.8 | Kimbra Masters  |
-- | General Hospital     |    5.8 | Domingo Cortes  |
-- | Halt and Catch Fire  |    9.9 | Colt Steele     |
-- | Seinfeld             |    8.0 | Kimbra Masters  |
-- | Seinfeld             |    7.2 | Domingo Cortes  |
-- | Stranger Things      |    8.5 | Wyatt Skaggs    |
-- | Stranger Things      |    8.9 | Kimbra Masters  |
-- | Stranger Things      |    8.9 | Domingo Cortes  |
-- +----------------------+--------+-----------------+
-- 47 rows in set (0.01 sec)


