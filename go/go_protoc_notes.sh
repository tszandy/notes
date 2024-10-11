Install the protocol compiler plugins for Go using the following commands:
```sh
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

Update your PATH so that the protoc compiler can find the plugins:
```sh
export PATH="$PATH:$(go env GOPATH)/bin"
```