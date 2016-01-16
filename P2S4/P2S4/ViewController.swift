//
//  ViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/6/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, p2sSettingsViewControllerDelegate, p2sSelectsViewControllerDelegate {
    
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
    
    var selectedSportName: String? = ""
    var selectedSportId: String? = ""
    var selectedStateCode: String? = ""
    var selectedPositionCode: String? = ""
    
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
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.sport
        select!.pageTitle = "Select a Sport"
        self.presentViewController(select!, animated: true, completion: {})
    }
    
    @IBAction func selectStateActon(sender: AnyObject) {
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.state
        select!.withAllOptionFlag = true
        select!.pageTitle = "Select a State/Province"
        self.presentViewController(select!, animated: true, completion: {})
    }
    
    @IBAction func selectPositionAction(sender: AnyObject) {
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.position
        select!.parameters = "sportId=\(self.selectedSportId!)"
        select!.withAllOptionFlag = true
        select!.pageTitle = "Select a Position"
        self.presentViewController(select!, animated: true, completion: {})
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
        self.hidePage()
        self.showLogin()
    }
    
    
    //MARK: - select delegate
    
    func didSelectItem(type: String, name: String, code: String) {
        
        switch (type) {
        case SelectionType.sport:
            self.changeSportButton(code, sportName: name)
            break
        case SelectionType.state:
            self.changeStateButton(code, stateName: name)
            break
        case SelectionType.position:
            self.changePositionButton(code, positionName: name)
            break
        default:
            break
        }
    }
    
    
    //MARK: - login methods
    
    func showLogin() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "p2sLogin", bundle: nil)
        let login = storyBoard.instantiateViewControllerWithIdentifier("login") as? p2sLoginViewController
        self.presentViewController(login!, animated: true, completion: nil)
    }
    
    
    //MARK: - local methods
    
    func hidePage() {
        
        self.totalViewedLabel.text = ""
        self.totalRatedLabel.text = ""
        
        self.selectedSportName = ""
        self.selectedSportId = ""
        self.selectedStateCode = ""
        self.selectedPositionCode = ""
        
        self.selectSportButton.setTitle("Select Sport (Required)", forState: UIControlState.Normal)
        self.selectSportButton.setTitle("Select Sport (Required)", forState: UIControlState.Highlighted)
        
        self.selectStateButton.setTitleColor(disableColor, forState: UIControlState.Normal)
        self.selectStateButton.setTitleColor(disableColor, forState: UIControlState.Highlighted)
        self.selectStateButton.setTitle("Select a State (Optional)", forState: UIControlState.Normal)
        self.selectStateButton.setTitle("Select a State (Optional)", forState: UIControlState.Highlighted)
        self.selectStateButton.enabled = false
        self.selectStateButton.userInteractionEnabled = false
        
        self.selectPositionButton.setTitleColor(disableColor, forState: UIControlState.Normal)
        self.selectPositionButton.setTitleColor(disableColor, forState: UIControlState.Highlighted)
        self.selectPositionButton.setTitle("Select a Position (Optional)", forState: UIControlState.Normal)
        self.selectPositionButton.setTitle("Select a Position (Optional)", forState: UIControlState.Highlighted)
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
    
    func changeSportButton(sportCode: String, sportName: String) {
        
        self.selectedSportName = sportName
        self.selectedSportId = sportCode
        
        self.selectSportButton.setTitle(sportName, forState: UIControlState.Normal)
        self.selectSportButton.setTitle(sportName, forState: UIControlState.Highlighted)
        
        self.showPage()
        
        //-- query for total view and total rate
    }
    
    func changeStateButton(stateCode: String, stateName: String) {
        
        if stateName == "ALL" {
            self.selectedStateCode = ""
            self.selectStateButton.setTitle("Select a State (Optional)", forState: UIControlState.Normal)
            self.selectStateButton.setTitle("Select a State (Optional)", forState: UIControlState.Highlighted)
        }
        else {
            self.selectedStateCode = stateCode
            self.selectStateButton.setTitle("State/Province: \(stateCode)", forState: UIControlState.Normal)
            self.selectStateButton.setTitle("State/Province: \(stateCode)", forState: UIControlState.Highlighted)
        }
    }
    
    func changePositionButton(positionCode: String, positionName: String) {
        
        if positionName == "ALL" {
            self.selectedPositionCode = ""
            self.selectPositionButton.setTitle("Select a Position (Optional)", forState: UIControlState.Normal)
            self.selectPositionButton.setTitle("Select a Position (Optional)", forState: UIControlState.Highlighted)
        }
        else {
            self.selectedPositionCode = positionCode
            self.selectPositionButton.setTitle("Position: \(positionCode)", forState: UIControlState.Normal)
            self.selectPositionButton.setTitle("Position: \(positionCode)", forState: UIControlState.Highlighted)
        }
    }
    
    
}

