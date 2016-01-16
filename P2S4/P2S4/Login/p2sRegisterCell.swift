//
//  p2sRegister2Cell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sRegisterCellDelegate {
    
    optional func didCancelRegister()
    optional func didGotoNextPage(email: String, password: String, password2: String)
    
    optional func moveCellUp()
    optional func moveCellDown()
    
    optional func showWarningMessage(title: String, message: String)
}


class p2sRegisterCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var delegate: p2sRegisterCellDelegate! = nil
    
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cancelButton.layer.cornerRadius = 5
        self.cancelButton.clipsToBounds = true
        
        self.nextButton.layer.cornerRadius = 5
        self.nextButton.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - text field delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        delegate?.moveCellUp!()
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.clearKeyboard()
        self.delegate!.moveCellDown!()
        return true
    }
    
    
    //MARK: - IB action
    
    @IBAction func cancelAction(sender: AnyObject) {
        
        self.clearKeyboard()
        delegate?.didCancelRegister?()
    }
    
    @IBAction func nextAction(sender: AnyObject) {
        self.clearKeyboard()
        
        var email = ""
        if self.emailTextField.text != nil {
            email = self.emailTextField.text!
        }
        
        var password = ""
        if self.passwordTextField.text != nil {
            password = self.passwordTextField.text!
        }
        
        var password2 = ""
        if self.password2TextField.text != nil {
            password2 = self.password2TextField.text!
        }
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        appDele.currentUser!.clearData()
        appDele.currentUser!.email! = email
        appDele.currentUser!.password! = password
        
        delegate?.didGotoNextPage?(email, password: password, password2: password2)
    }
    
    
    //MARK: - local methods
    
    func clearKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.password2TextField.resignFirstResponder()
    }
    
}

