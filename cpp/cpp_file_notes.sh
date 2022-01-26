#include <ofstream> # output file stream, write to files
#include <ifstream> # input file stream, read from files
#include <fstream> # file stream, both write and read files.
open (filename, mode);
ios::in      Open for input operations.
ios::out     Open for output operations.
ios::binary  Open in binary mode.
ios::ate     Set the initial position at the end of the file.
             If this flag is not set to any value, the initial position is the beginning of the file.
ios::app     All output operations are performed at the end of the file, appending the content to the current content
             of the file. This flag can only be used in streams open for output-only operations.
ios::trunc   If the file opened for output operations already existed before, its previous content is deleted and
             replaced by the new one.

class      default mode parameter
ofstream   ios::out
ifstream   ios::in
fstream    ios::in | ios::out

ofstream myfile ("example.bin", ios::out | ios::app | ios::binary);
if (myfile.is_open()) { /* ok, proceed with output */ }
myfile.close();
bad()
    Returns true if a reading or writing operation fails. For example in the case that we try to write to a file
    that is not open for writing or if the device where we try to write has no space left.
fail()
    Returns true in the same cases as bad(), but also in the case that a format error happens, like when an
    alphabetical character is extracted when we are trying to read an integer number.
eof()
    Returns true if a file open for reading has reached the end.
good()
    It is the most generic state flag: it returns false in the same cases in which calling any of the previous
    functions would return true.

tellg() and tellp()
These two member functions have no parameters and return a value of the member type pos_type,
which is an
integer data type representing the current position of the get stream pointer (in the case of tellg) or the put
stream pointer (in the case of tellp).

seekg() and seekp()
These functions allow us to change the position of the get and put stream pointers. Both functions are overloaded
with two different prototypes. The first prototype is:
seekg ( position );
seekp ( position );

seekg ( offset, direction );
seekp ( offset, direction );

ios::beg           offset counted from the beginning of the stream
ios::cur           offset counted from the current position of the stream pointer
ios::end           offset counted from the end of the stream

When we operate with file streams, these are associated to an internal buffer of type streambuf. This buffer is a
memory block that acts as an intermediary between the stream and the physical file. For example, with an
ofstream, each time the member function put (which writes a single character) is called, the character is not
written directly to the physical file with which the stream is associated. Instead of that, the character is inserted in
that stream's intermediate buffer.

When the buffer is flushed, all the data contained in it is written to the physical medium (if it is an output stream)
or simply freed (if it is an input stream). This process is called synchronization and takes place under any of the
following circumstances:

• When the file is closed: before closing a file all buffers that have not yet been flushed are synchronized
and all pending data is written or read to the physical medium.
• When the buffer is full: Buffers have a certain size. When the buffer is full it is automatically
synchronized.
• Explicitly, with manipulators: When certain manipulators are used on streams, an explicit
synchronization takes place. These manipulators are: flush and endl.
• Explicitly, with member function sync(): Calling stream's member function sync(), which takes no
parameters, causes an immediate synchronization. This function returns an int value equal to -1 if the
stream has no associated buffer or in case of failure. Otherwise (if the stream buffer was successfully
synchronized) it returns 0.