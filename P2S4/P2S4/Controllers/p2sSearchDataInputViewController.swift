//
//  p2sSearchDataInputViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/17/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sSearchDataInputViewController: UIViewController {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var cancelConstraint: NSLayoutConstraint!
    @IBOutlet weak var saveConstraint: NSLayoutConstraint!
    
    var isForSchoolName: String? = ""
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancelButton.layer.cornerRadius = 5
        self.cancelButton.clipsToBounds = true
        
        self.saveButton.layer.cornerRadius = 5
        self.saveButton.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB action
    
    @IBAction func cancelAction(sender: AnyObject) {
        //
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        //
    }
    
    
    
}
