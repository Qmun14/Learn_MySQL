-- # 1. 5 OLD USERS LIST : ------------
SELECT id, username, created_at FROM users ORDER BY created_at LIMIT 5;

-- mysql> source DB_Clone_Instagram/query.sql
-- +----+------------------+---------------------+
-- | id | username         | created_at          |
-- +----+------------------+---------------------+
-- | 80 | Darby_Herzog     | 2016-05-06 00:14:21 |
-- | 67 | Emilio_Bernier52 | 2016-05-06 13:04:30 |
-- | 63 | Elenor88         | 2016-05-08 01:30:41 |
-- | 95 | Nicole71         | 2016-05-09 17:30:22 |
-- | 38 | Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
-- +----+------------------+---------------------+
-- 5 rows in set (0.00 sec)


-- # 2. MOST DAYS POPULER REGISTRATION : ----------------
SELECT  DAYNAME(created_at) AS name_days,
        COUNT(*) AS most_days_created
FROM users
GROUP BY name_days
ORDER BY most_days_created DESC LIMIT 2 
;
-- mysql> source DB_Clone_Instagram/query.sql
-- +-----------+-------------------+
-- | name_days | most_days_created |
-- +-----------+-------------------+
-- | Thursday  |                16 |
-- | Sunday    |                16 |
-- +-----------+-------------------+
-- 2 rows in set (0.00 sec)


# 3. FINDING INACTIVE USERS THAT NEVER POST A FOTO : -----------------

SELECT username,
        IFNULL(image_url, 'INACTIVE') AS 'users_status'
FROM users 
LEFT JOIN photos     
    ON users.id = photos.user_id
WHERE photos.image_url IS NULL
    -- # GROUP BY username
    -- # ORDER BY image_url
;
-- mysql> source DB_Clone_Instagram/query.sql
-- +---------------------+--------------+
-- | username            | users_status |
-- +---------------------+--------------+
-- | Aniya_Hackett       | INACTIVE     |
-- | Bartholome.Bernhard | INACTIVE     |
-- | Bethany20           | INACTIVE     |
-- | Darby_Herzog        | INACTIVE     |
-- | David.Osinski47     | INACTIVE     |
-- | Duane60             | INACTIVE     |
-- | Esmeralda.Mraz57    | INACTIVE     |
-- | Esther.Zulauf61     | INACTIVE     |
-- | Franco_Keebler64    | INACTIVE     |
-- | Hulda.Macejkovic    | INACTIVE     |
-- | Jaclyn81            | INACTIVE     |
-- | Janelle.Nikolaus81  | INACTIVE     |
-- | Jessyca_West        | INACTIVE     |
-- | Julien_Schmidt      | INACTIVE     |
-- | Kasandra_Homenick   | INACTIVE     |
-- | Leslie67            | INACTIVE     |
-- | Linnea59            | INACTIVE     |
-- | Maxwell.Halvorson   | INACTIVE     |
-- | Mckenna17           | INACTIVE     |
-- | Mike.Auer39         | INACTIVE     |
-- | Morgan.Kassulke     | INACTIVE     |
-- | Nia_Haag            | INACTIVE     |
-- | Ollie_Ledner37      | INACTIVE     |
-- | Pearl7              | INACTIVE     |
-- | Rocio33             | INACTIVE     |
-- | Tierra.Trantow      | INACTIVE     |
-- +---------------------+--------------+
-- 26 rows in set (0.01 sec)

-- # -- 4. Identify most popular photo (and user who created it) : ----------------
SELECT 
        username AS The_Owner,
        photo_id,
        image_url,
        COUNT(image_url) AS Most_like_photo
FROM likes
INNER JOIN photos
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
    GROUP BY photo_id
    ORDER BY Most_like_photo DESC LIMIT 5    
;
-- mysql> source DB_Clone_Instagram/query.sql
-- +-----------------+----------+------------------------+-----------------+
-- | The_Owner       | photo_id | image_url              | Most_like_photo |
-- +-----------------+----------+------------------------+-----------------+
-- | Zack_Kemmer93   |      145 | https://jarret.name    |              48 |
-- | Adelle96        |      182 | https://dorcas.biz     |              43 |
-- | Malinda_Streich |      127 | https://celestine.name |              43 |
-- | Seth46          |      123 | http://shannon.org     |              42 |
-- | Meggie_Doyle    |      147 | https://adela.com      |              41 |
-- +-----------------+----------+------------------------+-----------------+
-- 5 rows in set (0.01 sec)

-- # -- 5. Calculate average number of photos per user: ----------------------
SELECT  
    ( 
        (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) 
    ) AS Average
    ;
-- mysql> source DB_Clone_Instagram/query.sql
-- +---------+
-- | Average |
-- +---------+
-- |  2.5700 |
-- +---------+
-- 1 row in set (0.00 sec)


# -- 6. Find the five most popular hashtags: -----------------------
SELECT tag_name,
        COUNT(*) AS most_used_tag 
FROM tags
JOIN photo_tags
    ON tags.id = photo_tags.tag_id
    GROUP BY tag_name
    ORDER BY most_used_tag DESC LIMIT 5
;
-- mysql> source DB_Clone_Instagram/query.sql
-- +----------+---------------+
-- | tag_name | most_used_tag |
-- +----------+---------------+
-- | smile    |            59 |
-- | beach    |            42 |
-- | party    |            39 |
-- | fun      |            38 |
-- | concert  |            24 |
-- +----------+---------------+
-- 5 rows in set (0.00 sec)


-- # -- 7. Finding the bots - the users who have liked every single photo: ---------------------
SELECT username,
        COUNT(*) AS num_likes
FROM users
INNER JOIN likes    
    ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos) 
;
-- mysql> source DB_Clone_Instagram/query.sql
-- +--------------------+-----------+
-- | username           | num_likes |
-- +--------------------+-----------+
-- | Aniya_Hackett      |       257 |
-- | Jaclyn81           |       257 |
-- | Rocio33            |       257 |
-- | Maxwell.Halvorson  |       257 |
-- | Ollie_Ledner37     |       257 |
-- | Mckenna17          |       257 |
-- | Duane60            |       257 |
-- | Julien_Schmidt     |       257 |
-- | Mike.Auer39        |       257 |
-- | Nia_Haag           |       257 |
-- | Leslie67           |       257 |
-- | Janelle.Nikolaus81 |       257 |
-- | Bethany20          |       257 |
-- +--------------------+-----------+
-- 13 rows in set (0.01 sec)
