# install
npm install better-sqlite3


const Database = require('better-sqlite3');

// Open a database connection
const db = new Database('my-database.db');

// Create a table
db.prepare('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT)').run();

// Insert data
const stmt = db.prepare('INSERT INTO users (name) VALUES (?)');
stmt.run('John Doe');
stmt.run('Jane Doe');

// Query data
const rows = db.prepare('SELECT * FROM users').all();
console.log(rows);

// Close the database connection
db.close();
