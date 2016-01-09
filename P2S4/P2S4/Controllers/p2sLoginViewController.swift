//
//  Login4ViewController.swift
//  Test7
//
//  Created by Johnson Liu on 1/7/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit


@objc protocol p2sLoginViewControllerDelegate {
    
    optional func didCloseLogin()
}


class p2sLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var savePwdSwitch: UISwitch!
    @IBOutlet weak var fanLoginButton: UIButton!
    @IBOutlet weak var fanSignUpButton: UIButton!
    @IBOutlet weak var playerSignUpButon: UIButton!
    @IBOutlet weak var resetPwdButton: UIButton!
    
    var delegate: p2sLoginViewControllerDelegate! = nil
    
    let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
    let movingSpace: CGFloat = 55.0
    let iPhone4Height: CGFloat = 480.0
    
    var isSmallScreen: Bool = false
    var originalYCenter:CGFloat = 0.0
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fanLoginButton.layer.cornerRadius = 5
        self.fanLoginButton.clipsToBounds = true
        
        self.fanSignUpButton.layer.cornerRadius = 5
        self.fanSignUpButton.clipsToBounds = true
        
        self.playerSignUpButon.layer.cornerRadius = 5
        self.playerSignUpButon.clipsToBounds = true
        
        self.resetPwdButton.layer.cornerRadius = 5
        self.resetPwdButton.clipsToBounds = true
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
        self.originalYCenter = self.view.frame.origin.y
        
        if screenHeight == self.iPhone4Height {
            self.isSmallScreen = true
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB actions
    
    @IBAction func fanLoginAction(sender: AnyObject) {
        
        self.clearKeyboard()
        self.moveDown()
        delegate?.didCloseLogin?()
        
        print("... fan Login ...")
    }
    
    @IBAction func fanSignUpAction(sender: AnyObject) {
        
        self.clearKeyboard()
        self.moveDown()
        
        print("... fan Sign Up ...")
    }
    
    @IBAction func playerSignUpAction(sender: AnyObject) {
        
        self.clearKeyboard()
        self.moveDown()
        
        print("... player Sign Up ...")
    }
    
    @IBAction func resetPwdAction(sender: AnyObject) {
        
        self.clearKeyboard()
        self.moveDown()
        
        print("... reset Password ...")
    }
    
    @IBAction func changeSwitchAction(sender: AnyObject) {
        //
    }
    
    //MARK: - text field delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.clearKeyboard()
        return true
    }
    
    //MARK: - notification
    
    func keyboardWillShow(notifucation: NSNotification) {
        self.moveUp()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.moveDown()
    }
    
    //MARK: - move up/dowm
    
    func isAlreadyMoved() -> Bool {
        
        if self.view.frame.origin.y < self.originalYCenter {
            return true
        }
        else {
            return false
        }
    }
    
    func moveUp() {
        
        if isSmallScreen {
            if self.isAlreadyMoved() {
                return
            }
            self.view.frame.origin.y -= self.movingSpace
        }
    }
    
    func moveDown() {
        
        if isSmallScreen {
            if !self.isAlreadyMoved() {
                return
            }
            self.view.frame.origin.y += self.movingSpace
        }
    }
    
    //MARK: - local methods
    
    func clearKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }

}

