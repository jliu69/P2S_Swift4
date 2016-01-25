//
//  p2sPlayerVotingViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerVotingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sPlayerVotingCellDelegate, PlayerDataManagerDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveVotesButton: UIButton!
    
    var userId: String? = ""
    var playerId: String? = ""
    var sportId: String? = ""
    
    var playerData: PlayerDataManager? = PlayerDataManager()
    
    var votingDataArray: Array<AnyObject>? = [AnyObject]()
    var cell: p2sPlayerVotingCell? = p2sPlayerVotingCell()
    var votingDirectionary: Dictionary<String, String>? = [String: String]()
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.playerData!.delegate = self
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        self.userId = appDele.currentUser!.personId!
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.saveVotesButton.layer.cornerRadius = 5
        self.saveVotesButton.clipsToBounds = true
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayerVotingCell", bundle: nil), forCellReuseIdentifier: "CellId")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for i in 0..<self.votingDataArray!.count {
            var data: VotesDataObject? = self.votingDataArray![i] as? VotesDataObject
            self.votingDirectionary![data!.skillCode!] = "0"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - IB action
    
    @IBAction func closeAction(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func saveVotesAction(sender: AnyObject) {
        
        //-- save voting value
        
        //print(" ")
        //print("... voting stars : \(self.votingDirectionary!) ")
        
        var skillCodeList = "\(userId!)/\(playerId!)/\(sportId!)?"
        var count = 0
        
        for (kind, value) in self.votingDirectionary! {
            if count == 0 {
                skillCodeList = skillCodeList + "skill\(kind)=\(value)"
            }
            else {
                skillCodeList = skillCodeList + "&skill\(kind)=\(value)"
            }
            count++
        }
        
        //print(" ")
        //print("... save voting parameters : \(skillCodeList) ")
        
        self.playerData!.saveVotingData(skillCodeList)
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.votingDataArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sPlayerVotingCell
        self.cell!.delegate = self
        self.cell!.rowNumber = indexPath.row
        
        var data: VotesDataObject? = self.votingDataArray![indexPath.row] as? VotesDataObject
        self.cell!.skillTitleLabel.text = data!.skillCode
        self.cell!.skillPointsLabel.text = self.votingDirectionary![data!.skillCode!]
        
        self.cell!.accessoryType = UITableViewCellAccessoryType.None
        self.cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return self.cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - voting cell delegate
    
    func didVoteWithValues(rowNumber: Int, starNumber: Int) {
        
        var data: VotesDataObject? = self.votingDataArray![rowNumber] as? VotesDataObject
        self.votingDirectionary![data!.skillCode!] = String(starNumber)
        self.tableView.reloadData()
        
    }
    
}

