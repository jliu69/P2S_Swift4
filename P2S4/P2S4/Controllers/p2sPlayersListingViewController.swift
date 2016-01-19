//
//  p2sPlayersListingViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/18/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayersListingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var rowsArray: Array<AnyObject>? = [AnyObject]()
    var cell: p2sPlayersListingCell? = p2sPlayersListingCell()
    var isForSearch: Bool? = false
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.titleView.layer.borderColor = UIColor.blackColor().CGColor
        self.titleView.layer.borderWidth = 0.5
        
        let titleViewObject: TitleViewObject? = TitleViewObject()
        self.titleView.addSubview(titleViewObject!.playerListTitleView())
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayersListingCell", bundle: nil), forCellReuseIdentifier: "CellId")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //-- testing only
        var player: PlayersListingObject? = PlayersListingObject()
        
        player!.votes = 5
        player!.ratings = 9.9
        player!.firstName = "Allen"
        player!.lastName = "Jordan"
        player!.city = "New York"
        player!.state = "NY"
        player!.position = "PG"
        
        self.rowsArray!.append(player!)
        self.tableView.reloadData()
        
        
        //-- check for rows array size
        if self.rowsArray!.count > 0 {
            self.messageLabel.hidden = true
        }
        else {
            self.messageLabel.hidden = false
        }
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
        return self.rowsArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sPlayersListingCell
        
        var player: PlayersListingObject? = self.rowsArray![indexPath.row] as? PlayersListingObject
        
        self.cell!.votesRatingsLabel.text = "\(player!.votes!) / \(player!.ratings!)"
        self.cell!.nameLabel.text = "\(player!.lastName!), \(player!.firstName!)"
        self.cell!.cityStateLabel.text = "\(player!.city!), \(player!.state!)"
        self.cell!.positionLabel.text = player!.position!
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let storyBoard = UIStoryboard(name: "p2sPlayerDetails", bundle: nil)
        let playerDetail: p2sPlayerDetailsViewController? = storyBoard.instantiateViewControllerWithIdentifier("playerDetails") as? p2sPlayerDetailsViewController
        self.navigationController!.pushViewController(playerDetail!, animated: true)
    }
    
}

