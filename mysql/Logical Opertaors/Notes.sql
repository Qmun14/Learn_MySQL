-- # ========================== != (TIDAK SAMA DENGAN/NOT EQUALS) ==========================

# SELECT title FROM books WHERE released_year = 2017;


# SELECT title FROM books WHERE released_year != 2017;

# SELECT title, author_lname FROM books;

# SELECT title, author_lname FROM books WHERE author_lname = 'Harris';

# SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

-- # =================================================== NOT LIKE ==========================================

# SELECT title FROM books WHERE title LIKE 'W';
 
# SELECT title FROM books WHERE title LIKE 'W%';
 
# SELECT title FROM books WHERE title LIKE '%W%';
 
# SELECT title FROM books WHERE title LIKE 'W%';
 
# SELECT title FROM books WHERE title NOT LIKE 'W%';

-- # ================================================= ( > ), (Greater) ==================================================

# SELECT 100 > 5;
# SELECT -15 > 15;
# SELECT 9 > -10;
# SELECT 1 > 1;
# SELECT 'a' > 'b';
# SELECT 'A' > 'a';

# SELECT title, released_year FROM books 
# WHERE released_year > 2000 ORDER BY released_year;

# SELECT title, released_year FROM books 
# WHERE released_year >= 2000 ORDER BY released_year;

# SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

# SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
 
# SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
 
# SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';

-- # =================================================== ( < ), (Less than) ==========================================
# SELECT 3 < -10;
# SELECT -10 < -9;
# SELECT 42 <= 42;
# SELECT 'h' < 'p';
# SELECT 'Q' < 'q';


-- # ==================================================== ( logical && ( AND ) ) =======================================
# SELECT title, author_lname, released_year FROM books
# WHERE author_lname='Eggers'

# SELECT title, author_lname, released_year FROM books
# WHERE released_year > 2010 ORDER BY released_year;

# SELECT  
#     title, 
#     author_lname, 
#     released_year FROM books
# WHERE author_lname='Eggers' 
#     AND released_year > 2010;

# SELECT * 
# FROM books
# WHERE author_lname='Eggers' 
#     AND released_year > 2010 
#     AND title LIKE '%novel%';

-- # ===================================================== ( logical || ( OR ) ) ==========================================

# SELECT 40 <= 10 || -2 > 0;  #--False
# SELECT 10 > 5 || 5 = 5; #--True
# SELECT 'a' = 5 || 3000> 2000; #--True

# SELECT
#   title,
#   author_lname,
#   released_year,
#   stock_quantity
# FROM books
# WHERE author_lname = 'Eggers'
# || released_year > 2000
# OR stock_quantity > 100
# ORDER BY author_lname;

-- # ====================================================== logical BETWEEN, NOT BETWEEN ======================================================
# SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015 ORDER BY released_year;

# SELECT title, released_year FROM books 
# WHERE released_year BETWEEN 2004 AND 2015 ORDER BY released_year;

# SELECT title, released_year FROM books 
# WHERE released_year NOT BETWEEN 2004 AND 2015;

# SELECT CAST('2017-05-02' AS DATETIME);
-- # mysql> source Logical Operators/Notes.sql;
-- # +--------------------------------+
-- # | CAST('2017-05-02' AS DATETIME) |
-- # +--------------------------------+
-- # | 2017-05-02 00:00:00            |
-- # +--------------------------------+
-- # 1 row in set (0.00 sec)

# SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
-- # mysql> source Logical Operators/Notes.sql;
-- # +-------+---------------------+
-- # | name  | birthdt             |
-- # +-------+---------------------+
-- # | Padma | 1993-11-11 10:07:35 |
-- # +-------+---------------------+
-- # 1 row in set (0.00 sec)

SELECT
  name,
  birthdt
FROM people
WHERE birthdt BETWEEN CAST('1980-01-01' AS datetime)
AND CAST('2000-01-01' AS datetime);
-- # mysql> source Logical Operators/Notes.sql;
-- # +-------+---------------------+
-- # | name  | birthdt             |
-- # +-------+---------------------+
-- # | Padma | 1993-11-11 10:07:35 |
-- # +-------+---------------------+
-- # 1 row in set (0.00 sec)

