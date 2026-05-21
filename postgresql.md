# PostgreSQL Notes

PostgreSQL permissions are mostly controlled through **roles** and **privileges**.

## Table of Contents

- [0. List all available databases](#0-list-all-available-databases)
  - [Switch to a database](#switch-to-a-database-psql-meta-command-not-sql)
  - [Show current in-use database](#show-current-in-use-database)
- [Create a new user and grant database access](#create-a-new-user-and-grant-database-access)
  - [Create a new user with username and password](#create-a-new-user-with-username-and-password)
  - [Grant database access to the new user](#grant-database-access-to-the-new-user)
  - [Grant access to future tables automatically](#grant-access-to-future-tables-automatically)
- [1. Role-level permissions](#1-role-level-permissions)
- [2. Database permissions](#2-database-permissions)
  - [Show permission for each database](#show-permission-for-each-database)
  - [Show database permission for each user](#show-database-permission-for-each-user)
- [3. Schema permissions](#3-schema-permissions)
  - [List all schemas in current database](#list-all-schemas-in-current-database)
  - [Create a new schema](#create-a-new-schema)
  - [Show schema permission for each user](#show-schema-permission-for-each-user)
- [4. Table permissions](#4-table-permissions)
  - [Show table permission for each user](#show-table-permission-for-each-user)
- [5. Sequence permissions](#5-sequence-permissions)
- [6. Function permissions](#6-function-permissions)
- [7. Column-level permissions](#7-column-level-permissions)
- [8. Row-level security](#8-row-level-security)
- [9. Default privileges](#9-default-privileges)

## 0. List all available databases

```sql
SELECT datname FROM pg_database;
```

#### Switch to a database (psql meta-command, not SQL)

```sql
\c mydb
```

Note: PostgreSQL has no SQL `USE` command like MySQL. You must reconnect to change databases.

#### Show current in-use database

```sql
SELECT current_database();
```

## Create a new user and grant database access

#### Create a new user with username and password

```sql
CREATE USER app_user WITH PASSWORD 'your_password';
```

#### Grant database access to the new user

```sql
GRANT CONNECT ON DATABASE mydb TO app_user;
GRANT USAGE ON SCHEMA public TO app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;
```

#### Grant access to future tables automatically

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user;
```

## 1. Role-level permissions

These are permissions on the PostgreSQL account itself:

```sql
SELECT rolname, rolsuper, rolcreatedb, rolcreaterole, rolcanlogin, rolreplication
FROM pg_roles;
```

Common role attributes:

| Permission    | Meaning                                |
| ------------- | -------------------------------------- |
| `SUPERUSER`   | Full admin access inside PostgreSQL    |
| `CREATEDB`    | Can create databases                   |
| `CREATEROLE`  | Can create, alter, and drop roles      |
| `LOGIN`       | Can log in as a user                   |
| `REPLICATION` | Can do replication-related actions     |
| `BYPASSRLS`   | Can bypass row-level security policies |

Example:

```sql
CREATE ROLE app_user LOGIN PASSWORD 'secret';
ALTER ROLE app_user CREATEDB;
ALTER ROLE app_user NOSUPERUSER;
```

## 2. Database permissions

#### Show permission for each database

```sql
SELECT
  datname AS database_name,
  datacl AS access_privileges
FROM pg_database
ORDER BY datname;
```

#### Show database permission for each user

```sql
SELECT
  d.datname AS database_name,
  r.rolname AS role_name,
  has_database_privilege(r.rolname, d.datname, 'CONNECT') AS can_connect,
  has_database_privilege(r.rolname, d.datname, 'CREATE') AS can_create,
  has_database_privilege(r.rolname, d.datname, 'TEMP') AS can_create_temp
FROM pg_database d
CROSS JOIN pg_roles r
WHERE r.rolcanlogin = true
ORDER BY d.datname, r.rolname;
```

Applied to databases:

| Privilege            | Meaning                            |
| -------------------- | ---------------------------------- |
| `CONNECT`            | Can connect to the database        |
| `CREATE`             | Can create schemas in the database |
| `TEMPORARY` / `TEMP` | Can create temporary tables        |

Example:

```sql
GRANT CONNECT ON DATABASE mydb TO app_user;
GRANT CREATE ON DATABASE mydb TO app_user;
```

## 3. Schema permissions

**What is `public` schema?**

- Every PostgreSQL database has a default schema called `public`.
- When you create a table without specifying a schema, it goes into `public`.
- A schema is like a folder/namespace inside a database that organizes tables, views, functions, etc.
- Structure: **Server → Database → Schema → Tables/Views/Functions**

```
mydb (database)
├── public (schema)        ← default schema
│   ├── users (table)
│   └── orders (table)
├── analytics (schema)     ← custom schema
│   └── reports (table)
```

#### List all schemas in current database

```sql
SELECT schema_name FROM information_schema.schemata;
-- or
\dn
```

#### Create a new schema

```sql
CREATE SCHEMA analytics;
```

#### Show schema permission for each user

```sql
SELECT
  n.nspname AS schema_name,
  r.rolname AS role_name,
  has_schema_privilege(r.rolname, n.nspname, 'USAGE') AS can_usage,
  has_schema_privilege(r.rolname, n.nspname, 'CREATE') AS can_create
FROM pg_namespace n
CROSS JOIN pg_roles r
WHERE r.rolcanlogin = true
  AND n.nspname NOT LIKE 'pg_%'
  AND n.nspname != 'information_schema'
ORDER BY n.nspname, r.rolname;
```

Applied to schemas like `public`:

| Privilege | Meaning                              |
| --------- | ------------------------------------ |
| `USAGE`   | Can access objects inside the schema |
| `CREATE`  | Can create objects in the schema     |

Example:

```sql
GRANT USAGE ON SCHEMA public TO app_user;
GRANT CREATE ON SCHEMA public TO app_user;
```

## 4. Table permissions

#### Show table permission for each user

```sql
SELECT
  table_schema,
  table_name,
  grantee,
  privilege_type
FROM information_schema.table_privileges
WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
  AND table_catalog = current_database()
ORDER BY table_schema, table_name, grantee;
```

Applied to tables:

| Privilege    | Meaning                                   |
| ------------ | ----------------------------------------- |
| `SELECT`     | Read rows                                 |
| `INSERT`     | Add rows                                  |
| `UPDATE`     | Modify rows                               |
| `DELETE`     | Delete rows                               |
| `TRUNCATE`   | Empty the table                           |
| `REFERENCES` | Create foreign keys referencing the table |
| `TRIGGER`    | Create triggers on the table              |

Example:

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE users TO app_user;
GRANT ALL PRIVILEGES ON TABLE users TO app_user;
```

For all tables in a schema:

```sql
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO app_user;
```

## 5. Sequence permissions

Important for `SERIAL` or identity columns:

| Privilege | Meaning                         |
| --------- | ------------------------------- |
| `USAGE`   | Can use `nextval()`             |
| `SELECT`  | Can read current sequence value |
| `UPDATE`  | Can change sequence value       |

Example:

```sql
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;
```

## 6. Function permissions

Applied to functions and procedures:

| Privilege | Meaning              |
| --------- | -------------------- |
| `EXECUTE` | Can run the function |

Example:

```sql
GRANT EXECUTE ON FUNCTION my_function() TO app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO app_user;
```

## 7. Column-level permissions

You can grant permissions on specific columns:

```sql
GRANT SELECT (id, email) ON users TO readonly_user;
GRANT UPDATE (email) ON users TO app_user;
```

## 8. Row-level security

PostgreSQL can restrict which rows a user can see or modify:

```sql
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

CREATE POLICY user_orders
ON orders
FOR SELECT
USING (user_id = current_user_id());
```

## 9. Default privileges

These control permissions for **future objects**:

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO app_user;
```
