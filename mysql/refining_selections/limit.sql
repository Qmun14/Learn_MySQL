SELECT title FROM books LIMIT 3;
-- mysql> source refining_selections/limit.sql;
-- +-----------------+
-- | title           |
-- +-----------------+
-- | The Namesake    |
-- | Norse Mythology |
-- | American Gods   |
-- +-----------------+
-- 3 rows in set (0.00 sec)

SELECT title FROM books LIMIT 1;
-- mysql> source refining_selections/limit.sql;
-- +--------------+
-- | title        |
-- +--------------+
-- | The Namesake |
-- +--------------+
-- 1 row in set (0.00 sec)

SELECT title FROM books LIMIT 10;
-- mysql> source refining_selections/limit.sql;
-- +-------------------------------------------+
-- | title                                     |
-- +-------------------------------------------+
-- | The Namesake                              |
-- | Norse Mythology                           |
-- | American Gods                             |
-- | Interpreter of Maladies                   |
-- | A Hologram for the King: A Novel          |
-- | The Circle                                |
-- | The Amazing Adventures of Kavalier & Clay |
-- | Just Kids                                 |
-- | A Heartbreaking Work of Staggering Genius |
-- | Coraline                                  |
-- +-------------------------------------------+
-- 10 rows in set (0.00 sec)

SELECT * FROM books LIMIT 1;
-- mysql> source refining_selections/limit.sql;
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title        | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- |       1 | The Namesake | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- 1 row in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;
-- mysql> source refining_selections/limit.sql;
-- +----------------------------------+---------------+
-- | title                            | released_year |
-- +----------------------------------+---------------+
-- | Lincoln In The Bardo             |          2017 |
-- | Norse Mythology                  |          2016 |
-- | 10% Happier                      |          2014 |
-- | The Circle                       |          2013 |
-- | A Hologram for the King: A Novel |          2012 |
-- +----------------------------------+---------------+
-- 5 rows in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;
-- mysql> source refining_selections/limit.sql;
-- +----------------------+---------------+
-- | title                | released_year |
-- +----------------------+---------------+
-- | Lincoln In The Bardo |          2017 |
-- +----------------------+---------------+
-- 1 row in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;
-- mysql> source refining_selections/limit.sql;
-- +-------------------------------------------+---------------+
-- | title                                     | released_year |
-- +-------------------------------------------+---------------+
-- | Lincoln In The Bardo                      |          2017 |
-- | Norse Mythology                           |          2016 |
-- | 10% Happier                               |          2014 |
-- | The Circle                                |          2013 |
-- | A Hologram for the King: A Novel          |          2012 |
-- | Just Kids                                 |          2010 |
-- | Consider the Lobster                      |          2005 |
-- | Oblivion: Stories                         |          2004 |
-- | The Namesake                              |          2003 |
-- | Coraline                                  |          2003 |
-- | American Gods                             |          2001 |
-- | A Heartbreaking Work of Staggering Genius |          2001 |
-- | fake_book                                 |          2001 |
-- | The Amazing Adventures of Kavalier & Clay |          2000 |
-- +-------------------------------------------+---------------+
-- 14 rows in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0, 5; -- MAKSUDNYA dari record/row 0 atau awal sebanyak 5 record/row --
-- mysql> source refining_selections/limit.sql;
-- +----------------------------------+---------------+
-- | title                            | released_year |
-- +----------------------------------+---------------+
-- | Lincoln In The Bardo             |          2017 |
-- | Norse Mythology                  |          2016 |
-- | 10% Happier                      |          2014 |
-- | The Circle                       |          2013 |
-- | A Hologram for the King: A Novel |          2012 |
-- +----------------------------------+---------------+
-- 5 rows in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0, 3;
-- mysql> source refining_selections/limit.sql;
-- +----------------------+---------------+
-- | title                | released_year |
-- +----------------------+---------------+
-- | Lincoln In The Bardo |          2017 |
-- | Norse Mythology      |          2016 |
-- | 10% Happier          |          2014 |
-- +----------------------+---------------+
-- 3 rows in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1, 3;
-- mysql> source refining_selections/limit.sql;
-- +-----------------+---------------+
-- | title           | released_year |
-- +-----------------+---------------+
-- | Norse Mythology |          2016 |
-- | 10% Happier     |          2014 |
-- | The Circle      |          2013 |
-- +-----------------+---------------+
-- 3 rows in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10, 1;
-- mysql> source refining_selections/limit.sql;
-- +---------------+---------------+
-- | title         | released_year |
-- +---------------+---------------+
-- | American Gods |          2001 |
-- +---------------+---------------+
-- 1 row in set (0.00)

SELECT * FROM tbl LIMIT 95,18446744073709551615;

SELECT title FROM books LIMIT 5;
-- mysql> source refining_selections/limit.sql;
-- +----------------------------------+
-- | title                            |
-- +----------------------------------+
-- | The Namesake                     |
-- | Norse Mythology                  |
-- | American Gods                    |
-- | Interpreter of Maladies          |
-- | A Hologram for the King: A Novel |
-- +----------------------------------+
-- 5 rows in set (0.00 sec)

SELECT title FROM books LIMIT 5, 123219476457;  --MAKSUDNYA tampilkan dari row ke 6 sampai row terakhir dalam tabel--
-- mysql> source refining_selections/limit.sql;
-- +-----------------------------------------------------+
-- | title                                               |
-- +-----------------------------------------------------+
-- | The Circle                                          |
-- | The Amazing Adventures of Kavalier & Clay           |
-- | Just Kids                                           |
-- | A Heartbreaking Work of Staggering Genius           |
-- | Coraline                                            |
-- | What We Talk About When We Talk About Love: Stories |
-- | Where I'm Calling From: Selected Stories            |
-- | White Noise                                         |
-- | Cannery Row                                         |
-- | Oblivion: Stories                                   |
-- | Consider the Lobster                                |
-- | 10% Happier                                         |
-- | fake_book                                           |
-- | Lincoln In The Bardo                                |
-- +-----------------------------------------------------+
-- 14 rows in set (0.00 sec)




