//
//  JsonLinks.swift
//  Test5
//
//  Created by Liu, Johnson on 12/29/15.
//  Copyright © 2015 Home Office. All rights reserved.
//

import UIKit

class JsonLinks: NSObject {
    
    static func allStatesLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/all_states.php"
    }
    
    static func allNationsLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/all_nations.php"
    }
    
    static func allSportsLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/all_sports.php"
    }
    
    static func ageRangesLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/age_ranges.php"
    }
    
    static func heightsList() -> String {
        return "http://www.mysohoplace.com/php_p2s/height_list.php"
    }
    
    static func weightsList() -> String {
        return "http://www.mysohoplace.com/php_p2s/weight_list.php"
    }
    
    
    static func userLogin() -> String {
        return "/mobile/controller/MobileLoginController/login?"
    }
    
    static func checkRegisterEmail() -> String {
        return "/mobile/controller/MobileDataController/checkRegisterEmail?"
    }
    
    static func saveRegister() -> String {
        return "/controller/RegisterController/registerFan?"
    }
    
}

