console.log("Hello World!"); # Writing into the browser console

console.table();

alert("Hi there!"); # Writing into an alert box

prompt("Hi! How are you?");


# variables types
var # Declares a variable

let # Declares a block variable
Variables defined with let cannot be Redeclared.
Variables defined with let must be Declared before use.
Variables defined with let have Block Scope.

const # Declares a block constant
Variables defined with const cannot be Redeclared.
Variables defined with const cannot be Reassigned.
Variables defined with const have Block Scope.

if # Marks a block of statements to be executed on a condition
switch # Marks a block of statements to be executed in different cases
for # Marks a block of statements to be executed in a loop
function # Declares a function
return # Exits a function
try # Implements error handling to a block of statements

# data types
let length = 16;                               // Number
let lastName = "Johnson";                      // String
let x = {firstName:"John", lastName:"Doe"};    // Object
let x = ["Saab", "Volvo", "BMW"];              // Object
let x;                                         // undefined

Arithmetic Operators
+          # Addition
-          # Subtraction
*          # Multiplication
**         # Exponentiation (ES2016)
/          # Division
%          # Modulus (Division Remainder)
++         # Increment
--         # Decrement

Assignment Operators
=          # x = y   x = y
+=         # x += y  x = x + y
-=         # x -= y  x = x - y
*=         # x *= y  x = x * y
/=         # x /= y  x = x / y
%=         # x %= y  x = x % y
**=        # x **= y x = x ** y

Comparison Operators
==         # equal to
===        # equal value and equal type
!=         # not equal
!==        # not equal value or not equal type
>          # greater than
<          # less than
>=         # greater than or equal to
<=         # less than or equal to
?          # ternary operator

Logical Operators
&&         # logical and
||         # logical or
!          # logical not

Type Operators
typeof     # Returns the type of a variable
instanceof # Returns true if an object is an instance of an object type

Bitwise Operators
&          # AND
|          # OR
~          # NOT
^          # XOR
<<         # left shift
>>         # right shift
>>>        # unsigned right shift


?.         # Optional Chaining
delete     # Property Delete

Relational Operators
in         # Property in Object    "PI" in Math
instanceof # Instance of Object    x instanceof Array

function name(parameter1, parameter2, parameter3) {
  // code to be executed
}

isNaN(variable) # determine if a variable is NaN.
 

# iterate through hashmap


It is true that JavaScript supports overriding not overloading. When you define multiple functions 
which has the same name, the last one defined will override all the previously defined ones and 
every time when you invoke a function, the last defined one will get executed.

def f1(arg1,arg2){
  return arguments.length
}

f1.name # return function name in string
eval('f1') # return function reference of function with name f1


Karma - Test Runner for Javascript

Qunit - JavaScript unit testing framework.

Funcunit - enhances assertion libraries like QUnit and Jasmine, enabling them to simulate user actions, easily test asynchronous behavior

Grunt - JavaScript task runner


# Object get length
Object.keys(${object_variable}).length

# access environment variable
process.env.${environment_variable}

# setTimeout is a function that run code after delay
setTimeout(code)
setTimeout(code, delay)

setTimeout(functionRef)
setTimeout(functionRef, delay)
setTimeout(functionRef, delay, param1)
setTimeout(functionRef, delay, param1, param2)
setTimeout(functionRef, delay, param1, param2, /* … ,*/ paramN)
