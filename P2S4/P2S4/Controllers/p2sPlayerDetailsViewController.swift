//
//  p2sPlayerDetailsViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sPlayerDetailsCellDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var cell: p2sPlayerDetailsCell? = p2sPlayerDetailsCell()
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayerDetailsCell", bundle: nil), forCellReuseIdentifier: "CellId")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB action
    
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
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sPlayerDetailsCell
        self.cell!.delegate = self
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - details cell delegate
    
    func didShowVotingPage() {
        
        let storyBoard = UIStoryboard(name: "p2sPlayerVoting", bundle: nil)
        let playerVoting: p2sPlayerVotingViewController? = storyBoard.instantiateViewControllerWithIdentifier("playerVoting") as? p2sPlayerVotingViewController
        self.navigationController!.pushViewController(playerVoting!, animated: true)
    }
    
}

