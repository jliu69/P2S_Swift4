//
//  Login4ViewController.swift
//  Test7
//
//  Created by Johnson Liu on 1/7/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit


class p2sLoginViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sLoginCellDelegate, LoginRegisterManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let movingSpace: CGFloat = 15.0
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if screenHeight == self.iPhone4Height {
            self.isSmallScreen = true
        }
        
        self.tableView.registerNib(UINib(nibName: "p2sLoginCell", bundle: nil), forCellReuseIdentifier: "CellId")
        
        let key = RegisterSave.notificationKey
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "clearAllLoginAndRegisterPages:", name: key, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:p2sLoginCell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as! p2sLoginCell
        cell.delegate = self
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: - cell delegate
    
    func didLoginUser(email: String, password: String, savePwd: Bool) {
        
        //-- validataion
        let alertHelper: AlertsHelper? = AlertsHelper()
        if email == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Email cannot be empty.")
            return
        }
        if password == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Password cannot be empty.")
            return
        }
        
        //-- save password
        if savePwd {
            NSUserDefaults.standardUserDefaults().setValue(email, forKey: UserDefaultKeys.savedUserEmail)
            NSUserDefaults.standardUserDefaults().setValue(password, forKey: UserDefaultKeys.savedUserPassword)
        }
        else {
            NSUserDefaults.standardUserDefaults().setValue("", forKey: UserDefaultKeys.savedUserEmail)
            NSUserDefaults.standardUserDefaults().setValue("", forKey: UserDefaultKeys.savedUserPassword)
        }
        
        //-- save user info
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        appDele.currentUser!.clearData()
        appDele.currentUser!.email! = email
        appDele.currentUser!.password! = password
        
        //-- process login
        let loginRegister: LoginRegisterManager? = LoginRegisterManager()
        loginRegister!.delegate = self
        loginRegister!.loginUser(email, password: password)
    }
    
    func didGotoRegister() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "p2sRegister", bundle: nil)
        let regPage: p2sRegisterViewController? = storyBoard.instantiateViewControllerWithIdentifier("register") as? p2sRegisterViewController
        self.presentViewController(regPage!, animated: true, completion: nil)
    }
    
    func didPlayerSignIn() {
        //
    }
    
    func didResetPassword() {
        //
    }
    
    func moveCellUp() {
        
        if isSmallScreen {
            UIView.animateWithDuration(0.2, animations: {
                self.tableView.contentOffset = CGPoint(x: 0, y: self.movingSpace)
                }, completion: {
                    (value: Bool) in
                    //
            })
        }
    }
    
    func moveCellDown() {
        
        if isSmallScreen {
            UIView.animateWithDuration(0.2, animations: {
                self.tableView.contentOffset = CGPoint(x: 0, y: 0)
                }, completion: {
                    (value: Bool) in
                    //
            })
        }
    }
    
    
    //MARK: - login register delegate
    
    func loginSuccess(successFlag: Bool) {
        
        if successFlag {
            self.dismissViewControllerAnimated(true, completion: {})
        }
        else {
            let alertsHelper: AlertsHelper? = AlertsHelper()
            alertsHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Login incorrect.")
        }
    }
    
    
    
    //MARK: - register complete notification
    
    @objc func clearAllLoginAndRegisterPages(notifcation: NSNotificationCenter) {
        
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: {})
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: {})
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
}

