Built-in string type: 
    string.
Built-in boolean type: 
    bool.
Built-in numeric types:
    int8, uint8 (byte), int16, uint16, int32 (rune), uint32, int64, uint64, int, uint, uintptr.
    float32, float64.
    complex64, complex128.


pointer types - C pointer alike.
struct types - C struct alike.
function types - functions are first-class types in Go.
container types:
array types - fixed-length container types.
slice type - dynamic-length and dynamic-capacity container types.
map types - maps are associative arrays (or dictionaries). The standard Go compiler implements maps as hashtables.
channel types - channels are used to synchronize data among goroutines (the green threads in Go).
interface types - interfaces play a key role in reflection and polymorphism.


*T         // a pointer type
[5]T       // an array type
[]T        // a slice type
map[Tkey]T // a map type

// a struct type
struct {
	name string
	age  int
}

// a function type
func(int) (bool, string)

// an interface type
interface {
	Method0(string) int
	Method1() (int, bool)
}

// some channel types
chan T
chan<- T
<-chan T


// Define a solo new type.
type NewTypeName SourceType

// Define multiple new types together.
type (
	NewTypeName1 SourceType1
	NewTypeName2 SourceType2
)