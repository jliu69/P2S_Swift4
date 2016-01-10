//
//  p2sRegister2Cell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/9/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sRegister3CellDelegate {
    
    optional func didCancelRegister()
    optional func didGotoNextPage()
    
    optional func moveCellUp()
    optional func moveCellDown()
}


class p2sRegister3Cell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var delegate: p2sRegister3CellDelegate! = nil
    
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
        
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.password2TextField.resignFirstResponder()
        
        self.delegate!.moveCellDown!()
        return true
    }
    
    //MARK: - IB action
    
    @IBAction func cancelAction(sender: AnyObject) {
        //
        delegate?.didCancelRegister?()
    }
    
    @IBAction func nextAction(sender: AnyObject) {
        //
        delegate?.didGotoNextPage?()
    }
    
}

