Sequence Containers
    std::vector: Dynamic array.
    std::deque: Double-ended queue.
    std::list: Doubly linked list.
    std::forward_list: Singly linked list.
    std::array: Static array (fixed size).

Associative Containers
    std::set: Unique keys in a sorted order.
    std::map: Key-value pairs, sorted by key.
    std::multiset: Allows duplicate keys, sorted order.
    std::multimap: Allows duplicate keys, key-value pairs.

Unordered Associative Containers
    std::unordered_set: Unique keys, hashed.
    std::unordered_map: Key-value pairs, hashed.
    std::unordered_multiset: Duplicate keys, hashed.
    std::unordered_multimap: Duplicate keys, hashed key-value pairs.

Iterators provide a way to access and traverse elements in containers:
    Types: input_iterator, output_iterator, forward_iterator, bidirectional_iterator, and random_access_iterator.
    Header: <iterator>

Algorithms work on ranges of elements provided by iterators. They include operations like:
    Searching: std::find, std::binary_search.
    Sorting: std::sort, std::stable_sort.
    Modifying: std::copy, std::transform, std::replace.
    Others: std::accumulate, std::unique, std::reverse.
    Header: <algorithm>

Smart pointers manage dynamic memory automatically:
    std::unique_ptr: Exclusive ownership.
    std::shared_ptr: Shared ownership.
    std::weak_ptr: Non-owning reference to std::shared_ptr.
    Header: <memory>

Strings
    std::string for dynamic strings.
    std::wstring for wide-character strings.
    Operations like concatenation, comparison, and substring extraction.
    Header: <string>

Input/Output
    std::cin, std::cout, and std::cerr for console I/O.
    File I/O through std::ifstream and std::ofstream.
    Header: <iostream> for streams and <fstream> for file handling.

Concurrency
    Threads: std::thread
    Synchronization: std::mutex, std::condition_variable, std::lock_guard.
    Futures and promises: std::future, std::promise.
    Header: <thread>, <mutex>, <future>.

Regular Expressions
    Classes like std::regex, std::smatch, and utilities for regex matching and searching.
    Header: <regex>.

Numeric Tools
    Numeric limits: std::numeric_limits.
    Math utilities: std::pow, std::sqrt, std::abs.
    Header: <cmath>, <numeric>.

Miscellaneous
    Random number generation: std::random_device, std::mt19937.
    Chrono library for time: std::chrono.
    Type traits and meta-programming: std::enable_if, std::is_same.



