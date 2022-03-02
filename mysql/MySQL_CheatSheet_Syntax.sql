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

