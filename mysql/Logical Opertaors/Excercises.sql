# SELECT 10 != 10; --FALSE

# SELECT 15 > 14 && 99 - 5 <= 94; -- TRUE

# SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; --TRUE


-- ## Select All Books Written Before 1980 (non inclusive) ##
SELECT * FROM books WHERE released_year < 1980 ORDER BY released_year;

--  mysql> source Logical Operators/Excercises.sql;
--  +---------+-------------+--------------+--------------+---------------+----------------+-------+
--  | book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
--  +---------+-------------+--------------+--------------+---------------+----------------+-------+
--  |      14 | Cannery Row | John         | Steinbeck    |          1945 |             95 |   181 |
--  +---------+-------------+--------------+--------------+---------------+----------------+-------+
--  1 row in set (0.00 sec)

-- Select All Books Written By Eggers Or Chabon #
SELECT title, author_lname FROM books WHERE author_lname = 'Chabon' OR author_lname = 'Eggers';

-- mysql> source Logical Operators/Excercises.sql;
-- +-------------------------------------------+--------------+
-- | title                                     | author_lname |
-- +-------------------------------------------+--------------+
-- | A Hologram for the King: A Novel          | Eggers       |
-- | The Circle                                | Eggers       |
-- | The Amazing Adventures of Kavalier & Clay | Chabon       |
-- | A Heartbreaking Work of Staggering Genius | Eggers       |
-- +-------------------------------------------+--------------+
-- 4 rows in set (0.01 sec)

-- Select All Books Written By Lahiri, Published after 2000 #
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000 ORDER BY released_year;

-- mysql> source Logical Operators/Excercises.sql;
-- +--------------+--------------+---------------+
-- | title        | author_lname | released_year |
-- +--------------+--------------+---------------+
-- | The Namesake | Lahiri       |          2003 |
-- +--------------+--------------+---------------+
-- 1 row in set (0.01 sec)

-- Select All books with page counts between 100 and 200 #
SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200 ORDER BY pages;

-- mysql> source Logical Operators/Excercises.sql;
-- +-----------------------------------------------------+-------+
-- | title                                               | pages |
-- +-----------------------------------------------------+-------+
-- | What We Talk About When We Talk About Love: Stories |   176 |
-- | Cannery Row                                         |   181 |
-- | Interpreter of Maladies                             |   198 |
-- +-----------------------------------------------------+-------+
-- 3 rows in set (0.00 sec)

-- Select all books where author_lname  starts with a 'C' or an 'S'' # 
SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%' ORDER BY author_lname;

-- mysql> source Logical Operators/Excercises.sql;
-- +-----------------------------------------------------+--------------+
-- | title                                               | author_lname |
-- +-----------------------------------------------------+--------------+
-- | What We Talk About When We Talk About Love: Stories | Carver       |
-- | Where I'm Calling From: Selected Stories            | Carver       |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon       |
-- | Lincoln In The Bardo                                | Saunders     |
-- | Just Kids                                           | Smith        |
-- | Cannery Row                                         | Steinbeck    |
-- +-----------------------------------------------------+--------------+
-- 6 rows in set (0.00 sec)


-- If title contains 'stories'   -> Short Stories

-- Just Kids and A Heartbreaking Work  -> Memoir

-- -- Everything Else -> Novel
-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | TYPE          |
-- +-----------------------------------------------------+----------------+---------------+
-- | The Namesake                                        | Lahiri         | Novel         |
-- | Norse Mythology                                     | Gaiman         | Novel         |
-- | American Gods                                       | Gaiman         | Novel         |
-- | Interpreter of Maladies                             | Lahiri         | Novel         |
-- | A Hologram for the King: A Novel                    | Eggers         | Novel         |
-- | The Circle                                          | Eggers         | Novel         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
-- | Coraline                                            | Gaiman         | Novel         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
-- | White Noise                                         | DeLillo        | Novel         |
-- | Cannery Row                                         | Steinbeck      | Novel         |
-- | Oblivion: Stories                                   | Foster Wallace | Short Stories |
-- | Consider the Lobster                                | Foster Wallace | Novel         |
-- | 10% Happier                                         | Harris         | Novel         |
-- | fake_book                                           | Harris         | Novel         |
-- | Lincoln In The Bardo                                | Saunders       | Novel         |
-- +-----------------------------------------------------+----------------+---------------+
SELECT title, 
       author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books ORDER BY TYPE;
-- mysql> source Logical Operators/Excercises.sql;
-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | TYPE          |
-- +-----------------------------------------------------+----------------+---------------+
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
-- | Coraline                                            | Gaiman         | Novel         |
-- | Lincoln In The Bardo                                | Saunders       | Novel         |
-- | fake_book                                           | Harris         | Novel         |
-- | 10% Happier                                         | Harris         | Novel         |
-- | Consider the Lobster                                | Foster Wallace | Novel         |
-- | Cannery Row                                         | Steinbeck      | Novel         |
-- | White Noise                                         | DeLillo        | Novel         |
-- | The Namesake                                        | Lahiri         | Novel         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
-- | The Circle                                          | Eggers         | Novel         |
-- | A Hologram for the King: A Novel                    | Eggers         | Novel         |
-- | Interpreter of Maladies                             | Lahiri         | Novel         |
-- | American Gods                                       | Gaiman         | Novel         |
-- | Norse Mythology                                     | Gaiman         | Novel         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
-- | Oblivion: Stories                                   | Foster Wallace | Short Stories |
-- +-----------------------------------------------------+----------------+---------------+
-- 19 rows in set (0.00 sec)

-- # Bonus: Make This Happen # 

-- # +-----------------------------------------------------+----------------+---------+
-- # | title                                               | author_lname   | COUNT   |
-- # +-----------------------------------------------------+----------------+---------+
-- # | What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
-- # | The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
-- # | White Noise                                         | DeLillo        | 1 book  |
-- # | A Hologram for the King: A Novel                    | Eggers         | 3 books |
-- # | Oblivion: Stories                                   | Foster Wallace | 2 books |
-- # | Norse Mythology                                     | Gaiman         | 3 books |
-- # | 10% Happier                                         | Harris         | 1 book  |
-- # | fake_book                                           | Harris         | 1 book  |
-- # | The Namesake                                        | Lahiri         | 2 books |
-- # | Lincoln In The Bardo                                | Saunders       | 1 book  |
-- # | Just Kids                                           | Smith          | 1 book  |
-- # | Cannery Row                                         | Steinbeck      | 1 book  |
-- # +-----------------------------------------------------+----------------+---------+
SELECT
    title,
    author_lname, 
    CONCAT( COUNT(author_lname)
           , CASE 
               WHEN COUNT(author_lname) > 1 THEN ' books'
               ELSE ' book'
             END
          ) AS 'COUNT'
FROM books 
GROUP BY author_lname, author_fname ORDER BY author_lname;

-- FINISH --

-- WE HAVE TO PREPARE TO BEGIN IN NEXT CHAPTER THAT MOST IMPORTANT LECTURE --    ### SQL MULTIPLE TABLE JOIN AND RELATIONAL OPERATIONS ###