//
//  p2sRegSaveViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


class p2sRegSaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sRegSaveCellDelegate, p2sSelectsViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    var cell: p2sRegSaveCell? = p2sRegSaveCell()
    
    
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
    
    func didCompleteReigster() {
        
        //-- save data here
        
        let key = RegisterSave.notificationKey
        NSNotificationCenter.defaultCenter().postNotificationName(key, object: self)
    }
    
    func showAgeRanges() {
        
        let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
        let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
        select!.delegate = self
        select!.type = SelectionType.ageRange
        select!.pageTitle("Select Your Birth Year")
        self.presentViewController(select!, animated: true, completion: {})
    }
    
    func showStates() {
        //
    }
    
    func showNations() {
        //
    }
    
    
    //MARK: - selection delegate
    
    func didSelectItem(type: String, name: String, code: String) {
        //
    }
    
    
}

