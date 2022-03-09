SELECT
     title,
     released_year,
     CASE
          WHEN released_year >= 2000 THEN 'Modern Lit'
          ELSE '20th Century Lit'
     END AS GENRE
FROM books;
-- mysql> source Logical Operators/Case_statements.sql;
-- +-----------------------------------------------------+---------------+------------------+
-- | title                                               | released_year | GENRE            |
-- +-----------------------------------------------------+---------------+------------------+
-- | The Namesake                                        |          2003 | Modern Lit       |
-- | Norse Mythology                                     |          2016 | Modern Lit       |
-- | American Gods                                       |          2001 | Modern Lit       |
-- | Interpreter of Maladies                             |          1996 | 20th Century Lit |
-- | A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
-- | The Circle                                          |          2013 | Modern Lit       |
-- | The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
-- | Just Kids                                           |          2010 | Modern Lit       |
-- | A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
-- | Coraline                                            |          2003 | Modern Lit       |
-- | What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
-- | Where I'm Calling From: Selected Stories            |          1989 | 20th Century Lit |
-- | White Noise                                         |          1985 | 20th Century Lit |
-- | Cannery Row                                         |          1945 | 20th Century Lit |
-- | Oblivion: Stories                                   |          2004 | Modern Lit       |
-- | Consider the Lobster                                |          2005 | Modern Lit       |
-- | 10% Happier                                         |          2014 | Modern Lit       |
-- | fake_book                                           |          2001 | Modern Lit       |
-- | Lincoln In The Bardo                                |          2017 | Modern Lit       |
-- +-----------------------------------------------------+---------------+------------------+
-- 19 rows in set (0.00 sec)

SELECT
     title,
     stock_quantity,
     CASE
          WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
          WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
          ELSE '***'
     END AS STOCK
FROM books;
-- mysql> source Logical Operators/Case_statements.sql;
-- +-----------------------------------------------------+----------------+-------+
-- | title                                               | stock_quantity | STOCK |
-- +-----------------------------------------------------+----------------+-------+
-- | The Namesake                                        |             32 | *     |
-- | Norse Mythology                                     |             43 | *     |
-- | American Gods                                       |             12 | *     |
-- | Interpreter of Maladies                             |             97 | **    |
-- | A Hologram for the King: A Novel                    |            154 | ***   |
-- | The Circle                                          |             26 | *     |
-- | The Amazing Adventures of Kavalier & Clay           |             68 | **    |
-- | Just Kids                                           |             55 | **    |
-- | A Heartbreaking Work of Staggering Genius           |            104 | ***   |
-- | Coraline                                            |            100 | **    |
-- | What We Talk About When We Talk About Love: Stories |             23 | *     |
-- | Where I'm Calling From: Selected Stories            |             12 | *     |
-- | White Noise                                         |             49 | *     |
-- | Cannery Row                                         |             95 | **    |
-- | Oblivion: Stories                                   |            172 | ***   |
-- | Consider the Lobster                                |             92 | **    |
-- | 10% Happier                                         |             29 | *     |
-- | fake_book                                           |            287 | ***   |
-- | Lincoln In The Bardo                                |           1000 | ***   |
-- +-----------------------------------------------------+----------------+-------+
-- 19 rows in set (0.00 sec)

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
-- mysql> source Logical Operators/Case_statements.sql;
-- +-----------------------------------------------------+----------------+-------+
-- | title                                               | stock_quantity | STOCK |
-- +-----------------------------------------------------+----------------+-------+
-- | The Namesake                                        |             32 | *     |
-- | Norse Mythology                                     |             43 | *     |
-- | American Gods                                       |             12 | *     |
-- | Interpreter of Maladies                             |             97 | **    |
-- | A Hologram for the King: A Novel                    |            154 | ****  |
-- | The Circle                                          |             26 | *     |
-- | The Amazing Adventures of Kavalier & Clay           |             68 | **    |
-- | Just Kids                                           |             55 | **    |
-- | A Heartbreaking Work of Staggering Genius           |            104 | ***   |
-- | Coraline                                            |            100 | **    |
-- | What We Talk About When We Talk About Love: Stories |             23 | *     |
-- | Where I'm Calling From: Selected Stories            |             12 | *     |
-- | White Noise                                         |             49 | *     |
-- | Cannery Row                                         |             95 | **    |
-- | Oblivion: Stories                                   |            172 | ****  |
-- | Consider the Lobster                                |             92 | **    |
-- | 10% Happier                                         |             29 | *     |
-- | fake_book                                           |            287 | ****  |
-- | Lincoln In The Bardo                                |           1000 | ****  |
-- +-----------------------------------------------------+----------------+-------+
-- 19 rows in set (0.00 sec)

SELECT
     title,
     stock_quantity,
     CASE
          WHEN stock_quantity <= 50 THEN '*'
          WHEN stock_quantity <= 100 THEN '**'
          ELSE '***'
     END AS STOCK
FROM books;
-- # mysql> source Logical Operators/Case_statements.sql;                           <<--- INI LOGIC PALING SIMPLE CODING NYA
-- # +-----------------------------------------------------+----------------+-------+
-- # | title                                               | stock_quantity | STOCK |
-- # +-----------------------------------------------------+----------------+-------+
-- # | The Namesake                                        |             32 | *     |
-- # | Norse Mythology                                     |             43 | *     |
-- # | American Gods                                       |             12 | *     |
-- # | Interpreter of Maladies                             |             97 | **    |
-- # | A Hologram for the King: A Novel                    |            154 | ***   |
-- # | The Circle                                          |             26 | *     |
-- # | The Amazing Adventures of Kavalier & Clay           |             68 | **    |
-- # | Just Kids                                           |             55 | **    |
-- # | A Heartbreaking Work of Staggering Genius           |            104 | ***   |
-- # | Coraline                                            |            100 | **    |
-- # | What We Talk About When We Talk About Love: Stories |             23 | *     |
-- # | Where I'm Calling From: Selected Stories            |             12 | *     |
-- # | White Noise                                         |             49 | *     |
-- # | Cannery Row                                         |             95 | **    |
-- # | Oblivion: Stories                                   |            172 | ***   |
-- # | Consider the Lobster                                |             92 | **    |
-- # | 10% Happier                                         |             29 | *     |
-- # | fake_book                                           |            287 | ***   |
-- # | Lincoln In The Bardo                                |           1000 | ***   |
-- # +-----------------------------------------------------+----------------+-------+
-- # 19 rows in set (0.00 sec)