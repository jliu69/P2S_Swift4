//
//  Login4ViewController.swift
//  Test7
//
//  Created by Johnson Liu on 1/7/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit


class p2sLoginViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sLoginCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let movingSpace: CGFloat = 15.0
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    //var originalYCenter:CGFloat = 0.0
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if screenHeight == self.iPhone4Height {
            self.isSmallScreen = true
        }
        
        self.tableView.registerNib(UINib(nibName: "p2sLoginCell", bundle: nil), forCellReuseIdentifier: "CellId")
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
    
    func didSuccessfulLogin() {
        //
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didGotoRegister() {
        //
        let storyBoard: UIStoryboard = UIStoryboard(name: "p2sRegister", bundle: nil)
        let reg3Page: p2sRegisterViewController? = storyBoard.instantiateViewControllerWithIdentifier("register") as? p2sRegisterViewController
        self.presentViewController(reg3Page!, animated: true, completion: nil)
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
    
}

