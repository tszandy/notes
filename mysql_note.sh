MySQL 

mysql -u root -p

# list all users 
SELECT 
	user
FROM
	mysql.user;

SHOW DATABASES;
use mysql
SHOW TABLES;
desc user;
explain user;

DROP DATABASE test;

CREATE USER ‘dbmanager’ IDENTIFIED BY ‘password’;

CREATE DATABASE BWM;
GRANT ALL PRIVILEGES ON bwm.* TO dbmanager;

CREATE TABLE service(
	service_name    VARCHAR(100)   NOT NULL,
	price SMALLINT  UNSIGNED NOT NULL
)



