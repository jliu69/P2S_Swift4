//
//  ViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/6/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, p2sSettingsViewControllerDelegate, p2sLoginViewControllerDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    
    @IBOutlet weak var selectSportButton: UIButton!
    @IBOutlet weak var selectStateButton: UIButton!
    @IBOutlet weak var selectPositionButton: UIButton!
    @IBOutlet weak var showTopButton: UIButton!
    @IBOutlet weak var searchPlayersButton: UIButton!
    
    @IBOutlet weak var totalViewedLabel: UILabel!
    @IBOutlet weak var totalRatedLabel: UILabel!
    
    let enableColor = UIColor.blackColor()
    let disableColor = UIColor.grayColor()
    
    var login: p2sLoginViewController? = p2sLoginViewController()
    
    //-- testing
    var isShowing: Bool = false
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- show login
        self.showLogin()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem.customView = logoView
        
        //-- button corners
        self.selectSportButton.layer.cornerRadius = 5
        self.selectSportButton.clipsToBounds = true
        
        self.selectStateButton.layer.cornerRadius = 5
        self.selectStateButton.clipsToBounds = true
        
        self.selectPositionButton.layer.cornerRadius = 5
        self.selectPositionButton.clipsToBounds = true
        
        self.showTopButton.layer.cornerRadius = 5
        self.showTopButton.clipsToBounds = true
        
        self.searchPlayersButton.layer.cornerRadius = 5
        self.searchPlayersButton.clipsToBounds = true
        
        //-- clear data
        isShowing = false
        self.hidePage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB action
    
    @IBAction func showSettings(sender: AnyObject) {
        
        let settingStoryboard: UIStoryboard = UIStoryboard(name: "p2sSettings", bundle: nil)
        let settingVC = settingStoryboard.instantiateViewControllerWithIdentifier("settings") as! p2sSettingsViewController
        settingVC.delegate = self
        self.navigationController!.pushViewController(settingVC, animated: true)
        
    }
    
    @IBAction func selectSportAction(sender: AnyObject) {
        //
        print("-> select a sport")
    }
    
    @IBAction func selectStateActon(sender: AnyObject) {
        //
        print("-> select a state")
    }
    
    @IBAction func selectPositionAction(sender: AnyObject) {
        //
        print("-> select a position")
    }
    
    @IBAction func showTopAction(sender: AnyObject) {
        //
        print("-> show top 10")
    }
    
    @IBAction func searchPlayersAction(sender: AnyObject) {
        //
        print("-> search players")
    }
    
    //MARK: - settings delegate
    
    func didLogout() {
        self.showLogin()
    }
    
    //MARK: - login delegates
    
    func didCloseLogin() {
        self.closeLogin()
    }
    
    //MARK: - login methods
    
    func showLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "p2sLogin", bundle: nil)
        self.login = storyBoard.instantiateViewControllerWithIdentifier("login") as? p2sLoginViewController
        self.login?.delegate = self
        self.presentViewController(self.login!, animated: true, completion: nil)
    }
    
    func closeLogin() {
        self.login!.dismissViewControllerAnimated(true, completion: nil)
        self.login = nil
    }

    //MARK: - local methods
    
    func hidePage() {
        
        self.totalViewedLabel.text = ""
        self.totalRatedLabel.text = ""
        
        self.selectStateButton.setTitleColor(disableColor, forState: UIControlState.Normal)
        self.selectStateButton.setTitleColor(disableColor, forState: UIControlState.Highlighted)
        self.selectStateButton.enabled = false
        self.selectStateButton.userInteractionEnabled = false
        
        self.selectPositionButton.setTitleColor(disableColor, forState: UIControlState.Normal)
        self.selectPositionButton.setTitleColor(disableColor, forState: UIControlState.Highlighted)
        self.selectPositionButton.enabled = false
        self.selectPositionButton.userInteractionEnabled = false
        
        self.showTopButton.setTitleColor(disableColor, forState: UIControlState.Normal)
        self.showTopButton.setTitleColor(disableColor, forState: UIControlState.Highlighted)
        self.showTopButton.enabled = false
        self.showTopButton.userInteractionEnabled = false
        
        self.searchPlayersButton.setTitleColor(disableColor, forState: UIControlState.Normal)
        self.searchPlayersButton.setTitleColor(disableColor, forState: UIControlState.Highlighted)
        self.searchPlayersButton.enabled = false
        self.searchPlayersButton.userInteractionEnabled = false
    }
    
    func showPage() {
        
        self.totalViewedLabel.text = "0"
        self.totalRatedLabel.text = "0"
        
        self.selectStateButton.setTitleColor(enableColor, forState: UIControlState.Normal)
        self.selectStateButton.setTitleColor(enableColor, forState: UIControlState.Highlighted)
        self.selectStateButton.enabled = true
        self.selectStateButton.userInteractionEnabled = true
        
        self.selectPositionButton.setTitleColor(enableColor, forState: UIControlState.Normal)
        self.selectPositionButton.setTitleColor(enableColor, forState: UIControlState.Highlighted)
        self.selectPositionButton.enabled = true
        self.selectPositionButton.userInteractionEnabled = true
        
        self.showTopButton.setTitleColor(enableColor, forState: UIControlState.Normal)
        self.showTopButton.setTitleColor(enableColor, forState: UIControlState.Highlighted)
        self.showTopButton.enabled = true
        self.showTopButton.userInteractionEnabled = true
        
        self.searchPlayersButton.setTitleColor(enableColor, forState: UIControlState.Normal)
        self.searchPlayersButton.setTitleColor(enableColor, forState: UIControlState.Highlighted)
        self.searchPlayersButton.enabled = true
        self.searchPlayersButton.userInteractionEnabled = true
    }
    
    
}

