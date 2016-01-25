//
//  p2sPlayersListingViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/18/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayersListingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PlayerDataManagerDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var rowsArray: Array<AnyObject>? = [AnyObject]()
    var cell: p2sPlayersListingCell? = p2sPlayersListingCell()
    
    var isForSearch: Bool? = false
    var parameters: String? = ""
    var isNew: Bool = true
    
    var progressView: UIView? = UIView(frame: CGRectZero)
    
    
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
        
        //print("is for search? \(self.isForSearch!), link parameters : \(self.parameters!)")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.isNew {
            self.showActivityIndicator()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !self.isNew {
            return
        }
        
        var playerData: PlayerDataManager? = PlayerDataManager()
        playerData!.delegate = self
        playerData!.getPlayersList(self.isForSearch!, parameters: self.parameters!)
        
        self.isNew = false
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
        
        var countVoteValue: String? = player!.countVote!
        if countVoteValue! == "" {
            countVoteValue = "0"
        }
        
        var averageValue: String? = player!.average!
        if averageValue! == "" {
            averageValue = "0.0"
        }
        
        self.cell!.votesRatingsLabel.text = "\(countVoteValue!) / \(averageValue!)"
        self.cell!.nameLabel.text = "\(player!.lastName!), \(player!.firstName!)"
        self.cell!.cityStateLabel.text = "\(player!.city!), \(player!.state!)"
        self.cell!.positionLabel.text = player!.positionCode!
        
        var bgColor: UIColor = UIColor.whiteColor()
        if indexPath.row % 2 == 1 {
            bgColor = ColorsHelper.lightYellowColor()
        }
        self.cell!.changeBgColor(bgColor)
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var player: PlayersListingObject? = self.rowsArray![indexPath.row] as? PlayersListingObject
        
        let storyBoard = UIStoryboard(name: "p2sPlayerDetails", bundle: nil)
        let playerDetail: p2sPlayerDetailsViewController? = storyBoard.instantiateViewControllerWithIdentifier("playerDetails") as? p2sPlayerDetailsViewController
        playerDetail!.playerListObject = player!
        self.navigationController!.pushViewController(playerDetail!, animated: true)
    }
    
    
    //MARK: - activity indicator
    
    func showActivityIndicator() {
        
        if self.progressView != nil {
            self.progressView = nil
        }
        let activityObject: ActivityIndicatorObject? = ActivityIndicatorObject()
        self.progressView = activityObject!.activityIndicator()
        
        let width: CGFloat = self.view.frame.size.width
        let height: CGFloat = self.view.frame.size.height
        
        let xPosition: CGFloat = (width - self.progressView!.frame.size.width) / 2.0
        let yPosition: CGFloat = (height - 64.0 - self.progressView!.frame.size.height) / 2.0
        let pWidth: CGFloat = self.progressView!.frame.size.width
        let pHeight: CGFloat = self.progressView!.frame.size.height
        
        self.progressView!.frame = CGRectMake(xPosition, yPosition, pWidth, pHeight)
        self.view.addSubview(self.progressView!)
    }
    
    func hideActivityIndicator() {
        self.progressView!.removeFromSuperview()
        self.progressView = nil
    }
    
    
    //MARK: - player data delegate
    
    func playersListData(data: NSData) {
        
        let dataText: String? = NSString(data: data, encoding: NSUTF8StringEncoding) as? String
        //print("player listing : \(dataText!)")
        
        self.rowsArray!.removeAll()
        var isActivityIndicatorShowing: Bool = true
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let items = json["data"] as? [[String: AnyObject]] {
                    for item in items {
                        var object: PlayersListingObject? = PlayersListingObject()
                        
                        if let personId = item["personId"] as? String {
                            object!.personId = personId
                        }
                        if let playerId = item["player_id"] as? String {
                            object!.playerId = playerId
                        }
                        if let sportId = item["sport_id"] as? String {
                            object!.sportId = sportId
                        }
                        if let firstName = item["firstName"] as? String {
                            object!.firstName = firstName
                        }
                        if let lastName = item["lastName"] as? String {
                            object!.lastName = lastName
                        }
                        if let position = item["positionCode"] as? String {
                            object!.positionCode = position
                        }
                        if let city = item["city"] as? String {
                            object!.city = city
                        }
                        if let state = item["state"] as? String {
                            object!.state = state
                        }
                        if let uniformNumber = item["uniformNumber"] as? String {
                            object!.uniformNumber = uniformNumber
                        }
                        if let sumVote = item["sumVote"] as? String {
                            object!.sumVote = sumVote
                        }
                        if let countVote = item["countVote"] as? String {
                            object!.countVote = countVote
                        }
                        if let avg = item["avg"] as? String {
                            object!.average = avg
                        }
                        if let twitterLink = item["twitterLink"] as? String {
                            object!.twitterLink = twitterLink
                        }
                        if let videoLink1 = item["videoLink1"] as? String {
                            object!.video1 = videoLink1
                        }
                        if let videoLink2 = item["videoLink2"] as? String {
                            object!.video2 = videoLink2
                        }
                        if let videoLink3 = item["videoLink3"] as? String {
                            object!.video3 = videoLink3
                        }
                        if let videoLink4 = item["videoLink4"] as? String {
                            object!.video4 = videoLink4
                        }
                        if let videoLink5 = item["videoLink5"] as? String {
                            object!.video5 = videoLink5
                        }
                        if let pictureIndicator = item["pictureIndicator"] as? String {
                            object!.pictureUploadedIndicator = pictureIndicator
                        }
                        if let scheduleIndicator = item["scheduleIndicator"] as? String {
                            object!.scheduleUploadedIndicator = scheduleIndicator
                        }
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            self.rowsArray!.append(object!)
                            self.tableView.reloadData()
                            
                            if self.rowsArray!.count > 0 {
                                self.messageLabel.hidden = true
                            }
                            else {
                                self.messageLabel.hidden = false
                            }
                            
                            if isActivityIndicatorShowing {
                                self.hideActivityIndicator()
                                isActivityIndicatorShowing = false
                            }
                        }
                    }
                }
            }
            catch {
                print("error serializing JSON: \(error)")
            }
        }
    }
    
    
}

