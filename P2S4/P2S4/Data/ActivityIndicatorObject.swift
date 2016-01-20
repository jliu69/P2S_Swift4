//
//  ActivityIndicatorObject.swift
//  P2S4
//
//  Created by Johnson Liu on 1/20/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class ActivityIndicatorObject: NSObject {
    
    func activityIndicator() -> UIView {
        
        var baseView: UIView? = UIView(frame: CGRectMake(0, 0, 100, 100))
        baseView!.backgroundColor = UIColor.clearColor()
        baseView!.layer.cornerRadius = 10
        baseView!.clipsToBounds = true
        
        var bgLabel: UILabel? = UILabel(frame: CGRectMake(0, 0, 100, 100))
        bgLabel!.backgroundColor = UIColor.blackColor()
        bgLabel!.alpha = 0.7
        bgLabel!.text = ""
        baseView!.addSubview(bgLabel!)
        
        var activityIndicator: UIActivityIndicatorView? = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicator!.frame = CGRectMake(32, 20, 37, 37)
        activityIndicator!.startAnimating()
        baseView!.addSubview(activityIndicator!)
        
        var messageLabel: UILabel? = UILabel(frame: CGRectMake(0, 60, 100, 20))
        messageLabel!.backgroundColor = UIColor.clearColor()
        messageLabel!.textColor = UIColor.whiteColor()
        messageLabel!.textAlignment = NSTextAlignment.Center
        messageLabel!.font = UIFont.systemFontOfSize(13)
        messageLabel!.text = "Loading..."
        baseView!.addSubview(messageLabel!)
        
        return baseView!
    }
    
}
