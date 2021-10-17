#include <iostream>
#include <string>

#include "main.hpp"
#include "tmp.hpp"

#include "Poco/MD5Engine.h"
#include "Poco/DigestStream.h"

int factorial(int n) { return n==0?1:n*factorial(n-1); }


 #include <iostream>

 int _main(){
     Poco::MD5Engine md5;
     Poco::DigestOutputStream ds(md5);
     ds << "abcdefghijklmnopqrstuvwxyz";
     ds.close();
     std::cout << Poco::DigestEngine::digestToHex(md5.digest()) << std::endl;
     return 0;
 }

int main(   ){
    A a;
    a.x = 42;
    std::cout << factorial(5) << "helloworld" << a.x << std::endl;

    std::cout << some::myclass::method() << std::endl;
    _main( );
    return 0;
}