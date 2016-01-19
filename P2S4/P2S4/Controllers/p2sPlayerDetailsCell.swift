//
//  p2sPlayerDetailsCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sPlayerDetailsCellDelegate {
    
    optional func didShowVotingPage()
}


class p2sPlayerDetailsCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playerImageView: UIImageView!
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
    
    var skillsArrary: Array? = [String]()
    var ratingsArray: Array? = [String]()
    
    var delegate: p2sPlayerDetailsCellDelegate! = nil
    
    var cell: p2sPlayerDetailsVotesCell? = p2sPlayerDetailsVotesCell()
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.playerImageView.layer.borderColor = UIColor.blackColor().CGColor
        self.playerImageView.layer.borderWidth = 0.5
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.showScheduleButton.layer.cornerRadius = 5
        self.showScheduleButton.clipsToBounds = true
        
        self.showVideoButton.layer.cornerRadius = 5
        self.showVideoButton.clipsToBounds = true
        
        self.votePlayerButton.layer.cornerRadius = 5
        self.votePlayerButton.clipsToBounds = true
        
        self.skillsArrary = ["Skill 1", "Skill 2", "Skill 3", "Skill 4", "Skill 5", "Skill 6"]
        self.ratingsArray = ["1.2", "2.3", "3.4", "4.5", "5.1", "1.3"]
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayerDetailsVotesCell", bundle: nil), forCellReuseIdentifier: "CellId")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - IB action
    
    @IBAction func showTwitterAction(sender: AnyObject) {
        //
    }
    
    @IBAction func showScheduleAction(sender: AnyObject) {
        //
    }
    
    @IBAction func showVideoAction(sender: AnyObject) {
        //
    }
    
    @IBAction func votePlayerAction(sender: AnyObject) {
        //
        
        //playerVoting
        delegate?.didShowVotingPage?()
        
    }
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.skillsArrary!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sPlayerDetailsVotesCell
        
        let skillName = self.skillsArrary![indexPath.row]
        let rating = self.ratingsArray![indexPath.row]
        
        self.cell!.skillNameLabel.text = skillName
        self.cell!.rateValueLabel.text = rating
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

