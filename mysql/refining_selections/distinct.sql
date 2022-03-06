# SELECT * FROM books;

-- mysql> source refining_selections/distinct.sql;
-- +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
-- | book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
-- +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
-- |       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
-- |       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
-- |       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
-- |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
-- |       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
-- |       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
-- |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
-- |       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
-- |       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
-- |      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
-- |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
-- |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
-- |      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
-- |      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
-- |      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
-- |      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
-- |      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
-- |      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
-- |      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
-- +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
-- 19 rows in set (0.00 sec)


# SELECT DISTINCT(CONCAT(author_fname, ' ', author_lname)) FROM books;

-- mysql> source refining_selections/distinct.sql;
-- +-------------------------------------------+
-- | (CONCAT(author_fname, ' ', author_lname)) |
-- +-------------------------------------------+
-- | Jhumpa Lahiri                             |
-- | Neil Gaiman                               |
-- | Dave Eggers                               |
-- | Michael Chabon                            |
-- | Patti Smith                               |
-- | Raymond Carver                            |
-- | Don DeLillo                               |
-- | John Steinbeck                            |
-- | David Foster Wallace                      |
-- | Dan Harris                                |
-- | Freida Harris                             |
-- | George Saunders                           |
-- +-------------------------------------------+
-- 12 rows in set (0.00 sec)


SELECT DISTINCT author_fname, author_lname FROM books;

-- mysql> source refining_selections/distinct.sql;
-- +--------------+----------------+
-- | author_fname | author_lname   |
-- +--------------+----------------+
-- | Jhumpa       | Lahiri         |
-- | Neil         | Gaiman         |
-- | Dave         | Eggers         |
-- | Michael      | Chabon         |
-- | Patti        | Smith          |
-- | Raymond      | Carver         |
-- | Don          | DeLillo        |
-- | John         | Steinbeck      |
-- | David        | Foster Wallace |
-- | Dan          | Harris         |
-- | Freida       | Harris         |
-- | George       | Saunders       |
-- +--------------+----------------+
-- 12 rows in set (0.00 sec)`