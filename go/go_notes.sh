# install go
https://go.dev/doc/install

# golang Standard library
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
file://./go_fmt_notes.sh
https://pkg.go.dev/fmt

flag
https://pkg.go.dev/flag

sync 
https://pkg.go.dev/sync

log
https://pkg.go.dev/log

os
https://pkg.go.dev/os



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
goimports # go get golang.org/x/tools/cmd/goimports
golint
gofmt # a tool that automatically formats Go source code.

# initalize go module
go mod init ${module_name}

# start a go project and create a go hello world
go mod init main
go build go_hello_world.go
./go_hello_world

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

for index, value := range (array|slice){
    
}

The length and capacity of a slice s can be obtained using the expressions len(s) and cap(s).


# datatype slice
Slices are similar to arrays, but are more powerful and flexible. Like arrays, slices are also used to store multiple values of the same type in a single variable. However, unlike arrays, the length of a slice can grow and shrink as you see fit.

# datatype array 
The type [n]T is an array of n values of type T.
var a [10]int # declares a variable a as an array of ten integers.

# arrays have a fixed size, while slices are dynamically-sized and provide more flexibility

# interface represent any type in go

# Constants
true false iota nil


# iota
const (
    _  = iota             // ignore the first value by assigning to blank identifier
    KB = 1 << (10 * iota) // 1 << (10*1) = 1024
    MB = 1 << (10 * iota) // 1 << (10*2) = 1048576
    GB = 1 << (10 * iota) // 1 << (10*3) = 1073741824
)

func main() {
    fmt.Println(KB) // Output: 1024
    fmt.Println(MB) // Output: 1048576
    fmt.Println(GB) // Output: 1073741824
}
const (
    x = iota // x = 0
    y = iota // y = 1
)

const (
    a = iota // a = 0
    b = iota // b = 1
)

Bitwise Operators
& (bitwise AND): Takes two numbers as operands and does AND on every bit of two numbers. The result of AND is 1 only if both bits are 1.
| (bitwise OR): Takes two numbers as operands and does OR on every bit of two numbers. The result of OR is 1 any of the two bits is 1.
^ (bitwise XOR): Takes two numbers as operands and does XOR on every bit of two numbers. The result of XOR is 1 if the two bits are different.
<< (left shift): Takes two numbers, left shifts the bits of the first operand, the second operand decides the number of places to shift.
>> (right shift): Takes two numbers, right shifts the bits of the first operand, the second operand decides the number of places to shift.
&^ (AND NOT): This is a bit clear operator.

“=”(Simple Assignment): This is the simplest assignment operator. This operator is used to assign the value on the right to the variable on the left.
“+=”(Add Assignment): This operator is a combination of ‘+’ and ‘=’ operators. This operator first adds the current value of the variable on left to the value on the right and then assigns the result to the variable on the left.
“-=”(Subtract Assignment): This operator is a combination of ‘-‘ and ‘=’ operators. This operator first subtracts the current value of the variable on left from the value on the right and then assigns the result to the variable on the left.
“*=”(Multiply Assignment): This operator is a combination of ‘*’ and ‘=’ operators. This operator first multiplies the current value of the variable on left to the value on the right and then assigns the result to the variable on the left.
“/=”(Division Assignment): This operator is a combination of ‘/’ and ‘=’ operators. This operator first divides the current value of the variable on left by the value on the right and then assigns the result to the variable on the left.
“%=”(Modulus Assignment): This operator is a combination of ‘%’ and ‘=’ operators. This operator first modulo the current value of the variable on left by the value on the right and then assigns the result to the variable on the left.
“&=”(Bitwise AND Assignment): This operator is a combination of ‘&’ and ‘=’ operators. This operator first “Bitwise AND” the current value of the variable on the left by the value on the right and then assigns the result to the variable on the left.
“^=”(Bitwise Exclusive OR): This operator is a combination of ‘^’ and ‘=’ operators. This operator first “Bitwise Exclusive OR” the current value of the variable on left by the value on the right and then assigns the result to the variable on the left.
“|=”(Bitwise Inclusive OR): This operator is a combination of ‘|’ and ‘=’ operators. This operator first “Bitwise Inclusive OR” the current value of the variable on left by the value on the right and then assigns the result to the variable on the left.
“<<=”(Left shift AND assignment operator): This operator is a combination of ‘<<’ and ‘=’ operators. This operator first “Left shift AND” the current value of the variable on left by the value on the right and then assigns the result to the variable on the left.
“>>=”(Right shift AND assignment operator): This operator is a combination of ‘>>’ and ‘=’ operators. This operator first “Right shift AND” the current value of the variable on left by the value on the right and then assigns the result to the variable on the left.
