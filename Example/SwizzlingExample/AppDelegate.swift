//
//  AppDelegate.swift
//  SwizzlingExample
//
//  Created by Max Bazaliy on 6/4/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

import UIKit

extension NSDictionary {
    func swizzled_Description() -> String!{
        println("in swizzled_description")
        return "\nTest 1. Hooked description \n" + swizzled_Description();
    }
}

extension MyClass {
    func swizzled_testWithParameter(anObject: AnyObject!) -> String!{
        
        println("\nTest 2. testWithParameter hooked, argument object = \(anObject)")
        
        return swizzled_testWithParameter(anObject);
    }
}

extension MyClass {
    class func swizzled_testClassMethod() -> String!{
        return "\nTest 3. testClassMethod hooked \n" + swizzled_testClassMethod()
    }
}

extension NSString {
    class func swizzled_defaultCStringEncoding() -> UInt {
        println("\nTest 4. NSString hooked \n")
        return UInt(9999)
    }
    
    class func foo() {
        println("\nReal foo \n")
    }
    
    class func swizzled_foo() {
        println("\nSwizzled foo \n")
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        self.window!.rootViewController = UIViewController(nibName: nil, bundle: nil)
        //swizzleNSDictionaryMethods()
        //swizzleCustomClassMethods()
        //swizzleCustomClassStaticMethods()
        swizzleNSStringClassStaticMethods()
        return true
    }

    
    func swizzleNSDictionaryMethods() {
        var dict:NSDictionary = ["SomeObject": "some"]

        NSDictionary.swizzleMethodSelector("description", withSelector: "swizzled_Description", forClass: NSDictionary.classForCoder())
        
        println(dict.description) //Check
    }
    
    func swizzleCustomClassMethods() {
        var custom: MyClass = MyClass(title: "Custom")
        
        MyClass.swizzleMethodSelector("testWithParameter:", withSelector: "swizzled_testWithParameter:", forClass: MyClass.classForCoder())
        
        println(custom.testWithParameter("Param1")) //Check
    }

    func swizzleCustomClassStaticMethods() {
        MyClass.swizzleStaticMethodSelector("testClassMethod", withSelector: "swizzled_testClassMethod", forClass: MyClass.classForCoder())
        println(MyClass.testClassMethod()) //Check
    }
    
    func swizzleNSStringClassStaticMethods() {
        NSString.swizzleStaticMethodSelector("defaultCStringEncoding", withSelector: "swizzled_defaultCStringEncoding", forClass: NSString.classForCoder())
        println(NSString.defaultCStringEncoding())
        
        NSString.swizzleStaticMethodSelector("foo", withSelector: "swizzled_foo", forClass: NSString.classForCoder())
        println(NSString.foo())
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

