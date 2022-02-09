The Big Five:
class the_answer

destructor
~the_answer() = default;

move constructor
the_answer &operat=(the_answer &&) noexcept = default;

move assignment operator
the_answer (the_answer &&) noexcept = default;

copy constructor
the_answer &operat=(const the_answer &) = default;

copy assignment operator
the_answer (const the_answer &) noexcept = default;

# class can only be moved if copy constructor and copy assignment operator assign to delete
the_answer &operat=(const the_answer &) = delete;
the_answer (const the_answer &) noexcept = delete;

#include <iostream>
class the_answer {
    int m_answer();
public:
    the_answer() = default;
    explicit the_answer(int answer) : m_answer{answer} { }
public:
    ~the_answer(){
        if(m_answer != 0) {
            std::cout << "The answer is: " << m_answer<< '\n';
        }
    }
    the_answer (the_answer &&) noexcept {
        *this = std:move(other);
    }
    the_answer &operat=(the_answer &&) noexcept {
        if (&other == this){
            return *this;
        }
        m_answer = std::exchange(other.m_answer, 0);
        return *this;
    }
    the_answer (const the_answer &) noexcept = default;
    the_answer &operat=(const the_answer &) = default;
}

using std::unique_ptr, our class becomes a move-only class whether we like it or not.
every class that includes a move-only class as a member also becomes a move-only class itself. 

reference qualified member function
class l-value function is function with & at the end.
class r-value function is function with && at the end.
l-value refers to memory location which identifies an object.
r-value refers to data value that is stored at some address in memory.
std:move() will convert an l-value into an r-value
std:forward() cast the parameter back to its original reference type.

Copying a class requires the ability to copy the contents of a class, which in some cases, could be impossible. 
Moving a class assumes that the class is allowed to exit in a potentially invalid state.
EX, std:unique_ptr, when moved, takes on a nullptr value, which is invalid. 

make A non-movable class that we cannot copy can overcome these types of issues.
the_answer &operat=(the_answer &&) noexcept = default;
the_answer (the_answer &&) noexcept = default;
the_answer &operat=(const the_answer &) = default;
the_answer (const the_answer &) noexcept = default;

Substitution Failure Is Not An Error(SFINAE)
Explain: When the compiler attempts to take a given type and match it to a template, if a failure occurs, the compiler will not generate an error. The only time an error would occur is if the compiler cannot find a suitable substitution.
std:enable_if takes the idea of SFINAE to the next step.
template<bool B,class T = void>
struct enable_if {};

template<class T>
struct enable_if<true,T>{ typedef T type;};

#include <iostream>
$include <type_traits>
template<typename T>
constexpr auto is_int(){
    return false;
}

template<>
constexpr auto is_int<int>(){
    return True;
}
template<typename T, std::enable_if_t<is_int<T>(),int> = 0>
void the_answer(T is){
    std::cout << "The answer is: " << is << '\n';
}

int main (void){
    the_answer(42);
    return 0;
}
enable_if_t, _t was added to C++17 for ::type

constexpr if statement allows us to tell the compiler that the statement I am providing should be evaluated at compile time, not at runtime. 
But we need variable in statement be const, other wise it will result in Error.

define a template function without needing to define all of the arguments.
template<typename... Args>
void foo(Args &&...args)
{}
foo("The answer is:",42)

#include<tuple>
use tuple to access one of the arguments
std::tuple t("the answer is: ",42);
std::cout << std:get<0>(t)<<std::get<1>(t)<<"\n";
return 0;

template<typename... Args>
void foo(Args &&...args)
{
    std::tuple t(std::forward<Args>(args)...);
    std::cout << std:get<0>(t) << std::get<1>(t) << "\n";
}
We create a function with a variadic parameter list. We then pass this list using std::forward() to preserve the l/r valueness to std::tuple.

Variadic parameter are not a runtime dynamic array of parameters.

make a unique pointer for variadic parameter.
template< typename T, typename...Args>
void make_unique(Args &&...args){
    return unique_ptr<T>(new T(std::forward<args>(args)...));
}
The wrapper doesn't care about the arguments being passed. The constructor for T does. 

trick that allow us to work with an unknown number of argments
we can use variadic version of sizeof...(Args)
use the std::tuple_size<std::tuple<Args...>>
But this doesn't help us during compile time as we cannot loop through the parameters using this size information.(there is no for loop for compile time logic)

one trick we can use is called compile-time recursion.
This trick uses templates to create a recursive template function that will loop through all of the arguments in a variadic parameter list.
template<std::size_t I =0,typename ... Atgs, typename FUNCTION>
constexpr void for_each(const std:tuple<Args...> &t, FUNCTION &&func){
    if constexpr(I < sizeof..(Args)){
        func(std::get<i>(t));
        for_each<I + 1>(t,std::forward<FUNCTION>(func));
    }
}

To use this for_each()
void foo(Args &&...args){
    std::tuple t(std::forward<Args>(args)...);
    for_each(t,[](const auto &arg){std::cout<<arg;});
}

