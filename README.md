MBSwizzler
==========

Simple class for method swizzling in Swift. Check example for more details.

Swizzle NSDictionary methods:

```NSDictionary.swizzleMethodSelector("description", withSelector: "swizzled_Description", forClass: NSDictionary.classForCoder())```

Swizzle custom class methods:

```MyClass.swizzleMethodSelector("testWithParameter:", withSelector: "swizzled_testWithParameter:", forClass: MyClass.classForCoder())```

Swizzle static methods:

```MyClass.swizzleStaticMethodSelector("testClassMethod", withSelector: "swizzled_testClassMethod", forClass: MyClass.classForCoder())```

Note: Custom class should be inherited from **NSObject**
