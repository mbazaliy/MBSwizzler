//
//  Ext.h
//  SwizzlingExample
//
//  Created by Corinne Krych on 18/08/14.
//  Copyright (c) 2014 Home. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef SwizzlingExample_Ext_h
#define SwizzlingExample_Ext_h


#endif

@interface MyClassC : NSObject

@property NSString* title;

-(instancetype)initWithTitle:(NSString*)myTitle;
-(NSString*) testWithParameter:(id)AnyObject;
-(NSString*) testMethod;
+(NSString*) testClassMethod;
+(BOOL)swizzleMethodSelector:(SEL)origSelector withSelector:(SEL)withSelector forClass:(id)forClass;
@end