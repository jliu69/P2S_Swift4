//
//  p2sRegister3ViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sRegister3ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sRegister3CellDelegate {
    
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
        
        self.tableView.registerNib(UINib(nibName: "p2sRegister3Cell", bundle: nil), forCellReuseIdentifier: "CellId")
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
        
        let cell:p2sRegister3Cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as! p2sRegister3Cell
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
    
    func didGotoNextPage() {
        //
        print("-> from cell, to Register Save")
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

