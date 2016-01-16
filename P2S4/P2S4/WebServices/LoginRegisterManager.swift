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
    optional func isEmailExisted(isExisted: Bool)
    
}


class LoginRegisterManager: NSObject {
    
    var delegate: LoginRegisterManagerDelegate! = nil
    
    //MARK: - login
    
    func loginUser(email: String, password: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        let linkBody = JsonLinks.userLogin()
        let parameter = "userName=\(email)&password=\(password)"
        let loginUrl = "\(linkHeader)\(linkBody)\(parameter)"
        
        let urlLink = (loginUrl as NSString).stringByReplacingOccurrencesOfString(" ", withString: "+") as String
        
        let url = NSURL(string: urlLink)
        let data: NSData? = NSData(contentsOfURL: url!)
        
        if data == nil {
            delegate?.loginSuccess?(false)
            return
        }
        
        let dataText = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString? as String?
        let range: NSRange = (dataText! as NSString).rangeOfString("null")
        if range.location != NSNotFound {
            delegate?.loginSuccess?(false)
            return
        }
        
        var loginSuccess: Bool = false
        if data != nil {
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
        }
        delegate?.loginSuccess?(loginSuccess)
    }
    
    
    //MARK: - check register email
    
    func checkRegisterEmail(email: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        let linkBody = JsonLinks.checkRegisterEmail()
        let parameter = "email=\(email)"
        let checkRegUrl = "\(linkHeader)\(linkBody)\(parameter)"
        
        let url = NSURL(string: checkRegUrl)
        let data = NSData(contentsOfURL: url!)
        
        let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
        let objcString: NSString = NSString(string: dataString!)
        let range = objcString.rangeOfString("-1")
        
        if range.location == NSNotFound {
            delegate?.isEmailExisted?(true)
        }
        else {
            delegate?.isEmailExisted?(false)
        }
    }
    
    
    //MARK: - save new registration
    
    func saveRegistration(email: String, password: String, lastName: String, firstName: String, gender: String, ageRange: String, city: String, stateCode: String, nationCode: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        let linkBody = JsonLinks.saveRegister()
        let parameter = "emailAddress=\(email)&passwordTxt=\(password)&firstNm=\(firstName)&lastNm=\(lastName)&gender=\(gender)&birthdayYearNbr=\(ageRange)&cityTxt=\(city)&stateTxt=\(stateCode)&zipCd=0&countryTxt=\(nationCode)"
        let regSaveUrl = "\(linkHeader)\(linkBody)\(parameter)"
        
        let urlLink = (regSaveUrl as NSString).stringByReplacingOccurrencesOfString(" ", withString: "+") as String
        
        let url = NSURL(string: urlLink)
        let data = NSData(contentsOfURL: url!)
        
        let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
        let objcString: NSString = NSString(string: dataString!)
        print("save register status : '\(objcString)' ")
    }
}

