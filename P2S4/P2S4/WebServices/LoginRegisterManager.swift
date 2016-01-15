//
//  LoginRegisterManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/15/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol LoginRegisterManagerDelegate {
    
    optional func loginSuccess(successFlag: Bool)
    
}


class LoginRegisterManager: NSObject {
    
    var delegate: LoginRegisterManagerDelegate! = nil
    
    func loginUser(email: String, password: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        let linkBody = JsonLinks.userLogin()
        let parameter = "userName=\(email)&password=\(password)"
        let loginUrl = "\(linkHeader)\(linkBody)\(parameter)"
        
        let url = NSURL(string: loginUrl)
        let data = NSData(contentsOfURL: url!)
        
        var loginSuccess: Bool = false
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if appDele.currentUser == nil {
                appDele.currentUser = CurrentUserObject()
            }
            
            if let personId = json["personId"] as! NSString as? String {
                appDele.currentUser!.personId = personId
            }
            if let firstName = json["firstNm"] as! NSString as? String {
                appDele.currentUser!.firstName = firstName
            }
            if let lastName = json["lastNm"] as! NSString as? String {
                appDele.currentUser!.lastName = lastName
            }
            if let status = json["message"] as! NSString as? String {
                if status == "success" {
                    loginSuccess = true
                }
            }
        }
        catch {
            print("error serializing JSON: \(error)")
        }
        
        delegate?.loginSuccess?(loginSuccess)
    }
    
    
    
}
