#include <stdexcept>

std::out_of_range()
std::runtime_error()
std:bad_alloc

#include <exception>

class exception_example: public std::exception
{
public:
    /** Constructor (C strings).
     *  @param message C-style string error message.
     *                 The string contents are copied upon construction.
     *                 Hence, responsibility for deleting the char* lies
     *                 with the caller. 
     */
    explicit exception_example(const char* message)
        : msg_(message) {}

    /** Constructor (C++ STL strings).
     *  @param message The error message.
     */
    explicit exception_example(const std::string& message)
        : msg_(message) {}

    /** Destructor.
     * Virtual to allow for subclassing.
     */
    virtual ~exception_example() noexcept {}

    /** Returns a pointer to the (constant) error description.
     *  @return A pointer to a const char*. The underlying memory
     *          is in posession of the Exception object. Callers must
     *          not attempt to free the memory.
     */
    virtual const char* what() const noexcept {
       return msg_.c_str();
    }

protected:
    /** Error message.
     */
    std::string msg_;
};

throw exception_example("message");

If a function is marked with noexcept, It is not allowed to throw an exception and if it does, std::terminate() will be called.
