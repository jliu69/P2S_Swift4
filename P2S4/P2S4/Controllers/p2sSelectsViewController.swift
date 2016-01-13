//
//  p2sSelectsViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/13/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sSelectsViewControllerDelegate {
    
    optional func didSelectItem(type: String, name: String, code: String)
}


class p2sSelectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    
    var delegate: p2sSelectsViewControllerDelegate! = nil
    
    var type: String? = ""
    var rowsArray: Array<AnyObject>? = [AnyObject]()
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
        self.tableView.layer.borderWidth = 0.5
        
        self.cancelButton.layer.cornerRadius = 5
        self.cancelButton.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - set title
    
    func pageTitle(aTitle: String) {
        
        print("title label: '\(aTitle)'")
        
        if let label = self.pageTitleLabel {
            label.text = title
        }
        
    }
    
    //MARK: - IB action
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    //MARK: - table view source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowsArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("CellId")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CellId")
        }
        
        let item:CommonDataObject? = self.rowsArray![indexPath.row] as? CommonDataObject
        cell!.textLabel!.text = item!.name!
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell!
    }
    
    //MARK: - table view delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item:CommonDataObject? = self.rowsArray![indexPath.row] as? CommonDataObject
        delegate?.didSelectItem?(self.type!, name: item!.name!, code: item!.code!)
        
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
}

