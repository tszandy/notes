https://pkg.go.dev/net/http?utm_source=godoc#request

# HTTP Client and Server in Go

This guide provides an overview of creating HTTP clients and servers in Go, including configuration for headers, proxies, TLS, and HTTP/2 support.

## HTTP Client

### Creating a Client
For control over HTTP client headers, redirect policies, and other settings, create a `Client`:

```go
client := &http.Client{
    CheckRedirect: redirectPolicyFunc,
}

resp, err := client.Get("http://example.com")
// ...
```

### Customizing Requests
To customize headers or other request parameters, use `http.NewRequest`:

```go
req, err := http.NewRequest("GET", "http://example.com", nil)
// ...
req.Header.Add("If-None-Match", `W/"wyzzy"`)
resp, err := client.Do(req)
// ...
```

### Configuring Transport
For control over proxies, TLS configuration, keep-alives, compression, and other settings, create a `Transport`:

```go
tr := &http.Transport{
    MaxIdleConns:       10,
    IdleConnTimeout:    30 * time.Second,
    DisableCompression: true,
}
client := &http.Client{Transport: tr}
resp, err := client.Get("https://example.com")
```

**Note**: `Clients` and `Transports` are safe for concurrent use by multiple goroutines and should be created once and reused for efficiency.

## HTTP Server

### Basic Server with DefaultServeMux
`ListenAndServe` starts an HTTP server with a given address and handler. Use `nil` for the handler to use `DefaultServeMux`:

```go
http.Handle("/foo", fooHandler)

http.HandleFunc("/bar", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
})

log.Fatal(http.ListenAndServe(":8080", nil))
```

### Custom Server
For more control over server behavior, create a custom `Server`:

```go
s := &http.Server{
    Addr:           ":8080",
    Handler:        myHandler,
    ReadTimeout:    10 * time.Second,
    WriteTimeout:   10 * time.Second,
    MaxHeaderBytes: 1 << 20,
}
log.Fatal(s.ListenAndServe())
```

### Using http.NewServeMux
To create a new `ServeMux` instance:

```go
mux := http.NewServeMux()

// Register a handler for the root path
mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Welcome to the home page!")
})

// Register a handler for /hello
mux.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, world!")
})

// Start the server on port 8080
fmt.Println("Server is running at http://localhost:8080/")
err := http.ListenAndServe(":8080", mux)
if err != nil {
    fmt.Println("Error starting server:", err)
}
```

## HTTP/2 Support
Starting with Go 1.6, the `http` package provides transparent HTTP/2 support for HTTPS connections.

### Disabling HTTP/2
To disable HTTP/2, set `TLSNextProto` to a non-nil, empty map for clients or servers:

```go
// For clients
tr := &http.Transport{
    TLSNextProto: make(map[string]func(authority string, c *tls.Conn) http.RoundTripper),
}

// For servers
s := &http.Server{
    TLSNextProto: make(map[string]func(conn *tls.Conn, h http.Handler)),
}
```

Alternatively, use `GODEBUG` environment variables:

```bash
GODEBUG=http2client=0  # Disable HTTP/2 client support
GODEBUG=http2server=0  # Disable HTTP/2 server support
GODEBUG=http2debug=1   # Enable verbose HTTP/2 debug logs
GODEBUG=http2debug=2   # Enable even more verbose logs with frame dumps
```

**Note**: Report any HTTP/2 issues at [https://golang.org/s/http2bug](https://golang.org/s/http2bug) before disabling.

### Advanced HTTP/2 Configuration
For complex configurations or lower-level HTTP/2 features, import the `golang.org/x/net/http2` package and use its `ConfigureTransport` or `ConfigureServer` functions. This takes precedence over the `net/http` package's built-in HTTP/2 support.


