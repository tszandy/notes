https://go.dev/doc/tutorial/add-a-test

https://pkg.go.dev/testing


import (
	"testing"
)

func TestMethodName(t *testing.T) {
    t.Run("${testcase_name_1}", func(t *testing.T) { ... })
}

# coverage report
go test -v -cover -coverprofile=c.out
go tool cover -html=c.out

