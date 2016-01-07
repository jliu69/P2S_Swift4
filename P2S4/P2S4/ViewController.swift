//
//  ViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/6/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    //-- testing
    var isShowing: Bool = false
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let logoImage = UIImage(named: "p2s_action_bar_logo_small.png")
        let logoImageView = UIImageView(image: logoImage!)
        logoImageView.frame = CGRect(x: 0, y: 0, width: 109, height: 44)
        logoImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.titleBarItem.customView = logoImageView
        
        
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
        
        //self.showPage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB action
    
    @IBAction func showSettings(sender: AnyObject) {
        //
        
        if isShowing {
            self.hidePage()
            isShowing = false
        }
        else {
            self.showPage()
            isShowing = true
        }
        
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

