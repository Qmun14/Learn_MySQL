DROP DATABASE instagram_db_clone;
CREATE DATABASE instagram_db_clone;

-- mysql> show tables;
-- +------------------------------+
-- | Tables_in_instagram_db_clone |
-- +------------------------------+
-- | comments                     |
-- | follows                      |
-- | likes                        |
-- | photo_tags                   |
-- | photos                       |
-- | tags                         |
-- | users                        |
-- +------------------------------+
-- 7 rows in set (0.00 sec)

CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) UNIQUE NOT NULL,
        created_at TIMESTAMP DEFAULT NOW()
);
-- mysql> DESC users;
-- +------------+--------------+------+-----+-------------------+----------------+
-- | Field      | Type         | Null | Key | Default           | Extra          |
-- +------------+--------------+------+-----+-------------------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL              | auto_increment |
-- | username   | varchar(255) | NO   | UNI | NULL              |                |
-- | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
-- +------------+--------------+------+-----+-------------------+----------------+
-- 3 rows in set (0.00 sec)

-- INSERT INTO users (username) VALUES
-- ('MochiTheCat'),
-- ('MotatTheRebell'),
-- ('Ma\'mun Ramdhan')

CREATE TABLE photos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        image_url VARCHAR(255) NOT NULL,
        user_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(user_id) REFERENCES users(id)
);
-- mysql> DESC photos;
-- +------------+--------------+------+-----+-------------------+----------------+
-- | Field      | Type         | Null | Key | Default           | Extra          |
-- +------------+--------------+------+-----+-------------------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL              | auto_increment |
-- | image_url  | varchar(255) | NO   |     | NULL              |                |
-- | user_id    | int(11)      | NO   | MUL | NULL              |                |
-- | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
-- +------------+--------------+------+-----+-------------------+----------------+
-- 4 rows in set (0.00 sec)

CREATE TABLE comments (
        id INT AUTO_INCREMENT PRIMARY KEY, 
        comment_text VARCHAR(255) NOT NULL,
        user_id INT NOT NULL,
        photo_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(photo_id) REFERENCES photos(id)        
);
-- mysql> DESC comments;
-- +--------------+--------------+------+-----+-------------------+----------------+
-- | Field        | Type         | Null | Key | Default           | Extra          |
-- +--------------+--------------+------+-----+-------------------+----------------+
-- | id           | int(11)      | NO   | PRI | NULL              | auto_increment |
-- | comment_text | varchar(255) | NO   |     | NULL              |                |
-- | user_id      | int(11)      | NO   | MUL | NULL              |                |
-- | photo_id     | int(11)      | NO   | MUL | NULL              |                |
-- | created_at   | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
-- +--------------+--------------+------+-----+-------------------+----------------+
-- 5 rows in set (0.00 sec)

CREATE TABLE likes (
        user_id INT NOT NULL,
        photo_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(photo_id) REFERENCES photos(id),
        PRIMARY KEY(user_id, photo_id)        
);
-- mysql> DESC likes;
-- +------------+-----------+------+-----+-------------------+-------+
-- | Field      | Type      | Null | Key | Default           | Extra |
-- +------------+-----------+------+-----+-------------------+-------+
-- | user_id    | int(11)   | NO   | PRI | NULL              |       |
-- | photo_id   | int(11)   | NO   | PRI | NULL              |       |
-- | created_at | timestamp | NO   |     | CURRENT_TIMESTAMP |       |
-- +------------+-----------+------+-----+-------------------+-------+
-- 3 rows in set (0.00 sec)

CREATE TABLE follows (
        follower_id INT NOT NULL,
        followee_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(follower_id) REFERENCES users(id),
        FOREIGN KEY(followee_id) REFERENCES users(id),
        PRIMARY KEY(follower_id, followee_id)
);
-- mysql> DESC follows;
-- +-------------+-----------+------+-----+-------------------+-------+
-- | Field       | Type      | Null | Key | Default           | Extra |
-- +-------------+-----------+------+-----+-------------------+-------+
-- | follower_id | int(11)   | NO   | PRI | NULL              |       |
-- | followee_id | int(11)   | NO   | PRI | NULL              |       |
-- | created_at  | timestamp | NO   |     | CURRENT_TIMESTAMP |       |
-- +-------------+-----------+------+-----+-------------------+-------+
-- 3 rows in set (0.00 sec)

CREATE TABLE tags (
        id INT AUTO_INCREMENT PRIMARY KEY,
        tag_name VARCHAR(255) UNIQUE,
        created_at TIMESTAMP DEFAULT NOW()
);
-- mysql> DESC tags;
-- +------------+--------------+------+-----+-------------------+----------------+
-- | Field      | Type         | Null | Key | Default           | Extra          |
-- +------------+--------------+------+-----+-------------------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL              | auto_increment |
-- | tag_name   | varchar(255) | YES  | UNI | NULL              |                |
-- | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
-- +------------+--------------+------+-----+-------------------+----------------+
-- 3 rows in set (0.00 sec)

CREATE TABLE photo_tags(
        photo_id INT NOT NULL,
        tag_id INT NOT NULL,
        FOREIGN KEY(photo_id) REFERENCES photos(id),
        FOREIGN KEY(tag_id) REFERENCES tags(id),
        PRIMARY KEY(photo_id, tag_id)        
);
-- mysql> DESC photo_tags;
-- +----------+---------+------+-----+---------+-------+
-- | Field    | Type    | Null | Key | Default | Extra |
-- +----------+---------+------+-----+---------+-------+
-- | photo_id | int(11) | NO   | PRI | NULL    |       |
-- | tag_id   | int(11) | NO   | PRI | NULL    |       |
-- +----------+---------+------+-----+---------+-------+
-- 2 rows in set (0.00 sec)

