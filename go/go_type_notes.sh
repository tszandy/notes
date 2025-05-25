Built-in string type: 
	string.
Built-in boolean type: 
	bool.
Built-in numeric types:
	Integer Numbers:
		int8, uint8 (byte), int16, uint16, int32 (rune), uint32, int64, uint64, int, uint, uintptr.
	Floating-Point Numbers:
		float32, float64.
	Complex Numbers:
		complex64, complex128.


Type name Value range
int8 –128 to 127
int16 –32768 to 32767
int32 –2147483648 to 2147483647
int64 –9223372036854775808 to 9223372036854775807
uint8 0 to 255
uint16 0 to 65536
uint32 0 to 4294967295
uint64 0 to 18446744073709551615

float32 provides approximately six decimal digits of precision;
float64 provides about 15 digits; 
float64 should be preferred for most purposes because float32 computations accumulate error rapidly unless one is quite careful.

Type name	Largest absolute value	Smallest (nonzero) absolute value
float32	3.40282346638528859811704183484516925440e+38	1.401298464324817070923729583289916131280e-45
float64	1.797693134862315708145274237317043567981e+308	4.940656458412465441765687928682213723651e-324

complex64 uses float32 values to represent the real and imaginary part
complex128 uses float64 values to represent the real and imaginary part

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

Arrays and structs are aggregate types; their values are concatenations of other values in mem-ory. 
Arrays are homogeneous-their elements all have the same type-whereas structs are heterogeneous. 
Both arrays and structs are fixed size. 
In contrast, slices and maps are dynamic data structures that grow as values are added.

make([]T, len)
make([]T, len, cap) // same as make([]T, cap)[:len]
