//
//  AlertsHelper.swift
//  Test7
//
//  Created by Liu, Johnson on 1/5/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit

class AlertsHelper: NSObject {
    
    func showSimpleAlert(vc: UIViewController, alertTitle:String, alertMessage: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        vc.presentViewController(alert, animated: true, completion: nil)
    }
    
}
