//
//  Ext.m
//  SwizzlingExample
//
//  Created by Corinne Krych on 18/08/14.
//  Copyright (c) 2014 Home. All rights reserved.
//


#import <objc/runtime.h>
#import "Ext.h"




@implementation MyClassC

@synthesize title;

-(instancetype)initWithTitle:(NSString*)myTitle {
    self = [super init];
    if (self) {
        self.title = myTitle;
    }
    return self;
}


-(NSString*) testWithParameter:(id)AnyObject {
    return @"Method with parameter";
}

-(NSString*) swizzled_testWithParameter:(id)AnyObject {
    return @"Swizzled Method with parameter";
}

-(NSString*) testMethod {
    return @"testMethod";
}

+(NSString*) testClassMethod {
    return @"testClassMethod";
}

+(BOOL)swizzleMethodSelector:(SEL)origSelector withSelector:(SEL)withSelector forClass:(id)forClass {
    SEL originalSelector = origSelector;
    SEL swizzledSelector = withSelector;
    
    Method originalMethod = class_getInstanceMethod(forClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector);
    if (originalMethod != nil && swizzledMethod != nil) {
        method_exchangeImplementations(originalMethod, swizzledMethod);
        return YES;
    }
    return NO;
}

@end