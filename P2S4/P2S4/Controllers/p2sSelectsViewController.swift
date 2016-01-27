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


class p2sSelectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataManagerDelegate, DataQueryManagerDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cancelButtonSpace: NSLayoutConstraint!
    
    var delegate: p2sSelectsViewControllerDelegate! = nil
    
    var type: String? = ""
    var pageTitle: String? = ""
    
    var withAllOptionFlag: Bool = false
    var parameters: String? = ""
    
    var rowsArray: Array<AnyObject>? = [AnyObject]()
    
    var beginTimeInterval: NSTimeInterval = 0
    var endTimeInterval: NSTimeInterval = 0
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let iPhone4Height: CGFloat = 480.0
    var isSmallScreen: Bool = false
    
    
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
        
        if screenHeight == self.iPhone4Height {
            self.isSmallScreen = true
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.bringSubviewToFront(self.activityIndicator)
        self.pageTitleLabel!.text = self.pageTitle
        
        if self.isSmallScreen {
            self.cancelButtonSpace.constant = 20.0
        }
        else {
            self.cancelButtonSpace.constant = 40.0
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //-- data
        let dataManager: DataManager? = DataManager()
        dataManager!.delegate = self
        dataManager!.dataWithSelectTypeAndParameters(type!, parameters: parameters!)
        
        let date = NSDate()
        beginTimeInterval = date.timeIntervalSince1970
        
        
        //-- from core data
        if type == nil || type == "" {
            return
        }
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let sportId = appDele.currentUser!.sportId!
        
        let dataQuery: DataQueryManager? = DataQueryManager()
        dataQuery!.delegate = self
        dataQuery!.selectDataWithType(self.type!, sportId: sportId)
        
        
        //-- get from core data
//        var dataQuery: DataQueryManager? = DataQueryManager()
//        var dataList: Array<AnyObject> = dataQuery!.allStatesData()
//        
//        for item in dataList {
//            var data = item as! CommonDataObject
//            print("code = '\(data.code!)', name = '\(data.name!)' ")
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
    //MARK: - data manager delegate
    
    func selectionWithData(data: NSData) {
        
        self.rowsArray!.removeAll()
        var count: Int = 0
        var isActivityIndicatorShowing: Bool = true
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let items = json["selects"] as? [[String: AnyObject]] {
                    for item in items {
                        var object: CommonDataObject? = CommonDataObject()
                        
                        if let name = item["name"] as? String {
                            object!.name = name
                        }
                        if let code = item["code"] as? String {
                            object!.code = code
                        }
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            self.rowsArray!.append(object!)
                            count++
                            self.tableView.reloadData()
                            
                            if isActivityIndicatorShowing {
                                self.view.sendSubviewToBack(self.activityIndicator)
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
    
    
    //MARK: - data query delegate
    
    func selectionData(type: String, data: Array<AnyObject>) {
        
        print("type = '\(type)', data content :")
        for item in data {
            let dataObject = item as! CommonDataObject
            print("sport = '\(dataObject.sport!)', code = '\(dataObject.code!)', name = '\(dataObject.name!)' ")
        }
    }
    
}

