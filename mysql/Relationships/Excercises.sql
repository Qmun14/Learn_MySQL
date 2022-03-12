mysql> CREATE DATABASE school_data;
-- mysql> show databases;
-- +--------------------+
-- | Database           |
-- +--------------------+
-- | information_schema |
-- | book_shop          |
-- | cake_shop          |
-- | cats_app           |
-- | customer_order     |
-- | mysql              |
-- | performance_schema |
-- | pesanan_pelanggan  |
-- | school_data        |
-- | shirts_db          |
-- | sys                |
-- +--------------------+

CREATE TABLE students(
            id INT AUTO_INCREMENT PRIMARY KEY,
            first_name VARCHAR(100)
            );

-- mysql> desc students
--     -> ;
-- +------------+--------------+------+-----+---------+----------------+
-- | Field      | Type         | Null | Key | Default | Extra          |
-- +------------+--------------+------+-----+---------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | first_name | varchar(100) | YES  |     | NULL    |                |
-- +------------+--------------+------+-----+---------+----------------+
-- 2 rows in set (0.00 sec)

            
CREATE TABLE papers (
            id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(100),
            grade INT,
            student_id INT,
            FOREIGN KEY (student_id) 
                REFERENCES students(id)
            ON DELETE CASCADE
            );

-- mysql> desc papers;
-- +------------+--------------+------+-----+---------+----------------+
-- | Field      | Type         | Null | Key | Default | Extra          |
-- +------------+--------------+------+-----+---------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | title      | varchar(100) | YES  |     | NULL    |                |
-- | grade      | int(11)      | YES  |     | NULL    |                |
-- | student_id | int(11)      | YES  | MUL | NULL    |                |
-- +------------+--------------+------+-----+---------+----------------+
-- 4 rows in set (0.00 sec)

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

-- mysql> SELECT * FROM students;
-- +----+------------+
-- | id | first_name |
-- +----+------------+
-- |  1 | Caleb      |
-- |  2 | Samantha   |
-- |  3 | Raj        |
-- |  4 | Carlos     |
-- |  5 | Lisa       |
-- +----+------------+
-- 5 rows in set (0.00 sec)

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- mysql> SELECT * FROM papers;
-- +----+---------------------------------------+-------+------------+
-- | id | title                                 | grade | student_id |
-- +----+---------------------------------------+-------+------------+
-- |  1 | My First Book Report                  |    60 |          1 |
-- |  2 | My Second Book Report                 |    75 |          1 |
-- |  3 | Russian Lit Through The Ages          |    94 |          2 |
-- |  4 | De Montaigne and The Art of The Essay |    98 |          2 |
-- |  5 | Borges and Magical Realism            |    89 |          4 |
-- +----+---------------------------------------+-------+------------+
-- 5 rows in set (0.00 sec)

-- ===========================  PRINT THIS ===============================
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Caleb      | My First Book Report                  |    60 |
-- +------------+---------------------------------------+-------+

SELECT first_name, title, grade
FROM students 
INNER JOIN papers
    ON students.id = papers.student_id
ORDER BY grade DESC; 

-- mysql> source Relationships/Excercises.sql;
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Caleb      | My First Book Report                  |    60 |
-- +------------+---------------------------------------+-------+
-- 5 rows in set (0.00 sec)
-- ==================================================================================

--  ======================================= PRINT THIS ==============================
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | NULL                                  |  NULL |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | NULL                                  |  NULL |
-- +------------+---------------------------------------+-------+

SELECT first_name, title, grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;

-- mysql> source Relationships/Excercises.sql;
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | NULL                                  |  NULL |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | NULL                                  |  NULL |
-- +------------+---------------------------------------+-------+
-- 7 rows in set (0.00 sec)
-- ===========================================================================

-- =============================== PRINT THIS ===================================
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  | 60    |
-- | Caleb      | My Second Book Report                 | 75    |
-- | Samantha   | Russian Lit Through The Ages          | 94    |
-- | Samantha   | De Montaigne and The Art of The Essay | 98    |
-- | Raj        | MISSING                               | 0     |
-- | Carlos     | Borges and Magical Realism            | 89    |
-- | Lisa       | MISSING                               | 0     |
-- +------------+---------------------------------------+-------+

SELECT first_name,
        IFNULL(title, 'MISSING') AS title,
        IFNULL(grade, 0) AS grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;

-- mysql> source Relationships/Excercises.sql;
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | MISSING                               |     0 |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | MISSING                               |     0 |
-- +------------+---------------------------------------+-------+
-- 7 rows in set (0.00 sec)
-- ========================================================================

-- ===================== PRINT THIS ===========================================
-- +------------+---------+
-- | first_name | average |
-- +------------+---------+
-- | Samantha   | 96.0000 |
-- | Carlos     | 89.0000 |
-- | Caleb      | 67.5000 |
-- | Raj        | 0       |
-- | Lisa       | 0       |
-- +------------+---------+

SELECT first_name,
        IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
    GROUP BY first_name
    ORDER BY average DESC;
    
-- mysql> source Relationships/Excercises.sql;
-- +------------+---------+
-- | first_name | average |
-- +------------+---------+
-- | Samantha   | 96.0000 |
-- | Carlos     | 89.0000 |
-- | Caleb      | 67.5000 |
-- | Raj        |  0.0000 |
-- | Lisa       |  0.0000 |
-- +------------+---------+
-- 5 rows in set (0.00)
-- ===================================================================================

-- ================================== RINT THIS ======================================
-- +------------+---------+----------------+
-- | first_name | average | passing_status |
-- +------------+---------+----------------+
-- | Samantha   | 96.0000 | PASSING        |
-- | Carlos     | 89.0000 | PASSING        |
-- | Caleb      | 67.5000 | FAILING        |
-- | Raj        | 0       | FAILING        |
-- | Lisa       | 0       | FAILING        |
-- +------------+---------+----------------+

SELECT first_name,
        IFNULL(AVG(grade), 0) AS average,
        CASE
            WHEN AVG(grade) IS NULL THEN 'FAILING'
            WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
        END AS passing_status
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
    GROUP BY first_name
    ORDER BY average DESC;

-- mysql> source Relationships/Excercises.sql;
-- +------------+---------+----------------+
-- | first_name | average | passing_status |
-- +------------+---------+----------------+
-- | Samantha   | 96.0000 | PASSING        |
-- | Carlos     | 89.0000 | PASSING        |
-- | Caleb      | 67.5000 | FAILING        |
-- | Raj        |  0.0000 | FAILING        |
-- | Lisa       |  0.0000 | FAILING        |
-- +------------+---------+----------------+
-- 5 rows in set (0.00 sec)



