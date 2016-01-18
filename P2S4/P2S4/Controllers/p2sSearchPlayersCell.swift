//
//  p2sSearchPlayersCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/16/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sSearchPlayersCellDelegate {
    
    optional func displaySelection(selectType: String)
    optional func searchWithData(playerName: String, schoolName: String, state: String, nation: String, position: String, height: String, weight: String)
}


class p2sSearchPlayersCell: UITableViewCell {
    
    @IBOutlet weak var sportNameLabel: UILabel!
    @IBOutlet weak var playerNameButton: UIButton!
    @IBOutlet weak var schoolNameButton: UIButton!
    @IBOutlet weak var selectStateButton: UIButton!
    @IBOutlet weak var selectNationButton: UIButton!
    @IBOutlet weak var selectPositionButton: UIButton!
    @IBOutlet weak var selectHeightButton: UIButton!
    @IBOutlet weak var selectWeightButton: UIButton!
    @IBOutlet weak var startSearchButton: UIButton!
    
    var delegate:p2sSearchPlayersCellDelegate! = nil
    
    var playerName: String? = ""
    var schoolName: String? = ""
    var stateCode: String? = ""
    var nationCode: String? = ""
    var positionCode: String? = ""
    var heightCode: String? = ""
    var weightCode: String? = ""
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.playerNameButton.layer.cornerRadius = 5
        self.playerNameButton.clipsToBounds = true
        
        self.schoolNameButton.layer.cornerRadius = 5
        self.schoolNameButton.clipsToBounds = true
        
        self.selectStateButton.layer.cornerRadius = 5
        self.selectStateButton.clipsToBounds = true
        
        self.selectNationButton.layer.cornerRadius = 5
        self.selectNationButton.clipsToBounds = true
        
        self.selectPositionButton.layer.cornerRadius = 5
        self.selectPositionButton.clipsToBounds = true
        
        self.selectHeightButton.layer.cornerRadius = 5
        self.selectHeightButton.clipsToBounds = true
        
        self.selectWeightButton.layer.cornerRadius = 5
        self.selectWeightButton.clipsToBounds = true
        
        self.startSearchButton.layer.cornerRadius = 5
        self.startSearchButton.clipsToBounds = true
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - IB actions
    
    @IBAction func playerNameAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.playerName)
    }
    
    @IBAction func schoolNameAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.schoolName)
    }
    
    @IBAction func selectStateAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.state)
    }
    
    @IBAction func selectNationAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.nation)
    }
    
    @IBAction func selectPositionAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.position)
    }
    
    @IBAction func selectHeightAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.height)
    }
    
    @IBAction func selectWeightAction(sender: AnyObject) {
        delegate?.displaySelection?(SelectionType.weight)
    }
    
    @IBAction func startSearchAction(sender: AnyObject) {
        delegate?.searchWithData?(self.playerName!, schoolName: self.schoolName!, state: self.stateCode!, nation: self.nationCode!, position: self.positionCode!, height: self.heightCode!, weight: self.weightCode!)
    }
    
    //MARK: - change sport name
    
    func addSportName(sportName: String) {
        self.sportNameLabel.text = "Sport : \(sportName)"
    }
    
    //MARK: - change button name
    
    func selectedPlayerName(firstName: String, lastName: String) {
        
        var title: String = ""
        
        if firstName != "" && lastName != "" {
            title = "PLAYER NAME : \(lastName), \(firstName)"
            self.playerName = "\(lastName), \(firstName)"
        }
        else if firstName == "" {
            title = "PLAYER NAME : \(lastName)"
            self.playerName = lastName
        }
        else if lastName == "" {
            title = "PLAYER NAME : \(firstName)"
            self.playerName = firstName
        }
        else {
            title = "PLAYER NAME (OPTIONAL)"
        }
        
        self.playerNameButton.setTitle(title, forState: UIControlState.Normal)
        self.playerNameButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
    func selectedSchoolName(schoolName: String) {
        
        var title: String = "SCHOOL NAME (OPTIONAL)"
        if schoolName != "" {
            title = "SCHOOL NAME : \(schoolName)"
            self.schoolName = schoolName
        }
        self.schoolNameButton.setTitle(title, forState: UIControlState.Normal)
        self.schoolNameButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
    func selectedStateCode(stateCode: String) {
        
        var title: String = "STATE/PROVINCE (OPTIONAL)"
        if stateCode != "ALL" {
            title = "STATE/PROVINCE : \(stateCode)"
            self.stateCode = stateCode
        }
        self.selectStateButton.setTitle(title, forState: UIControlState.Normal)
        self.selectStateButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
    func selectedNationCode(nationCode: String) {
        
        let title = "COUNTRY : \(nationCode)"
        self.nationCode = nationCode
        
        self.selectNationButton.setTitle(title, forState: UIControlState.Normal)
        self.selectNationButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
    func selectedPositionCode(positionCode: String) {
        
        var title: String = "POSITION (OPTIONAL)"
        if positionCode != "ALL" {
            title = "POSITION : \(positionCode)"
            self.positionCode = positionCode
        }
        self.selectPositionButton.setTitle(title, forState: UIControlState.Normal)
        self.selectPositionButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
    func selectedHeightCode(heightCode: String) {
        
        var title: String = "HEIGHT (OPTIONAL)"
        if heightCode != "ALL" {
            title = "HEIGHT : \(heightCode)"
            self.heightCode = heightCode
        }
        self.selectHeightButton.setTitle(title, forState: UIControlState.Normal)
        self.selectHeightButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
    func selectWeightCode(weightCode: String) {
        
        var title: String = "WEIGHT (OPTIONAL)"
        if weightCode != "ALL" {
            title = "WEIGHT : \(weightCode)"
            self.weightCode = weightCode
        }
        self.selectWeightButton.setTitle(title, forState: UIControlState.Normal)
        self.selectWeightButton.setTitle(title, forState: UIControlState.Highlighted)
    }
    
}

