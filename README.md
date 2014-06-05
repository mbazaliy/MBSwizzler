MBSwizzler
==========

Simple class for method swizzling in Swift. Check example for more details

Swizzle NSDictionary methods:
NSDictionary.swizzleMethodSelector("description", withSelector: "myDescription", forClass: NSDictionary.classForCoder())

Swizzle custom class methods:
MyClass.swizzleMethodSelector("testWithParameter:", withSelector: "swizzled_testWithParameter:", forClass: MyClass.classForCoder())

Swizzle static methods:
MyClass.swizzleStaticMethodSelector("testClassMethod", withSelector: "my_testClassMethod", forClass: MyClass.classForCoder())

Note: Swizzler works for custom class that inherit from NSObject