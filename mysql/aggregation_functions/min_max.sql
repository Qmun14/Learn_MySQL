SELECT MIN(stock_quantity) FROM books;
-- mysql> source aggregation_functions/min_max.sql;
-- +---------------------+
-- | MIN(stock_quantity) |
-- +---------------------+
-- |                  12 |
-- +---------------------+
-- 1 row in set (0.00 sec)

SELECT MIN(released_year) FROM books;
-- mysql> source aggregation_functions/min_max.sql;
-- +--------------------+
-- | MIN(released_year) |
-- +--------------------+
-- |               1945 |
-- +--------------------+
-- 1 row in set (0.00 sec)

SELECT MAX(stock_quantity) FROM books;
-- mysql> source aggregation_functions/min_max.sql;
-- +---------------------+
-- | MAX(stock_quantity) |
-- +---------------------+
-- |                1000 |
-- +---------------------+
-- 1 row in set (0.00 sec)

SELECT MAX(released_year) FROM books;
-- mysql> source aggregation_functions/min_max.sql;
-- +--------------------+
-- | MAX(released_year) |
-- +--------------------+
-- |               2017 |
-- +--------------------+
-- 1 row in set (0.00 sec)

SELECT MAX(pages), title FROM books; --ini salah
-- mysql> source aggregation_functions/min_max.sql;
-- +------------+--------------+
-- | MAX(pages) | title        |
-- +------------+--------------+
-- |        634 | The Namesake |
-- +------------+--------------+
-- 1 row in set (0.00 sec)

SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books); --#inI BISA TAPI LEBIH LAMBAT KARENA MELAKUKAN DUA QUERI DALAM SATU PERINTAH
-- mysql> source aggregation_functions/min_max.sql;
-- +-------------------------------------------+-------+
-- | title                                     | pages |
-- +-------------------------------------------+-------+
-- | The Amazing Adventures of Kavalier & Clay |   634 |
-- +-------------------------------------------+-------+
-- 1 row in set (0.00 sec)

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1; --#INI BISA DIPERTIMBANGKAN LEBIH CEPAT QUERY NYA
-- mysql> source aggregation_functions/min_max.sql;
-- +-------------------------------------------+-------+
-- | title                                     | pages |
-- +-------------------------------------------+-------+
-- | The Amazing Adventures of Kavalier & Clay |   634 |
-- +-------------------------------------------+-------+
-- 1 row in set (0.00 sec)

-- # =============================================================================================================================================

SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
-- mysql> source aggregation_functions/min_max.sql;
-- +--------------+----------------+--------------------+
-- | author_fname | author_lname   | MIN(released_year) |
-- +--------------+----------------+--------------------+
-- | Raymond      | Carver         |               1981 |
-- | Michael      | Chabon         |               2000 |
-- | Don          | DeLillo        |               1985 |
-- | Dave         | Eggers         |               2001 |
-- | David        | Foster Wallace |               2004 |
-- | Neil         | Gaiman         |               2001 |
-- | Dan          | Harris         |               2014 |
-- | Freida       | Harris         |               2001 |
-- | Jhumpa       | Lahiri         |               1996 |
-- | George       | Saunders       |               2017 |
-- | Patti        | Smith          |               2010 |
-- | John         | Steinbeck      |               1945 |
-- +--------------+----------------+--------------------+
-- 12 rows in set (0.00 sec)

SELECT
  author_fname,
  author_lname,
  MAX(pages)
FROM books
GROUP BY author_lname,
         author_fname;
-- mysql> source aggregation_functions/min_max.sql;
-- +--------------+----------------+------------+
-- | author_fname | author_lname   | MAX(pages) |
-- +--------------+----------------+------------+
-- | Raymond      | Carver         |        526 |
-- | Michael      | Chabon         |        634 |
-- | Don          | DeLillo        |        320 |
-- | Dave         | Eggers         |        504 |
-- | David        | Foster Wallace |        343 |
-- | Neil         | Gaiman         |        465 |
-- | Dan          | Harris         |        256 |
-- | Freida       | Harris         |        428 |
-- | Jhumpa       | Lahiri         |        291 |
-- | George       | Saunders       |        367 |
-- | Patti        | Smith          |        304 |
-- | John         | Steinbeck      |        181 |
-- +--------------+----------------+------------+
-- 12 rows in set (0.00 sec)

SELECT
  CONCAT(
  author_fname, ' ',
  author_lname) AS author,
  MAX(pages) AS 'longest Book'
FROM books
GROUP BY author_lname,
         author_fname;
-- mysql> source aggregation_functions/min_max.sql;
-- +----------------------+--------------+
-- | author               | longest Book |
-- +----------------------+--------------+
-- | Raymond Carver       |          526 |
-- | Michael Chabon       |          634 |
-- | Don DeLillo          |          320 |
-- | Dave Eggers          |          504 |
-- | David Foster Wallace |          343 |
-- | Neil Gaiman          |          465 |
-- | Dan Harris           |          256 |
-- | Freida Harris        |          428 |
-- | Jhumpa Lahiri        |          291 |
-- | George Saunders      |          367 |
-- | Patti Smith          |          304 |
-- | John Steinbeck       |          181 |
-- +----------------------+--------------+
-- 12 rows in set (0.00 sec)
