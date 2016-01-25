//
//  p2sPlayerDetailsCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sPlayerDetailsCellDelegate {
    
    optional func didShowLinks(link: String, isTwitter: Bool)
    optional func didShowVotingPage()
}


class p2sPlayerDetailsCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var positionsListLabel: UILabel!
    @IBOutlet weak var uniformNumberLabel: UILabel!
    @IBOutlet weak var currentRateLabel: UILabel!
    @IBOutlet weak var thumbsImageView: UIImageView!
    @IBOutlet weak var twitterLinkLabel: UILabel!
    @IBOutlet weak var scheduleCodeLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var classYearLabel: UILabel!
    @IBOutlet weak var noScheduleLabel: UILabel!
    @IBOutlet weak var noVideoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showScheduleButton: UIButton!
    @IBOutlet weak var showVideoButton: UIButton!
    @IBOutlet weak var votePlayerButton: UIButton!
    
    var rowsArray: Array<AnyObject>? = [AnyObject]()
    
    var delegate: p2sPlayerDetailsCellDelegate! = nil
    var cell: p2sPlayerDetailsVotesCell? = p2sPlayerDetailsVotesCell()
    
    var playerVideoLink: String? = ""
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.playerImageView.layer.borderColor = UIColor.blackColor().CGColor
        self.playerImageView.layer.borderWidth = 0.5
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.noScheduleLabel.layer.cornerRadius = 5
        self.noScheduleLabel.clipsToBounds = true
        self.noScheduleLabel.layer.borderColor = UIColor.blackColor().CGColor
        self.noScheduleLabel.layer.borderWidth = 0.5
        
        self.noVideoLabel.layer.cornerRadius = 5
        self.noVideoLabel.clipsToBounds = true
        self.noVideoLabel.layer.borderColor = UIColor.blackColor().CGColor
        self.noVideoLabel.layer.borderWidth = 0.5
        
        self.showScheduleButton.layer.cornerRadius = 5
        self.showScheduleButton.clipsToBounds = true
        
        self.showVideoButton.layer.cornerRadius = 5
        self.showVideoButton.clipsToBounds = true
        
        self.votePlayerButton.layer.cornerRadius = 5
        self.votePlayerButton.clipsToBounds = true
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayerDetailsVotesCell", bundle: nil), forCellReuseIdentifier: "CellId")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - display data
    
    func displayData(playerListObject: PlayersListingObject?) {
        
        let fullname = "\(playerListObject!.firstName!) \(playerListObject!.lastName!)"
        self.fullNameLabel.text = fullname
        
        self.positionLabel.text = playerListObject!.position1!
        
        let cityState = "\(playerListObject!.city!), \(playerListObject!.state!)"
        self.cityStateLabel.text = cityState
        
        self.scheduleCodeLabel.text = playerListObject!.school!
        
        let positionsList = "Positions: xx, xx, xx"
        self.positionsListLabel.text = positionsList
        
        let uniformText = "Uniform Number: \(playerListObject!.uniformNumber!)"
        self.uniformNumberLabel.text = uniformText
        
        let currentRate = "Current Rating: \(playerListObject!.average!)"
        self.currentRateLabel.text = currentRate
        
        self.twitterLinkLabel.text = playerListObject!.twitterLink!
        
        let scheduleFlag = "Schedule: \(playerListObject!.scheduleUploadedIndicator!)"
        self.scheduleCodeLabel.text = scheduleFlag
        
        var heightValue = playerListObject!.height!
        heightValue = (heightValue as NSString).stringByReplacingOccurrencesOfString("\\'", withString: "\"")
        heightValue = "Hi: \(heightValue)'"
        self.heightValueLabel.text = heightValue
        
        let weightValue = "Wt: \(playerListObject!.weight!) lbs"
        self.weightValueLabel.text = weightValue
        
        let schoolClass = "Class: \(playerListObject!.schoolClass!)"
        self.classYearLabel.text = schoolClass
        
        
        if playerListObject!.scheduleUploadedIndicator! == "" {
            self.showScheduleButton.enabled = false
            self.showScheduleButton.userInteractionEnabled = false
            self.showScheduleButton.hidden = true
        }
        else {
            self.showScheduleButton.enabled = true
            self.showScheduleButton.userInteractionEnabled = true
            self.showScheduleButton.hidden = false
        }
        
        if playerListObject!.video1 != "" {
            self.playerVideoLink = playerListObject!.video1!
        }
        else if playerListObject!.video2 != "" {
            self.playerVideoLink = playerListObject!.video2!
        }
        else if playerListObject!.video3 != "" {
            self.playerVideoLink = playerListObject!.video3!
        }
        else if playerListObject!.video4 != "" {
            self.playerVideoLink = playerListObject!.video4!
        }
        else if playerListObject!.video5 != "" {
            self.playerVideoLink = playerListObject!.video5!
        }
        
        if self.playerVideoLink == ""  {
            self.showVideoButton.enabled = false
            self.showVideoButton.userInteractionEnabled = false
            self.showVideoButton.hidden = true
        }
        else {
            self.showVideoButton.enabled = true
            self.showVideoButton.userInteractionEnabled = true
            self.showVideoButton.hidden = false
        }
    }
    
    func votingData(votesDataArray: Array<AnyObject>) {
        self.rowsArray = votesDataArray
        self.tableView.reloadData()
    }
    
    //MARK: - profile image
    
    func showProfileImage(image: UIImage) {
        self.playerImageView.image = image
    }
    
    //MARK: - IB action
    
    @IBAction func showTwitterAction(sender: AnyObject) {
        delegate?.didShowLinks?(self.twitterLinkLabel.text!, isTwitter: true)
    }
    
    @IBAction func showScheduleAction(sender: AnyObject) {
        //
    }
    
    @IBAction func showVideoAction(sender: AnyObject) {
        delegate?.didShowLinks?(self.playerVideoLink!, isTwitter: false)
    }
    
    @IBAction func votePlayerAction(sender: AnyObject) {
        delegate?.didShowVotingPage?()
    }
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowsArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sPlayerDetailsVotesCell
        
        let votesData: VotesDataObject? = self.rowsArray![indexPath.row] as? VotesDataObject
        self.cell!.displayVotesData(votesData!)
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

