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
    optional func didCompleteReigster()
    
    //optional func moveCellUp()
    //optional func moveCellDown()
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
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - local methods
    
    func checkForSmallScreenSize(isSmallScreen: Bool) {
        
        if isSmallScreen {
            self.topSpaceConstraint.constant = 30
            print(".. it is for iPhone 4/4s ...")
        }
        else {
            self.topSpaceConstraint.constant = 10
            print(".. it is for iPhone 5/5s/6/6+ ...")
        }
    }
    
    
    //MARK: - IB actions
    
    @IBAction func ageRangeAction(sender: AnyObject) {
        //
    }
    
    @IBAction func selectStateAction(sender: AnyObject) {
        //
    }
    
    @IBAction func selectNationAction(sender: AnyObject) {
        //
    }
    
    @IBAction func chooseGenderAction(sender: AnyObject) {
        //
    }
    
    @IBAction func savePwdAction(sender: AnyObject) {
        //
    }
    
    @IBAction func gobackAction(sender: AnyObject) {
        //
        delegate?.didGoback?()
    }
    
    @IBAction func registerAction(sender: AnyObject) {
        //
        delegate?.didCompleteReigster?()
    }
    
    
    //MARK: - text field delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.firstNameTextField.resignFirstResponder()
        self.lastNameTextField.resignFirstResponder()
        self.cityTextField.resignFirstResponder()
        return true
    }
    
    
}

