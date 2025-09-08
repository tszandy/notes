# Go Tools

## Commonly Used Tools

- **gotests**
- **gomodifytags**
- **impl**
- **goplay**
- **dlv**
- **staticcheck**
- **The delve debugger**
- **gopls**

### goimports
```bash
# Install
go get golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/goimports@latest
```

### golint
```bash
# Install
go install golang.org/x/lint/golint@latest

# Run
golint ./...
```

### gofmt
> A tool that automatically formats Go source code.

### go vet
```bash
go vet ./...
```

### delve
> Go debugger

### Air
> **Description:** Air is a lightweight, highly configurable live-reloading tool for Go applications.

```bash
go install github.com/air-verse/air@latest
```

### golangci-lint
```bash
# Install
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Run
golangci-lint run
```

---

## Using go1.15.6

```bash
go get golang.org/dl/go.1.15.6
go1.15.6 download
go1.15.6 build
```

---

# Go PostgreSQL Drivers & ORM

This document provides a quick overview of popular Go libraries for connecting to PostgreSQL.

## Drivers

| Name    | Launch Date | Description |
|---------|-------------|-------------|
| [pgx](https://github.com/jackc/pgx) | 2013 | Preferred driver for PostgreSQL in Go. Offers high performance, advanced PostgreSQL features (like notifications, COPY protocol), and works with or without `database/sql`. Actively maintained and recommended for new projects. |
| [lib/pq](https://github.com/lib/pq) | 2011 | One of the earliest PostgreSQL drivers for Go. Widely used and stable, but now in maintenance mode. Supports `database/sql` but lacks many of the advanced features provided by pgx. |

## ORM

| Name    | Launch Date | Description |
|---------|-------------|-------------|
| [GORM](https://gorm.io/) | 2013 | Popular ORM library for Go. Provides an abstraction layer over SQL with model struct mapping, migrations, associations, hooks, and more. Widely used in production, though slightly heavier than direct SQL or pgx. |

---

## Recommendation

- **Use `pgx`** for performance and full PostgreSQL feature set.  
- **Use `lib/pq`** only for legacy projects.  
- **Use `GORM`** if you prefer an ORM with abstractions over SQL queries.  
