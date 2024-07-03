# create database ${databasename}db 
sqlite3 ${databasename}db

# show database names
.database

# show table names
.table

# show schema of a table
.schema ${table_name}

# output data to csv file
.headers on
.mode csv
.output ${file_name}
${sql_command}
.quit

