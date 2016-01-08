//
//  SettingsViewController.swift
//  Test7
//
//  Created by Liu, Johnson on 1/6/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit
import MessageUI


@objc protocol p2sSettingsViewControllerDelegate {
    
    optional func didLogout()
}


class p2sSettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    
    var delegate: p2sSettingsViewControllerDelegate! = nil
    
    let titles: Array<String> = ["Version", "Year", "Bugs Report", "Logout"]
    let emails: Array<String> = ["johnsonliu69@outlook.com"]
    
    var descs: Array<String> = []
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- add in code for Logo Image View
        
        self.descs = ["1.0", "2015", "", ""]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB action
    
    @IBAction func close(sender: AnyObject) {
        self.closePage()
    }
    
    //MARK: - table view datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CellId")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CellId")
        }
        
        cell!.textLabel!.text = self.titles[indexPath.row]
        cell!.detailTextLabel!.text = self.descs[indexPath.row]
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        cell!.accessoryType = UITableViewCellAccessoryType.None
        
        return cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 2 {
            
            //-- show bug report
            self.bugReportEmail()
        }
        else if indexPath.row == 3 {
            
            //-- logout
            delegate?.didLogout?()
            self.closePage()
        }
    }
    
    //MARK: - send email delegate
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - local methods
    
    func closePage() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func bugReportEmail() {
        
        let mailVC = self.configEmailVC()
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailVC, animated: true, completion: nil)
        }
        else {
            let alertsHelper = AlertsHelper()
            alertsHelper.showSimpleAlert(self, alertTitle: "Warning", alertMessage: "This device cannot send out email.  Please check the settings.")
        }
        
    }
    
    func configEmailVC() -> MFMailComposeViewController {
        
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        
        mailVC.setToRecipients(self.emails)
        mailVC.setSubject("Bug Report")
        mailVC.setMessageBody("Bug report testing email, for P2S.", isHTML: false)
        
        return mailVC
    }
    

}

