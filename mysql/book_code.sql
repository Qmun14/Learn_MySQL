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