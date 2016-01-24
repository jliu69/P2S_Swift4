//
//  p2sPlayerVotingViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerVotingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sPlayerVotingCellDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveVotesButton: UIButton!
    
    let totalRows = 6
    var skillNamesArray: Array<String>? = [String]()
    var pointsArray: Array<String>? = [String]()
    
    var cell: p2sPlayerVotingCell? = p2sPlayerVotingCell()
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.saveVotesButton.layer.cornerRadius = 5
        self.saveVotesButton.clipsToBounds = true
        
        self.skillNamesArray = ["Skill 1", "Skill 2", "Skill 3", "Skill 4", "Skill 5", "Skill 6"]
        self.pointsArray = ["1", "2", "3", "4", "5", "1"]
        
        self.tableView.registerNib(UINib(nibName: "p2sPlayerVotingCell", bundle: nil), forCellReuseIdentifier: "CellId")
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
        
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.cell = self.tableView.dequeueReusableCellWithIdentifier("CellId") as? p2sPlayerVotingCell
        self.cell!.delegate = self
        self.cell!.rowNumber = indexPath.row
        
        if let skillName: String? = self.skillNamesArray![indexPath.row] {
            self.cell!.skillTitleLabel.text = skillName!
        }
        
        if let skillPoint: String? = self.pointsArray![indexPath.row] {
            self.cell!.skillPointsLabel.text = skillPoint!
        }
        
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
        print("... selecting, row = \(rowNumber), star value = \(starNumber)")
    }
    
}

