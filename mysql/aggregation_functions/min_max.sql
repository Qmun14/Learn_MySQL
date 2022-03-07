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