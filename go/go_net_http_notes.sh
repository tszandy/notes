https://pkg.go.dev/net/http?utm_source=godoc#request

Package http provides HTTP client and server implementations.

import "net/http"

# helloWorldHandler is a function
http.HandleFunc("/helloworld", helloWorldHandler)

func helloWorldHandler(w http.ResponseWriter, r *http.Request){
    
}
