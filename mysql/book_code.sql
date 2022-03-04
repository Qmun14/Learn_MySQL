SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
FROM books;

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

# SELECT 
#         CONCAT
#     (
#         SUBSTRING(title, 1, 10)
#         , "..."
#     )    AS "Short Title" 
# FROM books;

SELECT 
    SUBSTRING(REPLACE (title, 'e', '3'), 1,10) AS "Weird String"
FROM books;


SELECT CONCAT(author_fname, REVERSE (author_fname)) AS NAME FROM books;

-- | NAME           |
-- +----------------+
-- | JhumpaapmuhJ   |
-- | NeillieN       |
-- | NeillieN       |
-- | JhumpaapmuhJ   |
-- | DaveevaD       |
-- | DaveevaD       |
-- | MichaelleahciM |
-- | PattiittaP     |
-- | DaveevaD       |
-- | NeillieN       |
-- | RaymonddnomyaR |
-- | RaymonddnomyaR |
-- | DonnoD         |
-- | JohnnhoJ       |
-- | DaviddivaD     |
-- | DaviddivaD     |
-- +----------------+
-- 16 rows in set (0.00 sec)

# "Eggs is 4 Characters long"

SELECT
  CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' Caharacters long') AS "Length Characters Names"
FROM books;

-- +---------------------------------------+
-- | Length Characters Last Names          |
-- +---------------------------------------+
-- | Lahiri is 6 Caharacters long          |
-- | Gaiman is 6 Caharacters long          |
-- | Gaiman is 6 Caharacters long          |
-- | Lahiri is 6 Caharacters long          |
-- | Eggers is 6 Caharacters long          |
-- | Eggers is 6 Caharacters long          |
-- | Chabon is 6 Caharacters long          |
-- | Smith is 5 Caharacters long           |
-- | Eggers is 6 Caharacters long          |
-- | Gaiman is 6 Caharacters long          |
-- | Carver is 6 Caharacters long          |
-- | Carver is 6 Caharacters long          |
-- | DeLillo is 7 Caharacters long         |
-- | Steinbeck is 9 Caharacters long       |
-- | Foster Wallace is 14 Caharacters long |
-- | Foster Wallace is 14 Caharacters long |
-- +---------------------------------------+
-- 16 rows in set (0.00 sec)

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

-- +-------------------------------------------------------------------------+
-- | MY FAVORITE BOOK IS THE NAMESAKE                                        |
-- | MY FAVORITE BOOK IS NORSE MYTHOLOGY                                     |
-- | MY FAVORITE BOOK IS AMERICAN GODS                                       |
-- | MY FAVORITE BOOK IS INTERPRETER OF MALADIES                             |
-- | MY FAVORITE BOOK IS A HOLOGRAM FOR THE KING: A NOVEL                    |
-- | MY FAVORITE BOOK IS THE CIRCLE                                          |
-- | MY FAVORITE BOOK IS THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
-- | MY FAVORITE BOOK IS JUST KIDS                                           |
-- | MY FAVORITE BOOK IS A HEARTBREAKING WORK OF STAGGERING GENIUS           |
-- | MY FAVORITE BOOK IS CORALINE                                            |
-- | MY FAVORITE BOOK IS WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
-- | MY FAVORITE BOOK IS WHERE I'M' CALLING FROM: SELECTED STORIES            |
-- | MY FAVORITE BOOK IS WHITE NOISE                                         |
-- | MY FAVORITE BOOK IS CANNERY ROW                                         |
-- | MY FAVORITE BOOK IS OBLIVION: STORIES                                   |
-- | MY FAVORITE BOOK IS CONSIDER THE LOBSTER                                |
-- +-------------------------------------------------------------------------+
-- 16 rows in set (0.00 sec)

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books  WHERE book_id = 1 OR book_id = 2;

-- +-------------------+
-- | full name in caps |
-- +-------------------+
-- | JHUMPA LAHIRI     |
-- | NEIL GAIMAN       |
-- +-------------------+
-- 2 rows in set (0.00 sec)


SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books  WHERE released_year = 2003;

-- +-------------------+
-- | full name in caps |
-- +-------------------+
-- | JHUMPA LAHIRI     |
-- | NEIL GAIMAN       |
-- +-------------------+
-- 2 rows in set (0.00 sec)




