# install go
https://go.dev/doc/install

# go windows localtion
C:\Program Files\Go

Go Compiler, 
The gc, 6g which is based on the plan 9 compiler toolchain
The Three Architectures supported by Go are ARM(5), X86-64(6) and i386(8)
If you are using ARM, you would use the 5g command instead of 6g to compile Go programs

The other go compiler is a front end for the GNU Compiler Collection (GCC), called gccgo.

Gc is probably the better choice Althrough gccgo is starting to produce better code.

The most obvious is that gccgo uses operating system threads to implement goroutines, and will not use segmented stacks in all configurations.
This means that creating a goroutine is as expensive as creating a thread in C. If you are writing code with a high order of parallelism, then this will make gccgo much slower than 6g.


package main
import "fmt"
func main(){
    fmt.Printf("Hello World!\n")
}

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