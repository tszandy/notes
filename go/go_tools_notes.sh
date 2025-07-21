# go tools
gotests
gomodifytags
impl
goplay
dlv
staticcheck
The delve debugger
gopls

goimports # go get golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/goimports@latest

golint
go install golang.org/x/lint/golint@latest
golint ./...

gofmt # a tool that automatically formats Go source code.

go vet
go vet ./...

delve 

Air # Description: Air is a lightweight, highly configurable live-reloading tool for Go applications.
go install github.com/air-verse/air@latest

golangci-lint
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
golangci-lint run


# use go1.15.6
go get golang.org/dl/go.1.15.6
go1.15.6 download
go1.15.6 build


# postgreSQL Driver
pgx : preferred for performance, advanced features, and newer projects.
lib/pq: still popular but mostly in maintenace mode.