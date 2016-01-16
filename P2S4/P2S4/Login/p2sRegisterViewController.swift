//
//  p2sRegister3ViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


class p2sRegisterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sRegisterCellDelegate, LoginRegisterManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let movingSpace: CGFloat = 85.0
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if screenHeight == self.iPhone4Height {
            self.isSmallScreen = true
        }
        
        self.tableView.registerNib(UINib(nibName: "p2sRegisterCell", bundle: nil), forCellReuseIdentifier: "CellId")
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
        
        let cell:p2sRegisterCell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as! p2sRegisterCell
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
    
    func didCancelRegister() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didGotoNextPage(email: String, password: String, password2: String) {
        
        let alertHelper: AlertsHelper? = AlertsHelper()
        let emailHelper: EmailsHelper? = EmailsHelper()
        
        if email == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Email cannot be empty.")
            self.validateResult(false)
        }
        else if !emailHelper!.validateEmail(email) {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Email is not valid.")
            self.validateResult(false)
        }
        else if password == "" || password2 == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Password cannot be empty.")
            self.validateResult(false)
        }
        else if password != password2 {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Two passwords are not match.")
            self.validateResult(false)
        }
        else {
            let loginRegisterManager: LoginRegisterManager? = LoginRegisterManager()
            loginRegisterManager!.delegate = self
            loginRegisterManager!.checkRegisterEmail(email)
        }
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
    
    func showWarningMessage(title: String, message: String) {
        
        let alertHelper: AlertsHelper? = AlertsHelper()
        alertHelper!.showSimpleAlert(self, alertTitle: title, alertMessage: message)
    }
    
    
    //MARK: - login register delegate
    
    func isEmailExisted(isExisted: Bool) {
        
        if isExisted {
            let alertHelper: AlertsHelper? = AlertsHelper()
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Email is already existed.")
            self.validateResult(false)
        }
        else {
            self.validateResult(true)
        }
    }
    
    //MARK: - validation
    
    func validateResult(isValid: Bool) {
        
        if !isValid {
            return
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "p2sRegSave", bundle: nil)
        let regSave: p2sRegSaveViewController? = storyBoard.instantiateViewControllerWithIdentifier("regSave") as? p2sRegSaveViewController
        self.presentViewController(regSave!, animated: true, completion: nil)
    }
    
}

