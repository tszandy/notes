https://pkg.go.dev/context

Incoming requests to a server should create a Context, and outgoing calls to servers should accept a Context. The chain of function calls between them must propagate the Context, optionally replacing it with a derived Context created using WithCancel, WithDeadline, WithTimeout, or WithValue. When a Context is canceled, all Contexts derived from it are also canceled.

When you don"t have an existing context, such as at the entry point to a command-line program, create an empty initial context with the function context.Background.
ctx := context.Background()

# context with cancel
ctx, cancel := context.WithCancel(ctx)
defet cancel()

It is important to remember that any time you create a cancellable context, you must call the cancel function. It is fine to call it more than once; every invocation after the first is ignored.
