C++ library

#include <iostream>
cin,cout,cerr,clog,
wcin,wcoutwcerr,wclog

#include <string>
to_string

#include <list>
#include <vector>
vector

# 1 byte
bool , char , char8_t , unsigned char , signed char , __int8	
# 2 bytes
char16_t , __int16 , short , unsigned short , wchar_t , __wchar_t	
# 4 bytes
char32_t , float , __int32 , int , unsigned int , long , unsigned long	
# 8 bytes
double , __int64 , long double , long long , unsigned long long	


size_t # the unsigned integer 8 bytes 

Eigen::Matrix<double,-1,-1>

Matrix4d // Matrix 4*4 double
Matrix3d // Matrix 3*3 double
Matrix2d // Matrix 2*3 double

MatrixXd M(n,m) // Matrix n,m

typedef Matrix<double,Dynamic,Dynamic> MatrixXd;

typedef Matrix<int,Dynamic,1> VectorXi
