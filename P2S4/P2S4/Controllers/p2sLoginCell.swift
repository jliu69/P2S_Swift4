//
//  p2sLoginCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/10/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sLoginCellDelegate {
    
    optional func didSuccessfulLogin()
    optional func didGotoRegister()
    optional func didPlayerSignIn()
    optional func didResetPassword()
    
    optional func moveCellUp()
    optional func moveCellDown()
}


class p2sLoginCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var savePwdSwitch: UISwitch!
    @IBOutlet weak var fanLoginButton: UIButton!
    @IBOutlet weak var fanSignUpButton: UIButton!
    @IBOutlet weak var playerSignUpButon: UIButton!
    @IBOutlet weak var resetPwdButton: UIButton!
    
    var delegate: p2sLoginCellDelegate! = nil
    
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.fanLoginButton.layer.cornerRadius = 5
        self.fanLoginButton.clipsToBounds = true
        
        self.fanSignUpButton.layer.cornerRadius = 5
        self.fanSignUpButton.clipsToBounds = true
        
        self.playerSignUpButon.layer.cornerRadius = 5
        self.playerSignUpButon.clipsToBounds = true
        
        self.resetPwdButton.layer.cornerRadius = 5
        self.resetPwdButton.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - IB actions
    
    @IBAction func fanLoginAction(sender: AnyObject) {
        //
        self.clearKeyboard()
        delegate?.didSuccessfulLogin?()
    }
    
    @IBAction func fanSignUpAction(sender: AnyObject) {
        //
        self.clearKeyboard()
        delegate?.didGotoRegister?()
    }
    
    @IBAction func playerSignUpAction(sender: AnyObject) {
        //
        self.clearKeyboard()
        delegate?.didPlayerSignIn?()
    }
    
    @IBAction func resetPasswordAction(sender: AnyObject) {
        //
        self.clearKeyboard()
        delegate?.didResetPassword?()
    }
    
    @IBAction func savePwdAction(sender: AnyObject) {
        //
    }
    
    
    //MARK: - text field delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        delegate?.moveCellUp?()
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.clearKeyboard()
        delegate?.moveCellDown?()
        return true
    }
    
    
    //MARK: - local methods
    
    func clearKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
}

