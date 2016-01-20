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
        
        weak var currentClass: LoginRegisterManager? = self
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
            
            if data == nil {
                self.responseToLogin(false)
            }
            else {
                let dataText = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString? as String?
                let range: NSRange = (dataText! as NSString).rangeOfString("null")
                
                if range.location != NSNotFound {
                    self.responseToLogin(false)
                }
                else {
                    if data != nil {
                        
                        do {
                            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                            
                            var personId: String? = ""
                            var firstName: String? = ""
                            var lastName: String? = ""
                            
                            if let personIdTxt = json["personId"] as! NSString as? String {
                                personId = personIdTxt
                            }
                            if let firstNameTxt = json["firstNm"] as! NSString as? String {
                                firstName = firstNameTxt
                            }
                            if let lastNameTxt = json["lastNm"] as! NSString as? String {
                                lastName = lastNameTxt
                            }
                            
                            if let status = json["message"] as! NSString as? String {
                                if status == "success" {
                                    currentClass!.saveLoginData(personId!, firstName: firstName!, lastName: lastName!)
                                    currentClass!.responseToLogin(true)
                                }
                            }
                        }
                        catch {
                            print("error serializing JSON: \(error)")
                        }
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func saveLoginData(personId: String, firstName: String, lastName: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        appDele.currentUser!.personId = personId
        appDele.currentUser!.firstName = firstName
        appDele.currentUser!.lastName = lastName
    }
    
    func responseToLogin(isSuccess: Bool) {
        delegate?.loginSuccess?(isSuccess)
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
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
        }
        
        task.resume()

    }
}