Using type trits to overload functions and objects.
cpp added a function called std::move_if_noexcept()
This function will cast as an r-value if the move constructor/assignment operator cannot throw.
cast as an l-value if the move constructor/assignment operator can throw.


why use "\n" instead of endl, because endl causes a flushing of the output buffer everytime it is called, "\n" does not.

A mutex is an object that is used to guard a shared resource.
std::mutex has a lock() function and an unlock() function.
The lock function acquires access to a shared resource.
unlock() releases this previously acquired access.

any attempt to execute the lock() function after another thread has already executed lock() will result in the thread having to wait until the unlock() function is executed.

How wait is implemented depends on the operating system. 
The wait() function can loop forever until integer becomes 0, which is called a spinlock.
The code in between the lock() and unlock() functions is called the critical region.
Any code in the critical region can only be executed by one thread at any given time.

synchronization # Ensuring shared resources do not become corrupt by controlling access to the shared resource.

deadlock occurs when a thread enters an endless wait state when calling the lock() function.

deadlock is often extremely difficult to debug and is the result of several resons:
* a thread never calling unlock() due to programmer error or the thread that acquired the mutex crashing.
* The same thread calling the lock() function more than once before it calls unlock()
* Each thread locking more than one mutex in a different order.

instead of littering your code with try/catch blocks to prevent deadlock.
cpp provides an std::lock_guard object to simplify the use of the std::mutex object.
std::lock_guard lock(m); #calls the lock() function on the mutex when it is created and then calls unlock() on the mutex when it is destroyed.
RAII (Resource Acquisition Is Initialization)
No matter how the function returns(either from a normal return or an exception), the mutex will always be released.

std::lock_guard is capable of preventing deadlock in cases where unlock() is never called, but it is not capable of preventing deadlock from occurring in cases where lock() is called by the same thread more than once prior to unlock()
To handle this scenario, cpp provides std::recursive_mutex.

to resolve attempt read is massive compare to attempt write.
std::shared_mutex m{};
use std::share_lock lock(m) # for attempt read.
use shd::unique_lock lock(m) # for attempt write.

std::timed_mutex m{};
using namespace std::chrono;
m.try_lock_for(seconds(1))

using atomic data types
atomic data types provide the ability to read and write simple data types without the need for thread synchronization.

incrementing an integer :
int i = 0;
auto tmp = i;
tmp++;
i = tmp; // i == 1

atomic data types are limited to simple data types, such as integers. 
These data types are extremely complicated to implement.
the only operations that are supported are simple operations such as add, subtract, increment, and decrement.
#include <atomic>
std::atomic<int> atomic_count{};

auto a1 = std::async(std::launch::async,foo);
auto a2 = std::async(std::launch::async,foo);
auto a3 = std::async(std::launch::async,foo);
auto a4 = std::async(std::launch::async,foo);
# run four foo function in parallel precompute

auto a1 = std::async(std::launch::deferred,foo);
auto a2 = std::async(std::launch::deferred,foo);
auto a3 = std::async(std::launch::deferred,foo);
auto a4 = std::async(std::launch::deferred,foo);
# run four foo function in parallel lazy function, 
will only run the function if the a1,a2,a3,a4 was called.

c++ promise is an argument to a c++ thread.
c++ future is the return value of the thread.

CV(const and volatile) type qualifiers
const # defines that the type is constant. 
volatile # defines that the type is volatile. 
const object # Non-mutable subobject of a const object.
volatile object # mutable subobject of a const-volatile object.
const volatile object # non-mutable subobject of a const volatile object.

parent: const object 
child : const object: Non-mutables subobject of const object

parent: volatile object 
child : volatile object: subobject of volatile object
child : const volatile object: a const subobject of volatile object

parent: const volatile object:
child : volatile object: Mutable subobject of const volatile object
child : const volatile object: Non-Mutable subobject of const volatile object

reference/potiner to unqualified type can be converted to reference/potiner to const
reference/potiner to unqualified type can be converted to reference/potiner to volatile
reference/potiner to unqualified type can be converted to reference/potiner to const volatile
reference/potiner to const type can be converted to reference/potiner to const volatile
reference/potiner to volatile type can be converted to reference/potiner to const volatile

Hayai, a cpp based benchmarking library on github.
Valgrind, a programming tool for memory debugging.
ASAN, the address snitizer.
UBSAN, the undefined behavior sanitizer.
use #ifndef NDEFBUG to conditionally execute additional checks

test-driven development states that all tests including unit tests, should be written before any source code is written.

behavioral-driven development takes test-driven development a step further with a specific, story-driven approach to unit testing.

catch2 unit-test library.
#define CATCH_CONFIG_MAIN
#include <catch.hpp>
TEST_CASE("case name"){
    CHECK_NOTHROW(func());
    REQUIRE_NOTHROW(func());
    CHECK_THROWS(func());
    CHECK_THROWS_AS(func());
    CHECK_THROWS_WITH(func());
    REQUIRE_THROWS(func());
    REQUIRE_THROWS_AS(func());
    REQUIRE_THROWS_WITH(func());
}
