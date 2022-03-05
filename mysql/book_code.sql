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

-- ==================================================================================
-- || --------------- CODE CHALLANGE STRING CHAPTER THAT I CREATED ----------------- ||
-- ==================================================================================

SELECT UPPER(REVERSE('Why does my cat look at me witch such hatred?'));


-- +-----------------------------------------------------------------+
-- | UPPER(REVERSE('Why does my cat look at me witch such hatred?')) |
-- +-----------------------------------------------------------------+
-- | ?DERTAH HCUS HCTIW EM TA KOOL TAC YM SEOD YHW                   |
-- +-----------------------------------------------------------------+
-- 1 row in set (0.00 sec)

SELECT
   REPLACE
(
   CONCAT('I', ' ', 'like', ' ', 'cats'),
   ' ',
   '-'
);

-- I-like-cats

SELECT REPLACE(title, ' ', '->') AS title FROM books;

-- +--------------------------------------------------------------+
-- | title                                                        |
-- +--------------------------------------------------------------+
-- | The->Namesake                                                |
-- | Norse->Mythology                                             |
-- | American->Gods                                               |
-- | Interpreter->of->Maladies                                    |
-- | A->Hologram->for->the->King:->A->Novel                       |
-- | The->Circle                                                  |
-- | The->Amazing->Adventures->of->Kavalier->&->Clay              |
-- | Just->Kids                                                   |
-- | A->Heartbreaking->Work->of->Staggering->Genius               |
-- | Coraline                                                     |
-- | What->We->Talk->About->When->We->Talk->About->Love:->Stories |
-- | Where->I'm->Calling->From:->Selected->Stories                |
-- | White->Noise                                                 |
-- | Cannery->Row                                                 |
-- | Oblivion:->Stories                                           |
-- | Consider->the->Lobster                                       |
-- +--------------------------------------------------------------+
-- 16 rows in set (0.00 sec)

SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;


-- +----------------+----------------+
-- | forwards       | backwards      |
-- +----------------+----------------+
-- | Lahiri         | irihaL         |
-- | Gaiman         | namiaG         |
-- | Gaiman         | namiaG         |
-- | Lahiri         | irihaL         |
-- | Eggers         | sreggE         |
-- | Eggers         | sreggE         |
-- | Chabon         | nobahC         |
-- | Smith          | htimS          |
-- | Eggers         | sreggE         |
-- | Gaiman         | namiaG         |
-- | Carver         | revraC         |
-- | Carver         | revraC         |
-- | DeLillo        | olliLeD        |
-- | Steinbeck      | kcebnietS      |
-- | Foster Wallace | ecallaW retsoF |
-- | Foster Wallace | ecallaW retsoF |
-- +----------------+----------------+
-- 16 rows in set (0.00 sec)

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;


-- +----------------------+
-- | full name in caps    |
-- +----------------------+
-- | JHUMPA LAHIRI        |
-- | NEIL GAIMAN          |
-- | NEIL GAIMAN          |
-- | JHUMPA LAHIRI        |
-- | DAVE EGGERS          |
-- | DAVE EGGERS          |
-- | MICHAEL CHABON       |
-- | PATTI SMITH          |
-- | DAVE EGGERS          |
-- | NEIL GAIMAN          |
-- | RAYMOND CARVER       |
-- | RAYMOND CARVER       |
-- | DON DELILLO          |
-- | JOHN STEINBECK       |
-- | DAVID FOSTER WALLACE |
-- | DAVID FOSTER WALLACE |
-- +----------------------+
-- 16 rows in set (0.00 sec)

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

-- +--------------------------------------------------------------------------+
-- | blurb                                                                    |
-- +--------------------------------------------------------------------------+
-- | The Namesake was released in 2003                                        |
-- | Norse Mythology was released in 2016                                     |
-- | American Gods was released in 2001                                       |
-- | Interpreter of Maladies was released in 1996                             |
-- | A Hologram for the King: A Novel was released in 2012                    |
-- | The Circle was released in 2013                                          |
-- | The Amazing Adventures of Kavalier & Clay was released in 2000           |
-- | Just Kids was released in 2010                                           |
-- | A Heartbreaking Work of Staggering Genius was released in 2001           |
-- | Coraline was released in 2003                                            |
-- | What We Talk About When We Talk About Love: Stories was released in 1981 |
-- | Where I'm Calling From: Selected Stories was released in 1989            |
-- | White Noise was released in 1985                                         |
-- | Cannery Row was released in 1945                                         |
-- | Oblivion: Stories was released in 2004                                   |
-- | Consider the Lobster was released in 2005                                |
-- +--------------------------------------------------------------------------+
-- 16 rows in set (0.00 sec)

SELECT title AS title, CHAR_LENGTH(title) AS 'character count' FROM books;

-- +-----------------------------------------------------+-----------------+
-- | title                                               | character count |
-- +-----------------------------------------------------+-----------------+
-- | The Namesake                                        |              12 |
-- | Norse Mythology                                     |              15 |
-- | American Gods                                       |              13 |
-- | Interpreter of Maladies                             |              23 |
-- | A Hologram for the King: A Novel                    |              32 |
-- | The Circle                                          |              10 |
-- | The Amazing Adventures of Kavalier & Clay           |              41 |
-- | Just Kids                                           |               9 |
-- | A Heartbreaking Work of Staggering Genius           |              41 |
-- | Coraline                                            |               8 |
-- | What We Talk About When We Talk About Love: Stories |              51 |
-- | Where I'm Calling From: Selected Stories            |              40 |
-- | White Noise                                         |              11 |
-- | Cannery Row                                         |              11 |
-- | Oblivion: Stories                                   |              17 |
-- | Consider the Lobster                                |              20 |
-- +-----------------------------------------------------+-----------------+
-- 16 rows in set (0.00 sec)

SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity 
FROM books WHERE title = 'American Gods' OR title = 'A Heartbreaking Work of Staggering Genius';

-- +---------------+-------------+--------------+
-- | short title   | author      | quantity     |
-- +---------------+-------------+--------------+
-- | American G... | Gaiman,Neil | 12 in stock  |
-- | A Heartbre... | Eggers,Dave | 104 in stock |
-- +---------------+-------------+--------------+
-- 2 rows in set (0.01 sec)






