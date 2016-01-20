//
//  p2sRegSaveCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sRegSaveCellDelegate {
    
    optional func didGoback()
    optional func didReigsterWithData(firstName: String, lastName: String, gender: String, city: String, savePwd: Bool)
    
    optional func showAgeRanges()
    optional func showStates()
    optional func showNations()
}


class p2sRegSaveCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var savePwdSwitch: UISwitch!
    
    @IBOutlet weak var ageRangeButton: UIButton!
    @IBOutlet weak var selectStateButton: UIButton!
    @IBOutlet weak var selectNationButton: UIButton!
    @IBOutlet weak var gobackButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var delegate:p2sRegSaveCellDelegate! = nil
    
    var gender: String? = "Male"
    var savePasswordFlag: Bool = true
    
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.ageRangeButton.layer.cornerRadius = 5
        self.ageRangeButton.clipsToBounds = true
        
        self.selectStateButton.layer.cornerRadius = 5
        self.selectStateButton.clipsToBounds = true
        
        self.selectNationButton.layer.cornerRadius = 5
        self.selectNationButton.clipsToBounds = true
        
        self.gobackButton.layer.cornerRadius = 5
        self.gobackButton.clipsToBounds = true
        
        self.registerButton.layer.cornerRadius = 5
        self.registerButton.clipsToBounds = true
        
        
        self.selectNationButton.setTitle("COUNTRY : US", forState: UIControlState.Normal)
        self.selectNationButton.setTitle("COUNTRY : US", forState: UIControlState.Highlighted)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - IB actions
    
    @IBAction func ageRangeAction(sender: AnyObject) {
        delegate?.showAgeRanges?()
    }
    
    @IBAction func selectStateAction(sender: AnyObject) {
        delegate?.showStates?()
    }
    
    @IBAction func selectNationAction(sender: AnyObject) {
        delegate?.showNations?()
    }
    
    @IBAction func chooseGenderAction(sender: AnyObject) {
        
        if self.genderSegmentControl.selectedSegmentIndex == 0 {
            gender = "Male"
        }
        else {
            gender = "Female"
        }
    }
    
    @IBAction func savePwdAction(sender: AnyObject) {
        
        if self.savePwdSwitch.on {
            savePasswordFlag = true
        }
        else {
            savePasswordFlag = false
        }
    }
    
    @IBAction func gobackAction(sender: AnyObject) {
        //
        delegate?.didGoback?()
    }
    
    @IBAction func registerAction(sender: AnyObject) {
        
        var firstName = ""
        if self.firstNameTextField.text != nil {
            firstName = self.firstNameTextField.text!
        }
        
        var lastName = ""
        if self.lastNameTextField.text != nil {
            lastName = self.lastNameTextField.text!
        }
        
        var city = ""
        if self.cityTextField.text != nil {
            city = self.cityTextField.text!
        }
        
        delegate?.didReigsterWithData?(firstName, lastName: lastName, gender: gender!, city: city, savePwd: savePasswordFlag)
    }
    
    
    //MARK: - edit button
    
    func editButton(type: String, value: String) {
        
        switch (type) {
        case SelectionType.ageRange:
            let title = "AGE RANGE : \(value)"
            self.ageRangeButton.setTitle(title, forState: UIControlState.Normal)
            self.ageRangeButton.setTitle(title, forState: UIControlState.Highlighted)
            break
        case SelectionType.state:
            let title = "STATE/PROVINCE : \(value)"
            self.selectStateButton.setTitle(title, forState: UIControlState.Normal)
            self.selectStateButton.setTitle(title, forState: UIControlState.Highlighted)
            break
        case SelectionType.nation:
            let title = "COUNTRY : \(value)"
            self.selectNationButton.setTitle(title, forState: UIControlState.Normal)
            self.selectNationButton.setTitle(title, forState: UIControlState.Highlighted)
            break
        default:
            break
        }
    }
    
    
    //MARK: - text field delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.firstNameTextField.resignFirstResponder()
        self.lastNameTextField.resignFirstResponder()
        self.cityTextField.resignFirstResponder()
        return true
    }
    
    
    //MARK: - local methods
    
    func checkForSmallScreenSize(isSmallScreen: Bool) {
        
        if isSmallScreen {
            self.topSpaceConstraint.constant = 30
        }
        else {
            self.topSpaceConstraint.constant = 10
        }
    }
}

