//
//  p2sPlayerDetailsViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sPlayerDetailsCellDelegate, PlayerDataManagerDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var progressView: UIView? = UIView(frame: CGRectZero)
    var cell: p2sPlayerDetailsCell? = p2sPlayerDetailsCell()
    var isNew: Bool = true
    var playerListObject: PlayersListingObject? = PlayersListingObject()
    var playerData: PlayerDataManager? = PlayerDataManager()
    
    var votingDataArray: Array<AnyObject>? = [AnyObject]()
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayerDetailsCell", bundle: nil), forCellReuseIdentifier: "CellId")
        
        self.playerData!.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !self.isNew {
            return
        }
        
        let profileImageParameters = "\(self.playerListObject!.playerId!)/1"
        self.playerData!.playerProfileImage(profileImageParameters)
        
        let parameters = "personId=\(self.playerListObject!.playerId!)&sportId=\(self.playerListObject!.sportId!)"
        self.playerData!.playerDetailsAndVotingsInfo(false, parameters: parameters)
        
        self.isNew = false
        self.showActivityIndicator()
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
        self.cell!.displayData(self.playerListObject!)
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
    
    
    //MARK: - details cell delegate
    
    func didShowLinks(link: String, isTwitter: Bool) {
        
        let storyBoard = UIStoryboard(name: "p2sPlayerWeb", bundle: nil)
        let playerWeb: p2sPlayerWebViewController? = storyBoard.instantiateViewControllerWithIdentifier("webView") as? p2sPlayerWebViewController
        playerWeb!.urlLink = link
        playerWeb!.isTwitterLink = isTwitter
        self.navigationController!.pushViewController(playerWeb!, animated: true)
    }
    
    func didShowVotingPage() {
        
        let storyBoard = UIStoryboard(name: "p2sPlayerVoting", bundle: nil)
        let playerVoting: p2sPlayerVotingViewController? = storyBoard.instantiateViewControllerWithIdentifier("playerVoting") as? p2sPlayerVotingViewController
        playerVoting!.votingDataArray = self.votingDataArray!
        playerVoting!.playerId = self.playerListObject!.playerId!
        playerVoting!.sportId = self.playerListObject!.sportId!
        self.navigationController!.pushViewController(playerVoting!, animated: true)
    }
    
    
    //MARK: - details data delegate
    
    func playerDetailsData(data: NSData) {
        
        let dataText: String? = NSString(data: data, encoding: NSUTF8StringEncoding) as? String
        //print(" ")
        //print("player details : \(dataText!)")
        //print(" ")
        
        let range: NSRange = (dataText! as NSString).rangeOfString("-1")
        if range.location != NSNotFound {
            dispatch_async(dispatch_get_main_queue()) {
                self.hideActivityIndicator()
            }
            return
        }
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let items = json["data"] as? [[String: AnyObject]] {
                    for item in items {
                        //var object: PlayersListingObject? = PlayersListingObject()
                        
                        if let position1 = item["position1"] as? String {
                            self.playerListObject!.position1 = position1
                        }
                        if let position2 = item["position2"] as? String {
                            self.playerListObject!.position1 = position2
                        }
                        if let position3 = item["position3"] as? String {
                            self.playerListObject!.position1 = position3
                        }
                        
                        if let schoolClass = item["class"] as? String {
                            self.playerListObject!.schoolClass = schoolClass
                        }
                        if let height = item["height"] as? String {
                            self.playerListObject!.height = height
                        }
                        if let weight = item["weight"] as? String {
                            self.playerListObject!.weight = weight
                        }
                        
                        if let scheduleFlag = item["scheduleFlag"] as? String {
                            self.playerListObject!.scheduleUploadedIndicator = scheduleFlag
                        }
                        
                        if let video1 = item["video1"] as? String {
                            self.playerListObject!.video1 = video1
                        }
                        if let video2 = item["video2"] as? String {
                            self.playerListObject!.video2 = video2
                        }
                        if let video3 = item["video3"] as? String {
                            self.playerListObject!.video3 = video3
                        }
                        if let video4 = item["video4"] as? String {
                            self.playerListObject!.video3 = video4
                        }
                        if let video5 = item["video5"] as? String {
                            self.playerListObject!.video5 = video5
                        }
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            self.cell!.displayData(self.playerListObject!)
                        }
                    }
                }
            }
            catch {
                print("error serializing JSON: \(error)")
            }
        }
        
        let parameters = "playerId=\(self.playerListObject!.playerId!)&sportId=\(self.playerListObject!.sportId!)"
        self.playerData!.playerDetailsAndVotingsInfo(true, parameters: parameters)
    }
    
    func playerVotingsData(data: NSData) {
        
        //let dataText: String? = NSString(data: data, encoding: NSUTF8StringEncoding) as? String
        //print("player votings : \(dataText!)")
        //print(" ")
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let items = json["data"] as? [[String: AnyObject]] {
                    
                    for item in items {
                        var votesData: VotesDataObject? = VotesDataObject()
                        
                        if let code = item["skillCode"] as? String {
                            votesData!.skillCode = code
                        }
                        if let votes = item["votes"] as? String {
                            votesData!.votesValue = votes
                        }
                        if let total = item["total"] as? String {
                            votesData!.totalVoting = total
                        }
                        self.votingDataArray!.append(votesData!)
                    }
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        self.cell!.votingData(self.votingDataArray!)
                        self.hideActivityIndicator()
                    }
                }
            }
            catch {
                print("error serializing JSON: \(error)")
            }
        }
    }
    
    func profileImageData(data: NSData) {
        
        if let image = UIImage(data: data) {
            self.cell!.showProfileImage(image)
        }
        else {
            self.cell!.showProfileImage(UIImage(named: "default_person.gif")!)
        }
    }
    
}

