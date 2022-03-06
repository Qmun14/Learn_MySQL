SELECT author_fname FROM books WHERE author_fname LIKE '%da%';
-- mysql> source refining_selections/like.sql;
-- +--------------+
-- | author_fname |
-- +--------------+
-- | Dave         |
-- | Dave         |
-- | Dave         |
-- | David        |
-- | David        |
-- | Dan          |
-- | Freida       |
-- +--------------+
-- 7 rows in set (0.01 sec)

SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
-- mysql> source refining_selections/like.sql;
-- +-------------------------------------------+--------------+
-- | title                                     | author_fname |
-- +-------------------------------------------+--------------+
-- | A Hologram for the King: A Novel          | Dave         |
-- | The Circle                                | Dave         |
-- | A Heartbreaking Work of Staggering Genius | Dave         |
-- | Oblivion: Stories                         | David        |
-- | Consider the Lobster                      | David        |
-- | 10% Happier                               | Dan          |
-- +-------------------------------------------+--------------+
-- 6 rows in set (0.00 sec)

SELECT title FROM books WHERE  title LIKE '%the';
-- mysql> source refining_selections/like.sql;
-- Empty set (0.00 sec)

SELECT title FROM books WHERE title LIKE '%the%';
-- mysql> source refining_selections/like.sql;
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

-- ========================================================================================================================
-- ========================================================================================================================

SELECT title, stock_quantity FROM books;
-- mysql> source refining_selections/like.sql;
-- +-----------------------------------------------------+----------------+
-- | title                                               | stock_quantity |
-- +-----------------------------------------------------+----------------+
-- | The Namesake                                        |             32 |
-- | Norse Mythology                                     |             43 |
-- | American Gods                                       |             12 |
-- | Interpreter of Maladies                             |             97 |
-- | A Hologram for the King: A Novel                    |            154 |
-- | The Circle                                          |             26 |
-- | The Amazing Adventures of Kavalier & Clay           |             68 |
-- | Just Kids                                           |             55 |
-- | A Heartbreaking Work of Staggering Genius           |            104 |
-- | Coraline                                            |            100 |
-- | What We Talk About When We Talk About Love: Stories |             23 |
-- | Where I'm Calling From: Selected Stories            |             12 |
-- | White Noise                                         |             49 |
-- | Cannery Row                                         |             95 |
-- | Oblivion: Stories                                   |            172 |
-- | Consider the Lobster                                |             92 |
-- | 10% Happier                                         |             29 |
-- | fake_book                                           |            287 |
-- | Lincoln In The Bardo                                |           1000 |
-- +-----------------------------------------------------+----------------+
-- 19 rows in set (0.00 sec)

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____'; --MAKSUDNYA untuk mengetahui jumlah karakter spesifik pada tabel --
mysql> mysql> source refining_selections/like.sql;
-- +----------------------+----------------+
-- | title                | stock_quantity |
-- +----------------------+----------------+
-- | Lincoln In The Bardo |           1000 |
-- +----------------------+----------------+
-- 1 row in set (0.01 sec)

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
-- mysql> source refining_selections/like.sql;
-- +-----------------------------------------------------+----------------+
-- | title                                               | stock_quantity |
-- +-----------------------------------------------------+----------------+
-- | The Namesake                                        |             32 |
-- | Norse Mythology                                     |             43 |
-- | American Gods                                       |             12 |
-- | Interpreter of Maladies                             |             97 |
-- | The Circle                                          |             26 |
-- | The Amazing Adventures of Kavalier & Clay           |             68 |
-- | Just Kids                                           |             55 |
-- | What We Talk About When We Talk About Love: Stories |             23 |
-- | Where I'm Calling From: Selected Stories            |             12 |
-- | White Noise                                         |             49 |
-- | Cannery Row                                         |             95 |
-- | Consider the Lobster                                |             92 |
-- | 10% Happier                                         |             29 |
-- +-----------------------------------------------------+----------------+
-- 13 rows in set (0.00 sec)

(235)234-0987 LIKE '(___)___-____'

SELECT title FROM books WHERE title LIKE '%\%%' -- SEPERTI BIASA PAKE ESCAPE CHARACTER (\) SEPERTI DI STRING JScript, PHP, Dart ATAU bahasa lain -- 
-- mysql> source refining_selections/like.sql;
-- +-------------+
-- | title       |
-- +-------------+
-- | 10% Happier |
-- +-------------+
-- 1 row in set (0.00 sec)

SELECT title FROM books WHERE title LIKE '%\_%'
-- mysql> source refining_selections/like.sql;
-- +-----------+
-- | title     |
-- +-----------+
-- | fake_book |
-- +-----------+
-- 1 row in set (0.00 sec)


