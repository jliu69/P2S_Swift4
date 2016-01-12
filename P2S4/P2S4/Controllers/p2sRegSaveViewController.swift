//
//  p2sRegSaveViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


class p2sRegSaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sRegSaveCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    
    
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
        
        let cell:p2sRegSaveCell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as! p2sRegSaveCell
        cell.delegate = self
        cell.checkForSmallScreenSize(self.isSmallScreen)
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
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
        
        let key = Constants.registerSaveNotificationKey()
        NSNotificationCenter.defaultCenter().postNotificationName(key, object: self)
    }
    
    
}

