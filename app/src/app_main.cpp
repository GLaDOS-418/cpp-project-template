// from app
#include "foo.h"

// from header_only_lib
#include "adder.h"

// from static_lib 
#include "subtracter.h"

// from dynamic_lib
#include "multiplier.h"

#include <iostream>

int main() {
  std::cout << maths::add(foo{}.func(),2) << std::endl;
  std::cout << maths::sub(foo{}.func(),2) << std::endl;
  std::cout << maths::mul(foo{}.func(),2) << std::endl;
}
