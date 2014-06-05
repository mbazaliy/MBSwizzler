MBSwizzler
==========

Simple class for method swizzling in Swift. Check example for more details

Swizzle NSDictionary methods: ```Swift
NSDictionary.swizzleMethodSelector("description", withSelector: "myDescription", forClass: NSDictionary.classForCoder())```

Swizzle custom class methods:
```SwiftMyClass.swizzleMethodSelector("testWithParameter:", withSelector: "swizzled_testWithParameter:", forClass: MyClass.classForCoder())```

Swizzle static methods:
```SwiftMyClass.swizzleStaticMethodSelector("testClassMethod", withSelector: "my_testClassMethod", forClass: MyClass.classForCoder())```

Note: Custom class should inherit from **NSObject**
