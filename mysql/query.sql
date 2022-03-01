# CREATE TABLE cats4 (
#     name VARCHAR(100) NOT NULL DEFAULT 'Name No Provided',
#     age INT NOT NULL DEFAULT 99
# );

# CREATE TABLE unique_cats2 (
#     cat_id INT NOT NULL AUTO_INCREMENT,
#     name VARCHAR(100),
#     age INT,
#     PRIMARY KEY (cat_id)
# );

# INSERT INTO unique_cats2 (
#         name,
#         age
# ) VALUES (
#         'James',
#         17
# );

# CREATE TABLE employees (
#     id INT NOT NULL AUTO_INCREMENT,
#     last_name VARCHAR(25) NOT NULL,
#     first_name VARCHAR(25) NOT NULL,
#     middle_name VARCHAR(25),
#     age INT NOT NULL,
#     current_status VARCHAR(25) NOT NULL DEFAULT 'Employed',
#     PRIMARY KEY (id)
# );

INSERT INTO employees (
        first_name,
        last_name,
        age
) VALUES (
        'Ma\'mun',
        'Ramdhan',
        30
);
