#include "gtest/gtest.h"

#include "democlass.h"

TEST(DemoClass, SuccesHello)
{
    DemoClass demo;
    ASSERT_TRUE(demo.sayHello());
}


TEST(DemoClass, FailedHello)
{
    DemoClass demo;
    //Пример заведомо провального теста
    ASSERT_FALSE(demo.sayHello());
}
