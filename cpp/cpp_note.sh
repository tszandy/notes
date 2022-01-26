C++ library

#include <iostream> # basic input and output stream
cin,cout,cerr,clog,
wcin,wcoutwcerr,wclog

#include <sstream> #string stream

#include <string>
to_string

#include <list>
#include <vector>
vector

#include <limits>
uint32_t val = std::numeric_limits<unit32_t>::max();

Eigen::Matrix<double,-1,-1>

Matrix4d // Matrix 4*4 double
Matrix3d // Matrix 3*3 double
Matrix2d // Matrix 2*3 double

MatrixXd M(n,m) // Matrix n,m

typedef Matrix<double,Dynamic,Dynamic> MatrixXd;

typedef Matrix<int,Dynamic,1> VectorXi

template<typename T>
template<typename T，typename T2>

const # const applied to value

constexpr # const applied to functions and constructors.

static # Static data members of a class are also known as "class variables", because there is only one unique value for all the objects of that same class. Their content is not different from one object of this class to another.

friend # declare an external function as friend of a class, thus allowing this function to have access to the private and protected members of this class, we do it by declaring a prototype of this external function within the class, and preceding it with the keyword friend

// # line comment

/* block comment */

Conditional operator ( ? )
int c = (a>b) ? a : b;

The comma operator (,) is used to separate two or more expressions that are included where only one expression is expected. When the set of expressions has to be evaluated for a value, only the rightmost expression is considered.
EX: a = (b=3, b+2);

# switch statement
switch (expression)
{
case constant1:
group of statements 1;
break;
case constant2:
group of statements 2;
break;
.
.
.
default:
default group of statements
}

# goto allows to make an absolute jump to another point in the program.
int n=10;
loop:
cout << n << ", ";
n--;
if (n>0) goto loop;
cout << "FIRE!\n";
return 0;

# Bitwise Operators ( &, |, ^, ~, <<, >> )
operator  asm equivalent  description
&         AND             Bitwise AND
|         OR              Bitwise Inclusive OR
^         XOR             Bitwise Exclusive OR
~         NOT             Unary complement (bit inversion)
<<        SHL             Shift Left
>>        SHR             Shift Right

# Explicit type casting operator
int i;
float f = 3.14;
i = (int) f;

sizeof()

\n # newline
\r # carriage return
\t # tab
\v # vertical tab
\b # backspace
\f # form feed (page feed)
\a # alert (beep)
\' # single quote (')
\" # double quote (")
\? # question mark (?)
\\ # backslash (\)

& is the reference operator and can be read as "address of"
* is the dereference operator and can be read as "value pointed by"

bobby = new (nothrow) int [5]; # when a memory allocation fails, instead of throwing a bad_alloc exception or terminating the program, the pointer returned by new is a null pointer, and the program continues its execution.

delete pointer; # delete memory allocated for a single element,
delete [] pointer; # delete memory allocated for arrays of elements.

# exit is a function defined in the cstdlib library.

private # members of a class are accessible only from within other members of the same class or from their friends.
protected # members are accessible from members of their same class and from their friends, but also from members of their derived classes.
public # members are accessible from anywhere where the object is visible.

# Notice how if we declare a new object and we want to use its default constructor (the one without parameters), we do not include parentheses ()
CRectangle rectb; // right
CRectangle rectb(); // wrong!

If you do not declare any constructors in a class definition, the compiler assumes the class to have a default constructor with no arguments.
But as soon as you declare your own constructor for a class, the compiler no longer provides an implicit default constructor

expression     can be read as
*x             pointed by x
&x             address of x
x.y            member y of object x
x->y           member y of object pointed by x
(*x).y         member y of object pointed by x (equivalent to the previous one)
x[0]           first object pointed by x
x[1]           second object pointed by x
x[n]           (n+1)th object pointed by x

Overloading operators
+  -  *  /  =  <  >  +=  -=  *=  /=  <<  >>
<<=  >>=  ==  !=  <=  >=  ++  --  %  &  ^  !  |
~  &=  ^=  |=  &&  ||  %=  []  ()  ,  ->*  ->  new
delete  new[]  delete[]

