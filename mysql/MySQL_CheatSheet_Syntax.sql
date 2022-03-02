Semua perintah di bawah ini akan dijalankan dari terminal (command line).

Mulailah dengan menjalankan layanan mysql dan membuka shell mysql, ini dapat dilakukan secara bersamaan dengan satu perintah:
mysql-ctl cli
Jika ini berhasil maka Anda akan melihat mysql> di terminal Anda. Anda sekarang dapat memasukkan perintah MySQL berikut:

Daftar semua database yang ada:
SHOW DATABASES;
Jika Anda melihat database Anda, buka dengan:
USE <db_name>;

Mendapatkan Informasi Tentang Database dan Tabel
Anda sebelumnya telah melihat SHOW DATABASES, yang mencantumkan database yang dikelola oleh server. 
Untuk mengetahui database mana yang sedang dipilih, gunakan fungsi DATABASE() :
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| menagerie  |
+------------+

Jika Anda belum memilih database apa pun, hasilnya adalah NULL.

Untuk mengetahui tabel apa yang berisi database default (misalnya, ketika Anda tidak yakin tentang nama tabel), gunakan pernyataan ini:
mysql> SHOW TABLES;
+---------------------+
| Tables_in_menagerie |
+---------------------+
| event               |
| pet                 |
+---------------------+

Nama kolom dalam output yang dihasilkan oleh pernyataan ini selalu Tables_in_db_name, di mana db_name adalah nama database. Lihat Bagian 13.7.7.39, “Pernyataan SHOW TABLES”, untuk informasi lebih lanjut.

Jika Anda ingin mengetahui tentang struktur tabel, pernyataan DESCRIBE berguna; ini menampilkan informasi tentang masing-masing kolom tabel:
mysql> DESCRIBE pet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
DESC adalah kependekan dari DESCRIBE. Lihat Bagian 13.8.1, “MENJELASKAN Pernyataan”, untuk informasi lebih lanjut.

-- ==================================================================================================================

CODE: Official Introduction to SELECT
Various Simple SELECT statements:
SELECT * FROM cats; 

SELECT name FROM cats; 

SELECT age FROM cats; 

SELECT cat_id FROM cats; 

SELECT name, age FROM cats; 

SELECT cat_id, name, age FROM cats; 

SELECT age, breed, name, cat_id FROM cats; 

SELECT cat_id, name, age, breed FROM cats; 

-- =============================================================================================================
CODE: Introduction to WHERE
CODE: Introduction to WHERE
Select by age:

SELECT * FROM cats WHERE age=4; 

Select by name:

SELECT * FROM cats WHERE name='Egg'; 

Notice how it deals with case:

SELECT * FROM cats WHERE name='egG';  //un_caseSensitif (bisa);

-- =====================================================================================================================
CODE: SELECT Challenges Solution
CODE: Select Challenges Solution
SELECT cat_id FROM cats; 

SELECT name, breed FROM cats; 

SELECT name, age FROM cats WHERE breed='Tabby'; 

SELECT cat_id, age FROM cats WHERE cat_id=age; 

SELECT * FROM cats WHERE cat_id=age; --Bisa membandingkan isi antar Kolom

-- ======================================================================================================================

CODE: Introduction to Aliases
CODE: Introduction to Aliases

SELECT cat_id AS id, name FROM cats;
 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

SELECT cat_id AS "id", name AS 'Nama' from cats;

SELECT cat_id AS "id", name AS 'Nama', breed AS 'Ras' from cats; --BISA MEMBUAT ALIAS UNTUK MEMPERMUDAH KETIKA MELAKUKAN QUERY {INI TIDAK AKAN MERUBAH NAMA FIELD ASLINYA}
 
DESC cats;

-- ===========================================================================================================================

CODE: The UPDATE Command
CODE: Updating Data
Change tabby cats to shorthair:

UPDATE <NAMA_TABLE> SET <NAMA_FIELD/KOLOM> = 'ISI_CONTENTNYA_YANG_MAU_DPAKAI' WHERE <NAMA_FIELD/KOLOM> = 'ISI_YANG_MAU DIGANTI_/DITUJU'; 

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 

Another update:

UPDATE cats SET age=14 WHERE name='Misty'; 

-- =================
CODE: UPDATE Challenges Solution
CODE: Update Challenges Solution
SELECT * FROM cats WHERE name='Jackson';
 
UPDATE cats SET name='Jack' WHERE name='Jackson';
 
SELECT * FROM cats WHERE name='Jackson';
 
SELECT * FROM cats WHERE name='Jack';
 
SELECT * FROM cats WHERE name='Ringo';
 
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
 
SELECT * FROM cats WHERE name='Ringo';
 
SELECT * FROM cats;
 
SELECT * FROM cats WHERE breed='Maine Coon';
 
UPDATE cats SET age=12 WHERE breed='Maine Coon';
 
SELECT * FROM cats WHERE breed='Maine Coon';

-- ===================================================================================================================
CODE: Introduction to DELETE
CODE: DELETING DATA
DELETE FROM cats WHERE name='Egg';
 
SELECT * FROM cats;
 
SELECT * FROM cats WHERE name='egg';
 
DELETE FROM cats WHERE name='egg';
 
SELECT * FROM cats;
 
DELETE FROM cats;
-- ======================================
CODE: DELETE Challenges Solution
CODE: DELETE Challenges Solution
SELECT * FROM cats WHERE age=4;
 
DELETE FROM cats WHERE age=4;
 
SELECT * FROM cats WHERE age=4;
 
SELECT * FROM cats;
 
SELECT *  FROM cats WHERE cat_id=age;
 
DELETE FROM cats WHERE cat_id=age;
 
DELETE FROM cats;
 
SELECT * FROM cats;