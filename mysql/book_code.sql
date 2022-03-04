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