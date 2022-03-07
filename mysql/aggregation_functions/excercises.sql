 -- Print the number of books in the database

SELECT COUNT(title) FROM books;
-- mysql> source aggregation_functions/excercises.sql;
-- +--------------+
-- | COUNT(title) |
-- +--------------+
-- |           19 |
-- +--------------+
-- 1 row in set (0.00 sec)


-- Print out how many books were released in each year

SELECT released_year, SUM(stock_quantity) FROM books GROUP BY released_year ORDER BY released_year ASC;
-- mysql> source aggregation_functions/excercises.sql;
-- +---------------+---------------------+
-- | released_year | SUM(stock_quantity) |
-- +---------------+---------------------+
-- |          1945 |                  95 |
-- |          1981 |                  23 |
-- |          1985 |                  49 |
-- |          1989 |                  12 |
-- |          1996 |                  97 |
-- |          2000 |                  68 |
-- |          2001 |                 403 |
-- |          2003 |                 132 |
-- |          2004 |                 172 |
-- |          2005 |                  92 |
-- |          2010 |                  55 |
-- |          2012 |                 154 |
-- |          2013 |                  26 |
-- |          2014 |                  29 |
-- |          2016 |                  43 |
-- |          2017 |                1000 |
-- +---------------+---------------------+
-- 16 rows in set (0.00 sec)


-- Print out the total number of books in stock

SELECT SUM(stock_quantity) AS 'Number of Books'FROM books;
-- mysql> source aggregation_functions/excercises.sql;
-- +-----------------+
-- | Number of Books |
-- +-----------------+
-- |            2450 |
-- +-----------------+
-- 1 row in set (0.00 sec)


-- Find the average released_year for each author

SELECT AVG(released_year), CONCAT(author_fname, ' ', author_lname) FROM books GROUP BY author_lname, author_lname;
-- mysql> source aggregation_functions/excercises.sql;
-- +--------------------+-----------------------------------------+
-- | AVG(released_year) | CONCAT(author_fname, ' ', author_lname) |
-- +--------------------+-----------------------------------------+
-- |          1985.0000 | Raymond Carver                          |
-- |          2000.0000 | Michael Chabon                          |
-- |          1985.0000 | Don DeLillo                             |
-- |          2008.6667 | Dave Eggers                             |
-- |          2004.5000 | David Foster Wallace                    |
-- |          2006.6667 | Neil Gaiman                             |
-- |          2007.5000 | Dan Harris                              |
-- |          1999.5000 | Jhumpa Lahiri                           |
-- |          2017.0000 | George Saunders                         |
-- |          2010.0000 | Patti Smith                             |
-- |          1945.0000 | John Steinbeck                          |
-- +--------------------+-----------------------------------------+
-- 11 rows in set (0.00 sec)


-- # Find the full name of the author who wrote the longest book

SELECT CONCAT(author_fname, ' ', author_lname) AS 'Full Name', pages AS 'Longest Book' FROM books ORDER BY pages DESC LIMIT 1;
-- mysql> source aggregation_functions/excercises.sql;
-- +----------------+--------------+
-- | Full Name      | Longest Book |
-- +----------------+--------------+
-- | Michael Chabon |          634 |
-- +----------------+--------------+
-- 1 row in set (0.00 sec)


-- # Make This Happen
-- # +------+---------+-----------+
-- # | year | # books | avg pages |
-- # +------+---------+-----------+
-- # | 1945 |       1 |  181.0000 |
-- # | 1981 |       1 |  176.0000 |
-- # | 1985 |       1 |  320.0000 |
-- # | 1989 |       1 |  526.0000 |
-- # | 1996 |       1 |  198.0000 |
-- # | 2000 |       1 |  634.0000 |
-- # | 2001 |       3 |  443.3333 |
-- # | 2003 |       2 |  249.5000 |
-- # | 2004 |       1 |  329.0000 |
-- # | 2005 |       1 |  343.0000 |
-- # | 2010 |       1 |  304.0000 |
-- # | 2012 |       1 |  352.0000 |
-- # | 2013 |       1 |  504.0000 |
-- # | 2014 |       1 |  256.0000 |
-- # | 2016 |       1 |  304.0000 |
-- # | 2017 |       1 |  367.0000 |
-- # +------+---------+-----------+

-- ANSWER CODE : 

SELECT
  released_year AS year,
  COUNT(released_year) AS '# books',
  AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;