# replace @ by the operator in each case
Expression    Operator               Member function         Global function
@a            + - * & ! ~ ++ --      A::operator@()          operator@(A)
a@            ++ --                  A::operator@(int)       operator@(A,int)
a@b           + - * / % ^ & | < > == 
              != <= >= << >> && || , A::operator@ (B)        operator@(A,B)
a@b           = += -= *= /= %= ^= &=
              |= <<= >>= []          A::operator@ (B)        -
a(b, c...)    ()                     A::operator() (B, C...) -
a->x          ->                     A::operator->()         -
# Where a is an object of class A, b is an object of class B and c is an object of class C.

this # represents a pointer to the object whose member function is being executed

class daughter: protected mother;
This would set protected as the maximum access level for the members of daughter that it inherited from
mother. That is, all members that were public in mother would become protected in daughter. Of course, this
would not restrict daughter to declare its own public members. That maximum access level is only set for the
members inherited from mother.

In principle, a derived class inherits every member of a base class except:
• its constructor and its destructor
• its operator=() members
• its friends

Multiple inheritance
class CRectangle: public CPolygon, public COutput;
class CTriangle: public CPolygon, public COutput;

virtual # placeholder function for furture function.

# Abstract base classes
class CPolygon {
  protected:
    int width, height;
  public:
    void set_values (int a, int b)
      { width=a; height=b; }
    virtual int area () =0;
};
how we appended =0 to virtual int area () instead of specifying an implementation for the function.
This type of function is called a pure virtual function, and all classes that contain at least one pure virtual function
are abstract base classes.

four specific casting operators: dynamic_cast, reinterpret_cast, static_cast and const_cast.
dynamic_cast <new_type> (expression)
dynamic_cast can be used only with pointers and references to objects. Its purpose is to ensure that the result of
the type conversion is a valid complete object of the requested class.
dynamic_cast is always successful when we cast a class to one of its base classes.

reinterpret_cast <new_type> (expression)
reinterpret_cast converts any pointer type to any other pointer type, even of unrelated classes. The operation
result is a simple binary copy of the value from one pointer to the other. All pointer conversions are allowed:
neither the content pointed nor the pointer type itself is checked.
class A {};
class B {};
A * a = new A;
B * b = reinterpret_cast<B*>(a);
This is valid C++ code, although it does not make much sense, since now we have a pointer that points to an
object of an incompatible class, and thus dereferencing it is unsafe.

static_cast <new_type> (expression)
static_cast can perform conversions between pointers to related classes, not only from the derived class to its
base, but also from a base class to its derived. This ensures that at least the classes are compatible if the proper
object is converted, but no safety check is performed during runtime to check if the object being converted is in
fact a full object of the destination type. Therefore, it is up to the programmer to ensure that the conversion is
safe. On the other side, the overhead of the type-safety checks of dynamic_cast is avoided.

const_cast <new_type> (expression)
This type of casting manipulates the constness of an object, either to be set or to be removed. For example, in
order to pass a const argument to a function that expects a non-constant parameter:
// const_cast
#include <iostream>
using namespace std;
void print (char * str)
{
cout << str << endl;
}
int main () {
const char * c = "sample text";
print ( const_cast<char *> (c) );
return 0;
}

typeid # allows to check the type of an expression:
typeid (expression)
EX: typeid(a).name()

macro           value 
__LINE__        Integer value representing the current line in the source code file being compiled.
__FILE__        A string literal containing the presumed name of the source file being compiled.
__DATE__        A string literal in the form "Mmm dd yyyy" containing the date in which the compilation process began.
__TIME__        A string literal in the form "hh:mm:ss" containing the time at which the compilation process began.
__cplusplus     An integer value. All C++ compilers have this constant defined to some value. If the compiler is fully
                compliant with the C++ standard its value is equal or greater than 199711L depending on the version
                of the standard they comply.


class A {
    public:
    A();
    A(int);
    A(const char*, int = 0);
}
The following declarations are legal
A c = 1;
A d = "Venditti";

But if 
class A {
    public:
    explicit A();
    explicit A(int);
    explicit A(const char*, int = 0);
}
the previous declarations would be illegal.

