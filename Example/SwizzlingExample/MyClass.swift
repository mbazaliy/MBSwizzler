//
//  MyClass.swift
//  SwizzlingExample
//
//  Created by Max Bazaliy on 6/5/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

import Foundation
class MyClass: NSObject {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func testWithParameter(anObject: AnyObject!) -> String! {
        return "Method with parameter\n"
    }
    
    func testMethod() -> String!{
    return "This is method\n"
    }
    
    class func testClassMethod() -> String!{
        return "This is class method\n"
    }
}

