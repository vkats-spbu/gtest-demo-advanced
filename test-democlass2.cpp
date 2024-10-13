#include "gtest/gtest.h"

#include "democlass.h"

TEST(DemoCalssTest2, MyFailureTest)
{
    DemoClass demo;
    ASSERT_TRUE(demo.sayHello());
}


