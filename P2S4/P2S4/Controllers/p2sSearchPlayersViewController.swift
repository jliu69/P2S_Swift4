//
//  p2sSearchPlayersViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/16/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sSearchPlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sSearchPlayersCellDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var cell: p2sSearchPlayersCell? = p2sSearchPlayersCell()
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.tableView.registerNib(UINib(nibName: "p2sSearchPlayerCell", bundle: nil), forCellReuseIdentifier: "CellId")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB actions
    
    @IBAction func closeAction(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sSearchPlayersCell
        self.cell!.delegate = self
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - search cell delegate
    
    func displaySelection(selectType: String) {
        //
    }
    
    func searchWithData(playerName: String, schoolName: String, state: String, nation: String, position: String, height: String, weight: String) {
        
        //
    }
    
    
    
}

