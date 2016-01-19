//
//  p2sSearchPlayersViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/16/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sSearchPlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, p2sSearchPlayersCellDelegate, p2sSearchDataInputViewControllerDelegate, p2sSelectsViewControllerDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var cell: p2sSearchPlayersCell? = p2sSearchPlayersCell()
    
    var sportId: String? = ""
    var sportName: String? = ""
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.tableView.registerNib(UINib(nibName: "p2sSearchPlayersCell", bundle: nil), forCellReuseIdentifier: "CellId")
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        self.sportId = appDele.currentUser!.sportId!
        self.sportName = appDele.currentUser!.sportName!
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
        self.cell!.addSportName(self.sportName!)
        
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
        
        if selectType == SelectionType.playerName || selectType == SelectionType.schoolName {
            
            let isForSchool: Bool = selectType == SelectionType.schoolName ? true : false
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "p2sSearchDataInput", bundle: nil)
            let searchDataInput:p2sSearchDataInputViewController? = storyBoard.instantiateViewControllerWithIdentifier("searchDataInput") as? p2sSearchDataInputViewController
            searchDataInput!.delegate = self
            searchDataInput!.isForSchoolName = isForSchool
            self.presentViewController(searchDataInput!, animated: true, completion: nil)
        }
        else if selectType == SelectionType.state || selectType == SelectionType.nation || selectType == SelectionType.height || selectType == SelectionType.weight {
            
            let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
            let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
            select!.delegate = self
            select!.type = selectType
            select!.pageTitle = Constants.selectionTitle(selectType)
            
            if selectType == SelectionType.nation {
                select!.withAllOptionFlag = false
            }
            else {
                select!.withAllOptionFlag = true
            }
            self.presentViewController(select!, animated: true, completion: nil)
        }
        else if selectType == SelectionType.position {
            
            let storyBoard = UIStoryboard(name: "p2sSelect", bundle: nil)
            let select: p2sSelectsViewController? = storyBoard.instantiateViewControllerWithIdentifier("select") as? p2sSelectsViewController
            select!.delegate = self
            select!.type = SelectionType.position
            select!.parameters = "sportId=\(self.sportId!)"
            select!.withAllOptionFlag = true
            select!.pageTitle = Constants.selectionTitle(selectType)
            self.presentViewController(select!, animated: true, completion: nil)
        }
    }
    
    func searchWithData(data: SearchPlayerObject) {
        
        //
        
        print("... ")
        print("... search criteria")
        print("... ")
        print("... first name  = '\(data.firstName!)' ")
        print("... last name   = '\(data.lastName!)' ")
        print("... school name = '\(data.school!)' ")
        print("... state    = '\(data.state!)' ")
        print("... country  = '\(data.nation!)' ")
        print("... position = '\(data.position!)' ")
        print("... height   = '\(data.height!)' ")
        print("... weight   = '\(data.weight!)' ")
        print("... ")
    }
    
    
    //MARK: - player & school delegate
    
    func didEnterPlayName(firstName: String, lastName: String) {
        self.cell!.selectedPlayerName(firstName, lastName: lastName)
    }
    
    func didEnterSchooName(schoolName: String) {
        self.cell!.selectedSchoolName(schoolName)
    }
    
    
    //MARK: - selection delegate
    
    func didSelectItem(type: String, name: String, code: String) {
        
        switch (type) {
        case SelectionType.state:
            self.cell!.selectedStateCode(code)
            break
        case SelectionType.nation:
            self.cell!.selectedNationCode(code)
            break
        case SelectionType.position:
            self.cell!.selectedPositionCode(code)
            break
        case SelectionType.height:
            self.cell!.selectedHeightCode(code)
            break
        case SelectionType.weight:
            self.cell!.selectedWeightCode(code)
            break
        default:
            break
        }
    }
    
    
}