-- # ====================================================== logical IN, NOT IN ======================================================
SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
-- mysql> source Logical Operators/Notes.sql;
-- +-----------------------------------------------------+--------------+
-- | title                                               | author_lname |
-- +-----------------------------------------------------+--------------+
-- | The Namesake                                        | Lahiri       |
-- | Interpreter of Maladies                             | Lahiri       |
-- | Just Kids                                           | Smith        |
-- | What We Talk About When We Talk About Love: Stories | Carver       |
-- | Where I'm Calling From: Selected Stories            | Carver       |
-- +-----------------------------------------------------+--------------+
-- 5 rows in set (0.01 sec)

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
-- mysql> source Logical Operators/Notes.sql;
-- +-----------------------------------------------------+--------------+
-- | title                                               | author_lname |
-- +-----------------------------------------------------+--------------+
-- | The Namesake                                        | Lahiri       |
-- | Interpreter of Maladies                             | Lahiri       |
-- | Just Kids                                           | Smith        |
-- | What We Talk About When We Talk About Love: Stories | Carver       |
-- | Where I'm Calling From: Selected Stories            | Carver       |
-- +-----------------------------------------------------+--------------+
-- 5 rows in set (0.00 sec)

SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);
-- mysql> source Logical Operators/Notes.sql;
-- +----------------------+---------------+
-- | title                | released_year |
-- +----------------------+---------------+
-- | White Noise          |          1985 |
-- | Lincoln In The Bardo |          2017 |
-- +----------------------+---------------+
-- 2 rows in set (0.00 sec)

SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
-- mysql> source Logical Operators/Notes.sql;
-- +-----------------------------------------------------+---------------+
-- | title                                               | released_year |
-- +-----------------------------------------------------+---------------+
-- | The Namesake                                        |          2003 |
-- | American Gods                                       |          2001 |
-- | Interpreter of Maladies                             |          1996 |
-- | The Circle                                          |          2013 |
-- | A Heartbreaking Work of Staggering Genius           |          2001 |
-- | Coraline                                            |          2003 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |
-- | Where I'm Calling From: Selected Stories            |          1989 |
-- | White Noise                                         |          1985 |
-- | Cannery Row                                         |          1945 |
-- | Consider the Lobster                                |          2005 |
-- | fake_book                                           |          2001 |
-- | Lincoln In The Bardo                                |          2017 |
-- +-----------------------------------------------------+---------------+
-- 13 rows in set (0.00 sec)

SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
-- mysql> source Logical Operators/Notes.sql;
-- +-----------------------------------------------------+---------------+
-- | title                                               | released_year |
-- +-----------------------------------------------------+---------------+
-- | The Namesake                                        |          2003 |
-- | American Gods                                       |          2001 |
-- | Interpreter of Maladies                             |          1996 |
-- | The Circle                                          |          2013 |
-- | A Heartbreaking Work of Staggering Genius           |          2001 |
-- | Coraline                                            |          2003 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |
-- | Where I'm Calling From: Selected Stories            |          1989 |
-- | White Noise                                         |          1985 |
-- | Cannery Row                                         |          1945 |
-- | Consider the Lobster                                |          2005 |
-- | fake_book                                           |          2001 |
-- | Lincoln In The Bardo                                |          2017 |
-- +-----------------------------------------------------+---------------+
-- 13 rows in set (0.00 sec)

SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
-- mysql> source Logical Operators/Notes.sql;
-- +-------------------------------------------+---------------+
-- | title                                     | released_year |
-- +-------------------------------------------+---------------+
-- | The Namesake                              |          2003 |
-- | American Gods                             |          2001 |
-- | The Circle                                |          2013 |
-- | A Heartbreaking Work of Staggering Genius |          2001 |
-- | Coraline                                  |          2003 |
-- | Consider the Lobster                      |          2005 |
-- | fake_book                                 |          2001 |
-- | Lincoln In The Bardo                      |          2017 |
-- +-------------------------------------------+---------------+
-- 8 rows in set (0.00 sec)

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;   --bisa di combine dengan operator mathematic logic nya
-- # mysql> source Logical Operators/Notes.sql;
-- # +-------------------------------------------+---------------+
-- # | title                                     | released_year |
-- # +-------------------------------------------+---------------+
-- # | American Gods                             |          2001 |
-- # | A Heartbreaking Work of Staggering Genius |          2001 |
-- # | fake_book                                 |          2001 |
-- # | The Namesake                              |          2003 |
-- # | Coraline                                  |          2003 |
-- # | Consider the Lobster                      |          2005 |
-- # | The Circle                                |          2013 |
-- # | Lincoln In The Bardo                      |          2017 |
-- # +-------------------------------------------+---------------+
-- # 8 rows in set (0.00 sec)
