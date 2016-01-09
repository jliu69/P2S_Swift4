//
//  LogoImageObject.swift
//  Test7
//
//  Created by Johnson Liu on 1/8/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit

class LogoImageObject: NSObject {
    
    func logoView() -> UIImageView {
        
        let logoImageView: UIImageView? = UIImageView.init(frame: CGRectMake(0, 0, 109, 44))
        logoImageView!.backgroundColor = UIColor.clearColor()
        logoImageView!.contentMode = UIViewContentMode.ScaleAspectFit
        logoImageView!.image = UIImage(named: "p2s_action_bar_logo_small.png")
        
        return logoImageView!
    }
    
}
