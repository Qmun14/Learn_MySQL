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
