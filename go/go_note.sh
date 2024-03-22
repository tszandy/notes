# install go
https://go.dev/doc/install

# go Standard library
https://pkg.go.dev/std

# go windows localtion
C:\Program Files\Go

# go mac location
/usr/local/go/bin/go

Go Compiler, 
The gc, 6g which is based on the plan 9 compiler toolchain
The Three Architectures supported by Go are ARM(5), X86-64(6) and i386(8)
If you are using ARM, you would use the 5g command instead of 6g to compile Go programs

The other go compiler is a front end for the GNU Compiler Collection (GCC), called gccgo.

Gc is probably the better choice Althrough gccgo is starting to produce better code.

The most obvious is that gccgo uses operating system threads to implement goroutines, and will not use segmented stacks in all configurations.
This means that creating a goroutine is as expensive as creating a thread in C. If you are writing code with a high order of parallelism, then this will make gccgo much slower than 6g.


package main
import (
        "fmt"
        "log"
        "net/http"
)
func main(){
        var a bool = true     // Boolean
        var b int = 5         // Integer
        var c float32 = 3.14  // Floating point number
        var d string = "Hi!"  // String

        fmt.Println("Boolean: ", a)
        fmt.Println("Integer: ", b)
        fmt.Println("Float:   ", c)
        fmt.Println("String:  ", d)        
        fmt.Printf("Hello World!\n")
}

# package
fmt
https://pkg.go.dev/fmt

flag
https://pkg.go.dev/flag

sync 
https://pkg.go.dev/sync

Instances of reference types in Go are created with the make() built-in function

Functions in Go are declared using the func keyword. As with variable declarations, the return type goes at the end. This can be a single value, or a list of values.

go run filename.go

variable in go
var variableName variableType
var i int
i = 42
var j int = 27
k := 99


var actorName string = "Elisabeth Sladen"
var companion string="Sarah Jane Smith"
var doctorNumber int=3
var season int = 11

var (
    actorName string = "Elisabeth Sladen"
    companion string="Sarah Jane Smith"
    doctorNumber int=3
    season int = 11
)

# go tools
gotests
gomodifytags
impl
goplay
dlv
staticcheck
gopls
goimports

# initalize go module
go mod init ${module_name}




Go is a tool for managing Go source code.

Usage:

        go <command> [arguments]

The commands are:

        bug         start a bug report
        build       compile packages and dependencies
        clean       remove object files and cached files
        doc         show documentation for package or symbol
        env         print Go environment information
        fix         update packages to use new APIs
        fmt         gofmt (reformat) package sources
        generate    generate Go files by processing source
        get         add dependencies to current module and install them
        install     compile and install packages and dependencies
        list        list packages or modules
        mod         module maintenance
        work        workspace maintenance
        run         compile and run Go program
        test        test packages
        tool        run specified go tool
        version     print Go version
        vet         report likely mistakes in packages

Use "go help <command>" for more information about a command.

Additional help topics:

        buildconstraint build constraints
        buildmode       build modes
        c               calling between Go and C
        cache           build and test caching
        environment     environment variables
        filetype        file types
        go.mod          the go.mod file
        gopath          GOPATH environment variable
        gopath-get      legacy GOPATH go get
        goproxy         module proxy protocol
        importpath      import path syntax
        modules         modules, module versions, and more
        module-get      module-aware go get
        module-auth     module authentication using go.sum
        packages        package lists and patterns
        private         configuration for downloading non-public code
        testflag        testing flags
        testfunc        testing functions
        vcs             controlling version control with GOVCS

Use "go help <topic>" for more information about that topic.

# install module
go get ${module_path}
go get github.com/playwright-community/playwright-go

go run github.com/playwright-community/playwright-go/cmd/playwright@latest install --with-deps
# Or
go install github.com/playwright-community/playwright-go/cmd/playwright@latest
playwright install --with-deps


range []int{1,2,3}

Gofmt is a tool that automatically formats Go source code.


array 
The type [n]T is an array of n values of type T.
var a [10]int # declares a variable a as an array of ten integers.
