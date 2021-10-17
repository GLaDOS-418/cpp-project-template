#include "tmp_test.hpp"
#include "tmp.hpp"

TEST_CASE("test example") {
    REQUIRE(some::myclass::method() == "---foobar---");
}