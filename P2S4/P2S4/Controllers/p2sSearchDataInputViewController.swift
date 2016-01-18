//
//  p2sSearchDataInputViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/17/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sSearchDataInputViewControllerDelegate {
    
    optional func didEnterPlayName(firstName: String, lastName: String)
    optional func didEnterSchooName(schoolName: String)
}


class p2sSearchDataInputViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var cancelConstraint: NSLayoutConstraint!
    @IBOutlet weak var saveConstraint: NSLayoutConstraint!
    
    var delegate: p2sSearchDataInputViewControllerDelegate! = nil
    var isForSchoolName: Bool = false
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.cancelButton.layer.cornerRadius = 5
        self.cancelButton.clipsToBounds = true
        
        self.saveButton.layer.cornerRadius = 5
        self.saveButton.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if isForSchoolName {
            self.secondLabel.hidden = true
            self.secondTextField.hidden = true
            self.secondTextField.userInteractionEnabled = false
            self.secondTextField.enabled = false
            
            self.firstLabel.text = "SCHOOL (OPTIONAL)"
            self.firstTextField.placeholder = "school"
            
            self.cancelConstraint.constant = 30
            self.saveConstraint.constant = 30
        }
        else {
            self.secondLabel.hidden = false
            self.secondTextField.hidden = false
            self.secondTextField.userInteractionEnabled = true
            self.secondTextField.enabled = true
            
            self.firstLabel.text = "FIRST NAME (OPTIONAL)"
            self.firstTextField.placeholder = "first name"
            
            self.cancelConstraint.constant = 80
            self.saveConstraint.constant = 80
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - IB action
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.clearKeyboard()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        self.clearKeyboard()
        
        if isForSchoolName {
            delegate?.didEnterSchooName?(self.firstTextField.text!)
        }
        else {
            delegate?.didEnterPlayName?(self.firstTextField.text!, lastName: self.secondTextField.text!)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: - text field delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.clearKeyboard()
        return true
    }
    
    
    //MARK: - local methods
    
    func clearKeyboard() {
        self.firstTextField.resignFirstResponder()
        self.secondTextField.resignFirstResponder()
    }
    
}

