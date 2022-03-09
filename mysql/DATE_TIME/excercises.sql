-- # What's a good use case for CHAR?

-- # (just make one up)

-- # ANSWER : Code of each Nations Like USA, INA, MAY, THA, JPN, RUS, GBR, CAN etc.

# CREATE TABLE inventory (
#     item_name __VARCHAR(100)__________,
#     price ___DECIMAL(6,2)___________,
#     quantity ___INT()__________
# );
-- # Fill In The Blanks where price at least < 1.000.000 digits.

-- # What's the difference between
-- # DATETIME and TIMESTAMP?
-- # Print Out The Current Time
-- # Print Out The Current Date (but not time)

-- # ANSWER :
-- # DATETIME USE unless 8 bytes to store their data to memory, and TIMESTAMP just only use 4 bytes alocate in memory,
-- # The TIMESTAMP data type is used for values that contain both date and time parts. TIMESTAMP has a range of '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC. 

-- # Print Out The Current Time
# SELECT  NOW();

-- # Print Out The Current Date (but not time)
# SELECT CURDATE();


-- # Print Out The Current Day Of The Week (The Number)
# SELECT DAYOFWEEK(NOW()); -- #OR
# SELECT DATE_FORMAT(NOW(), '%w'); -- INI KALO MINGGU/SUNDAY HARI KE = 0

-- # Print Out The Current Day Of The Week (The Day Name)
# SELECT DAYNAME(NOW()); -- #OR
# SELECT DATE_FORMAT(NOW(), '%W');

-- # Print out the current day and time using this format: mm/dd/yyyy
# SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

-- #Print out the current day and time using this format: 
-- #January 2nd at 3:15
-- #April 1st at 10:18
# SELECT DATE_FORMAT(NOW(), '%M %dth at %T');

-- # Create a tweets table that stores:
-- # The Tweet content
-- # A Username
-- # Time it was created

# CREATE TABLE tweets (
#     content VARCHAR(140),
#     user_name VARCHAR(100),
#     created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
# );


