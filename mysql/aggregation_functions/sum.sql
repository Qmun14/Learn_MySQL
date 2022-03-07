SELECT author_fname, author_lname, pages FROM books;
-- mysql> source aggregation_functions/sum.sql;
-- +--------------+----------------+-------+
-- | author_fname | author_lname   | pages |
-- +--------------+----------------+-------+
-- | Jhumpa       | Lahiri         |   291 |
-- | Neil         | Gaiman         |   304 |
-- | Neil         | Gaiman         |   465 |
-- | Jhumpa       | Lahiri         |   198 |
-- | Dave         | Eggers         |   352 |
-- | Dave         | Eggers         |   504 |
-- | Michael      | Chabon         |   634 |
-- | Patti        | Smith          |   304 |
-- | Dave         | Eggers         |   437 |
-- | Neil         | Gaiman         |   208 |
-- | Raymond      | Carver         |   176 |
-- | Raymond      | Carver         |   526 |
-- | Don          | DeLillo        |   320 |
-- | John         | Steinbeck      |   181 |
-- | David        | Foster Wallace |   329 |
-- | David        | Foster Wallace |   343 |
-- | Dan          | Harris         |   256 |
-- | Freida       | Harris         |   428 |
-- | George       | Saunders       |   367 |
-- +--------------+----------------+-------+
-- 19 rows in set (0.00 sec)

SELECT SUM(pages) FROM books;.
-- mysql> mysql> source aggregation_functions/sum.sql;
-- +------------+
-- | SUM(pages) |
-- +------------+
-- |       6623 |
-- +------------+
-- 1 row in set (0.00 sec)

SELECT SUM(released_year) FROM books;
-- mysql> source aggregation_functions/sum.sql;
-- +--------------------+
-- | SUM(released_year) |
-- +--------------------+
-- |              37996 |
-- +--------------------+
-- 1 row in set (0.00 sec)

SELECT
  author_fname,
  author_lname,
  SUM(pages)
FROM books
GROUP BY author_lname,
         author_fname;
-- mysql> source aggregation_functions/sum.sql;
-- +--------------+----------------+------------+
-- | author_fname | author_lname   | SUM(pages) |
-- +--------------+----------------+------------+
-- | Raymond      | Carver         |        702 |
-- | Michael      | Chabon         |        634 |
-- | Don          | DeLillo        |        320 |
-- | Dave         | Eggers         |       1293 |
-- | David        | Foster Wallace |        672 |
-- | Neil         | Gaiman         |        977 |
-- | Dan          | Harris         |        256 |
-- | Freida       | Harris         |        428 |
-- | Jhumpa       | Lahiri         |        489 |
-- | George       | Saunders       |        367 |
-- | Patti        | Smith          |        304 |
-- | John         | Steinbeck      |        181 |
-- +--------------+----------------+------------+
-- 12 rows in set (0.00 sec)

SELECT
  author_fname,
  author_lname,
  SUM(released_year)
FROM books
GROUP BY author_lname,
         author_fname;
-- mysql> source aggregation_functions/sum.sql;
-- +--------------+----------------+--------------------+
-- | author_fname | author_lname   | SUM(released_year) |
-- +--------------+----------------+--------------------+
-- | Raymond      | Carver         |               3970 |
-- | Michael      | Chabon         |               2000 |
-- | Don          | DeLillo        |               1985 |
-- | Dave         | Eggers         |               6026 |
-- | David        | Foster Wallace |               4009 |
-- | Neil         | Gaiman         |               6020 |
-- | Dan          | Harris         |               2014 |
-- | Freida       | Harris         |               2001 |
-- | Jhumpa       | Lahiri         |               3999 |
-- | George       | Saunders       |               2017 |
-- | Patti        | Smith          |               2010 |
-- | John         | Steinbeck      |               1945 |
-- +--------------+----------------+--------------------+
-- 12 rows in set (0.00 sec)