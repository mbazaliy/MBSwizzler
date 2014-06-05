//
//  MBSwizzler.swift
//  SwizzlingExample
//
//  Created by Max Bazaliy on 6/5/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

import Foundation

extension NSObject {
    
    class func swizzleMethodSelector(origSelector: CString!, withSelector: CString!, forClass:AnyClass!) -> Bool {
        
        var originalMethod: Method?
        var swizzledMethod: Method?
        
        originalMethod = class_getInstanceMethod(forClass, Selector.convertFromStringLiteral(origSelector))
        swizzledMethod = class_getInstanceMethod(forClass, Selector.convertFromStringLiteral(withSelector))
        
        if (originalMethod && swizzledMethod) {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
            return true
        }
        return false
    }
    
    class func swizzleStaticMethodSelector(origSelector: CString!, withSelector: CString!, forClass:AnyClass!) -> Bool {
        
        var originalMethod: Method?
        var swizzledMethod: Method?
        
        originalMethod = class_getClassMethod(forClass, Selector.convertFromStringLiteral(origSelector))
        swizzledMethod = class_getClassMethod(forClass, Selector.convertFromStringLiteral(withSelector))
        
        if (originalMethod && swizzledMethod) {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
            return true
        }
        return false
    }
}
