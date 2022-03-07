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