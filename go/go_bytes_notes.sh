https://pkg.go.dev/bytes

bytes.Buffer

var b bytes.Buffer // A Buffer needs no initialization.
b.Write([]byte("Hello "))
fmt.Fprintf(&b, "world!")
b.WriteTo(os.Stdout)

