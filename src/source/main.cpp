#include <iostream>
#include <string>

#include "main.hpp"
#include "tmp.hpp"

int factorial(int n) { return n==0?1:n*factorial(n-1); }

int main(   ){
    A a;
    a.x = 42;
    std::cout << factorial(5) << "helloworld" << a.x << std::endl;

    std::cout << some::myclass::method() << std::endl;
    return 0;
}