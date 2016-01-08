//
//  EmailsHelper.swift
//  Test7
//
//  Created by Liu, Johnson on 1/5/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit

class EmailsHelper: NSObject {
    
    func validateEmail(testStr: String) -> Bool {
        
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
}
