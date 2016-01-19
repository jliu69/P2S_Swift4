//
//  TitleViewObject.swift
//  P2S4
//
//  Created by Johnson Liu on 1/18/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class TitleViewObject: NSObject {
    
    func playerListTitleView() -> UIView {
        
        var titleView: UIView? = UIView(frame: CGRectMake(0, 0, 310, 40))
        titleView!.backgroundColor = ColorsHelper.bgColor()
        
        var votesRatings: UILabel? = UILabel(frame: CGRectMake(0, 0, 80, 40))
        votesRatings!.text = "Votes  /  Ratings"
        votesRatings!.font = UIFont.systemFontOfSize(11)
        votesRatings!.textColor = UIColor.blackColor()
        votesRatings!.backgroundColor = UIColor.clearColor()
        votesRatings!.textAlignment = NSTextAlignment.Center
        votesRatings!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        votesRatings!.numberOfLines = 0
        titleView!.addSubview(votesRatings!)
        
        var borderOne: UILabel? = UILabel(frame: CGRectMake(80, 0, 1, 40))
        borderOne!.text = ""
        borderOne!.backgroundColor = UIColor.darkGrayColor()
        titleView!.addSubview(borderOne!)
        
        var name: UILabel? = UILabel(frame: CGRectMake(80, 0, 90, 40))
        name!.text = "Name"
        name!.font = UIFont.systemFontOfSize(11)
        name!.textColor = UIColor.blackColor()
        name!.backgroundColor = UIColor.clearColor()
        name!.textAlignment = NSTextAlignment.Center
        name!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        name!.numberOfLines = 0
        titleView!.addSubview(name!)
        
        var borderTwo: UILabel? = UILabel(frame: CGRectMake(170, 0, 1, 40))
        borderTwo!.text = ""
        borderTwo!.backgroundColor = UIColor.darkGrayColor()
        titleView!.addSubview(borderTwo!)
        
        var cityState: UILabel! = UILabel(frame: CGRectMake(170, 0, 80, 40))
        cityState!.text = "City, State"
        cityState!.font = UIFont.systemFontOfSize(11)
        cityState!.textColor = UIColor.blackColor()
        cityState!.backgroundColor = UIColor.clearColor()
        cityState!.textAlignment = NSTextAlignment.Center
        cityState!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cityState!.numberOfLines = 0
        titleView!.addSubview(cityState!)
        
        var borderThree: UILabel? = UILabel(frame: CGRectMake(250, 0, 1, 40))
        borderThree!.text = ""
        borderThree!.backgroundColor = UIColor.darkGrayColor()
        titleView!.addSubview(borderThree!)
        
        var position: UILabel? = UILabel(frame: CGRectMake(250, 0, 30, 40))
        position!.text = "Pos"
        position!.font = UIFont.systemFontOfSize(11)
        position!.textColor = UIColor.blackColor()
        position!.backgroundColor = UIColor.clearColor()
        position!.textAlignment = NSTextAlignment.Center
        position!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        position!.numberOfLines = 0
        titleView!.addSubview(position!)
        
        return titleView!
    }
}
