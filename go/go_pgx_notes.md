https://pkg.go.dev/github.com/jackc/pgx/v5

# Establishing a Connection
The primary way of establishing a connection is with pgx.Connect:
```
conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
```

# Connection Pool
*pgx.Conn represents a single connection to the database and is not concurrency safe. Use package github.com/jackc/pgx/v5/pgxpool for a concurrency safe connection pool.