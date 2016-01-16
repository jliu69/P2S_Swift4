//
//  p2sRegSaveViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


class p2sRegSaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sRegSaveCellDelegate, p2sSelectsViewControllerDelegate, LoginRegisterManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    var cell: p2sRegSaveCell? = p2sRegSaveCell()
    
    var selectedAgeRange: String? = ""
    var selectedState: String? = ""
    var selectedNation: String? = "US"
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "p2sRegSaveCell", bundle: nil), forCellReuseIdentifier: "CellId")
        
        if screenHeight == self.iPhone4Height {
            self.isSmallScreen = true
        }
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
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sRegSaveCell
        self.cell!.delegate = self
        self.cell!.checkForSmallScreenSize(self.isSmallScreen)
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: - cell delegate
    
    func didGoback() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didReigsterWithData(firstName: String, lastName: String, gender: String, city: String, savePwd: Bool) {
        
        if !self.checkValidation(firstName, lastName: lastName, city: city) {
            return
        }
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let email: String? = appDele.currentUser!.email
        let password: String? = appDele.currentUser!.password
        
        //-- save password
        if savePwd {
            NSUserDefaults.standardUserDefaults().setValue(email!, forKey: UserDefaultKeys.savedUserEmail)
            NSUserDefaults.standardUserDefaults().setValue(password!, forKey: UserDefaultKeys.savedUserPassword)
        }
        else {
            NSUserDefaults.standardUserDefaults().setValue("", forKey: UserDefaultKeys.savedUserEmail)
            NSUserDefaults.standardUserDefaults().setValue("", forKey: UserDefaultKeys.savedUserPassword)
        }
        
        //-- save data here
        let loginRegisterManager: LoginRegisterManager? = LoginRegisterManager()
        loginRegisterManager!.delegate = self
        loginRegisterManager!.saveRegistration(email!, password: password!, lastName: lastName, firstName: firstName, gender: gender, ageRange: self.selectedAgeRange!, city: city, stateCode: self.selectedState!, nationCode: self.selectedNation!)
        
        //-- close all login & register pages
        let key = RegisterSave.notificationKey
        NSNotificationCenter.defaultCenter().postNotificationName(key, object: self)
    }
    
    func showAgeRanges() {
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.ageRange
        select!.pageTitle = "Select Your Birth Year"
        self.presentViewController(select!, animated: true, completion: {})
    }
    
    func showStates() {
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.state
        select!.pageTitle = "Select Your State/Province"
        self.presentViewController(select!, animated: true, completion: {})
    }
    
    func showNations() {
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.nation
        select!.pageTitle = "Select Your Country"
        self.presentViewController(select!, animated: true, completion: {})
    }
    
    
    //MARK: - selection delegate
    
    func didSelectItem(type: String, name: String, code: String) {
        
        switch (type) {
        case SelectionType.ageRange:
            self.selectedAgeRange = code
            break
        case SelectionType.state:
            self.selectedState = code
            break
        case SelectionType.nation:
            self.selectedNation = code
            break
        default:
            break
        }
        
        self.cell!.editButton(type, value: code)
    }
    
    
    //MARK: - local method
    
    func checkValidation(firstName: String, lastName: String, city: String) -> Bool {
        
        let alertHelper: AlertsHelper? = AlertsHelper()
        
        if firstName == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "First name cannot be empty.")
            return false
        }
        
        if lastName == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Last name cannot be empty.")
            return false
        }
        
        if selectedAgeRange! == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Need to choose an age range.")
            return false
        }
        
        if city == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "City cannot be empty.")
            return false
        }
        
        if selectedState! == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Need to choose a state.")
            return false
        }
        
        if selectedNation! == "" {
            alertHelper!.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "Need to choose a country.")
            return false
        }
        
        return true
    }
    
}

