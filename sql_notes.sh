# sqlite3
# create database ${databasename}db 
sqlite3 ${databasename}.db

# show database names
.database

# show table names
.table

# show schema of a table
.schema ${table_name}

# output data to csv file
sqlite3 ${database_file_path}
.headers on
.mode csv
.output ${file_name}
${sql_command}
.quit

sqlite3 -header -csv ${database_file_path} ${sql_command_file}/${sql_command_string} ${output_path}

# MySQL 
# mac install
brew install mysql

# login
mysql --host=127.0.0.1 --user=root --password=example

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
DROP TABLE test;

# get script to delete tables with PREFIX
SELECT CONCAT('DROP TABLE `', TABLE_NAME,'`;') 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME LIKE 'PREFIX%';


SELECT CONCAT('DROP TABLE `', TABLE_NAME,'`;') 
FROM INFORMATION_SCHEMA.TABLES 
WHERE table_schema = '${database_name}';


CREATE USER ${user_name} IDENTIFIED BY '${password}';

CREATE DATABASE ${database_name};
GRANT ALL PRIVILEGES ON ${database_name}.* TO ${user_name};

CREATE TABLE service(
    service_name    VARCHAR(100)   NOT NULL,
    price SMALLINT  UNSIGNED NOT NULL
)

# String Data Types
Data type                          Description
CHAR(size)                         A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
VARCHAR(size)                      A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum column length in characters - can be from 0 to 65535
BINARY(size)                       Equal to CHAR(), but stores binary byte strings. The size parameter specifies the column length in bytes. Default is 1
VARBINARY(size)                    Equal to VARCHAR(), but stores binary byte strings. The size parameter specifies the maximum column length in bytes.
TINYBLOB                           For BLOBs (Binary Large OBjects). Max length: 255 bytes
TINYTEXT                           Holds a string with a maximum length of 255 characters
TEXT(size)                         Holds a string with a maximum length of 65,535 bytes
BLOB(size)                         For BLOBs (Binary Large OBjects). Holds up to 65,535 bytes of data
MEDIUMTEXT                         Holds a string with a maximum length of 16,777,215 characters
MEDIUMBLOB                         For BLOBs (Binary Large OBjects). Holds up to 16,777,215 bytes of data
LONGTEXT                           Holds a string with a maximum length of 4,294,967,295 characters
LONGBLOB                           For BLOBs (Binary Large OBjects). Holds up to 4,294,967,295 bytes of data
ENUM(val1, val2, val3, ...)        A string object that can have only one value, chosen from a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. The values are sorted in the order you enter them
SET(val1, val2, val3, ...)         A string object that can have 0 or more values, chosen from a list of possible values. You can list up to 64 values in a SET list

# Numeric Data Types
Data Types                         Description
BIT(size)                          A bit-value type. The number of bits per value is specified in size. The size parameter can hold a value from 1 to 64. The default value for size is 1.
TINYINT(size)                      A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)
BOOL                               Zero is considered as false, nonzero values are considered as true.
BOOLEAN                            Equal to BOOL
SMALLINT(size)                     A small integer. Signed range is from -32768 to 32767. Unsigned range is from 0 to 65535. The size parameter specifies the maximum display width (which is 255)
MEDIUMINT(size)                    A medium integer. Signed range is from -8388608 to 8388607. Unsigned range is from 0 to 16777215. The size parameter specifies the maximum display width (which is 255)
INT(size)                          A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)
INTEGER(size)                      Equal to INT(size)
BIGINT(size)                       A large integer. Signed range is from -9223372036854775808 to 9223372036854775807. Unsigned range is from 0 to 18446744073709551615. The size parameter specifies the maximum display width (which is 255)
FLOAT(size, d)                     A floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. This syntax is deprecated in MySQL 8.0.17, and it will be removed in future MySQL versions
FLOAT(p)                           A floating point number. MySQL uses the p value to determine whether to use FLOAT or DOUBLE for the resulting data type. If p is from 0 to 24, the data type becomes FLOAT(). If p is from 25 to 53, the data type becomes DOUBLE()
DOUBLE(size, d)                    A normal-size floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter
DOUBLE PRECISION(size, d)            
DECIMAL(size, d)                   An exact fixed-point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. The maximum number for size is 65. The maximum number for d is 30. The default value for size is 10. The default value for d is 0.
DEC(size, d)                       Equal to DECIMAL(size,d)

# Date and Time Data Types
Data type                          Description
DATE                               A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'
DATETIME(fsp)                      A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time
TIMESTAMP(fsp)                     A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. Automatic initialization and updating to the current date and time can be specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition
TIME(fsp)                          A time. Format: hh:mm:ss. The supported range is from '-838:59:59' to '838:59:59'
YEAR                               A year in four-digit format. Values allowed in four-digit format: 1901 to 2155, and 0000.

# Stop/Start Mysql Service
Win key + R
Type "services.msc"
Find mysql*

# select 
SELECT column1, column2, ...
FROM table_name;

# select distinct
SELECT DISTINCT column1, column2, ...
FROM table_name;

SELECT COUNT(DISTINCT Country) FROM Customers;

SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);

# where
SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT * FROM Customers
WHERE Country='Mexico';

SELECT * FROM Customers
WHERE CustomerID=1;


Operator       Description
=              Equal    
>              Greater than    
<              Less than    
>=             Greater than or equal    
<=             Less than or equal    
<>             Not equal. Note: In some versions of SQL this operator may be written as !=    
BETWEEN        Between a certain range    
LIKE           Search for a pattern    
IN             To specify multiple possible values for a column

SELECT * FROM Customers
WHERE City LIKE 's%';

SELECT * FROM Customers
WHERE City IN ('Paris','London');

# And, Or, Not
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

# Order by
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

# Insert into
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

# Null
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

# Update
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

# Delete
DELETE FROM table_name 
WHERE condition;

# Select Top
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

# Select Limit
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

# Min
SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

# Max
SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MAX(Price) AS LargestPrice
FROM Products;

# Count
SELECT COUNT(column_name)
FROM table_name
WHERE condition;

# Average
SELECT AVG(column_name)
FROM table_name
WHERE condition;

# Sum
SELECT SUM(column_name)
FROM table_name
WHERE condition;

# Like
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

LIKE Operator                     Description
WHERE CustomerName LIKE 'a%'      Finds any values that start with "a"
WHERE CustomerName LIKE '%a'      Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'    Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'     Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'     Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'    Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'      Finds any values that start with "a" and ends with "o"

# Wildcards
Symbol    Description                                                   Example
%         Represents zero or more characters                            bl% finds bl, black, blue, and blob
_         Represents a single character                                 h_t finds hot, hat, and hit
[]        Represents any single character within the brackets           h[oa]t finds hot and hat, but not hit
^         Represents any character not in the brackets                  h[^oa]t finds hit, but not hot and hat
-         Represents any single character within the specified range    c[a-b]t finds cat and cbt

# In
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

# select case
SELECT   ...,
         CASE WHEN IDParent < 1 THEN ID ELSE IDPArent END AS ColumnName,
         ...
FROM     tableName