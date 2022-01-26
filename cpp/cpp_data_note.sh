https://en.cppreference.com/w/cpp/language/types#char8_t

# 1 byte
bool , char , char8_t , unsigned char , signed char , __int8	
# 2 bytes
char16_t , __int16 , short , unsigned short , wchar_t , __wchar_t	
# 4 bytes
char32_t , float , __int32 , int , unsigned int , long , unsigned long	
# 8 bytes
double , __int64 , long double , long long , unsigned long long	

# bool
    1 byte

# char 
    1 byte
    ranges from 0 to 255

# Int
    4 bytes
    ranges from -2147483648 to 2147483647. 

# size_t the unsigned integer
    8 bytes
    ranges from 0 to 18446744073709551615

# string
    32 bytes

# double
    8 bytes

75 // int
75u // unsigned int
75l // long
75ul // unsigned long

# float point number 
3.14159 // 3.14159
6.02e23 // 6.02 x 10^23
1.6e-19 // 1.6 x 10^-19
3.0 // 3.0

# data structure
struct structure_name {
member_type1 member_name1;
member_type2 member_name2;
member_type3 member_name3;
.
.
} object_names;

struct product {
int weight;
float price;
} ;
product apple;
product banana, melon;
# is equivalent to 
struct product {
int weight;
float price;
} apple, banana, melon;

# Defined data types (typedef)
typedef char C;
typedef unsigned int WORD;
typedef char * pChar;
typedef char field [50];

# Unions allow one same portion of memory to be accessed as different data types
union union_name {
member_type1 member_name1;
member_type2 member_name2;
member_type3 member_name3;
.
.
} object_names;

enum enumeration_name {
value1,
value2,
value3,
.
.
} object_names;
enum colors_t {black, blue, green, cyan, red, purple, yellow, white};
enum months_t { january=1, february, march, april,may, june, july, august, september, october, november, december} y2k;
