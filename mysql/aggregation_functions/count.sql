SELECT COUNT(*) FROM books;
-- mysql> source aggregation_functions/count.sql;
-- +----------+
-- | COUNT(*) |
-- +----------+
-- |       19 |
-- +----------+
-- 1 row in set (0.00 sec)

SELECT COUNT(author_fname) FROM books;
-- mysql> source aggregation_functions/count.sql;
-- +---------------------+
-- | COUNT(author_fname) |
-- +---------------------+
-- |                  19 |
-- +---------------------+
-- 1 row in set (0.00 sec)

SELECT COUNT(DISTINCT author_fname) FROM books;
-- mysql> source aggregation_functions/count.sql;
-- +------------------------------+
-- | COUNT(DISTINCT author_fname) |
-- +------------------------------+
-- |                           12 |
-- +------------------------------+
-- 1 row in set (0.00 sec)

SELECT COUNT(DISTINCT author_lname) FROM books;
-- mysql> source aggregation_functions/count.sql;
-- +------------------------------+
-- | COUNT(DISTINCT author_lname) |
-- +------------------------------+
-- |                           11 |
-- +------------------------------+
-- 1 row in set (0.01 sec)

SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
-- mysql> source aggregation_functions/count.sql;
-- +--------------------------------------------+
-- | COUNT(DISTINCT author_lname, author_fname) |
-- +--------------------------------------------+
-- |                                         12 |
-- +--------------------------------------------+
-- 1 row in set (0.00 sec)

SELECT title FROM books WHERE title LIKE '%the%';
-- mysql> source aggregation_functions/count.sql;
-- +-------------------------------------------+
-- | title                                     |
-- +-------------------------------------------+
-- | The Namesake                              |
-- | A Hologram for the King: A Novel          |
-- | The Circle                                |
-- | The Amazing Adventures of Kavalier & Clay |
-- | Consider the Lobster                      |
-- | Lincoln In The Bardo                      |
-- +-------------------------------------------+
-- 6 rows in set (0.00 sec)

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
-- mysql> source aggregation_functions/count.sql;
-- +----------+
-- | COUNT(*) |
-- +----------+
-- |        6 |
-- +----------+
-- 1 row in set (0.00 sec)

SELECT
  CONCAT(' In year ', released_year, ' ', COUNT(*), ' book(s) released') AS 'List Year Relseased'
FROM books
GROUP BY released_year;
-- mysql> mysql> source aggregation_functions/count.sql;
-- +----------------------------------+
-- | List Year Relseased              |
-- +----------------------------------+
-- |  In year 1945 1 book(s) released |
-- |  In year 1981 1 book(s) released |
-- |  In year 1985 1 book(s) released |
-- |  In year 1989 1 book(s) released |
-- |  In year 1996 1 book(s) released |
-- |  In year 2000 1 book(s) released |
-- |  In year 2001 3 book(s) released |
-- |  In year 2003 2 book(s) released |
-- |  In year 2004 1 book(s) released |
-- |  In year 2005 1 book(s) released |
-- |  In year 2010 1 book(s) released |
-- |  In year 2012 1 book(s) released |
-- |  In year 2013 1 book(s) released |
-- |  In year 2014 1 book(s) released |
-- |  In year 2016 1 book(s) released |
-- |  In year 2017 1 book(s) released |
-- +----------------------------------+
-- 16 rows in set (0.00 sec)