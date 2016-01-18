//
//  ViewsAndRatesManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/17/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol ViewsAndRatesManagerDelegate {
    
    optional func totalRates(ratesValue: String)
    optional func totalViews(viewsValue: String)
}


class ViewsAndRatesManager: NSObject {
    
    var delegate: ViewsAndRatesManagerDelegate! = nil
    
    //MARK: - totally rated
    
    func totallyRated(userId: String, sportId: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        let linkBody = JsonLinks.totallyRatedLink()
        let parameter = "/\(userId)/\(sportId)"
        var urlLink = "\(linkHeader)\(linkBody)\(parameter)"
        
        urlLink = (urlLink as NSString).stringByReplacingOccurrencesOfString(" ", withString: "+") as String
        
        let url = NSURL(string: urlLink)
        let data: NSData? = NSData(contentsOfURL: url!)
        
        let dataText = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString? as String?
        delegate?.totalRates?(dataText!)
    }
    
    func totallyViewed(userId: String, sportId: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        let linkBody = JsonLinks.totallyViewedLink()
        let parameter = "/\(userId)/\(sportId)"
        var urlLink = "\(linkHeader)\(linkBody)\(parameter)"
        
        urlLink = (urlLink as NSString).stringByReplacingOccurrencesOfString(" ", withString: "+") as String
        
        let url = NSURL(string: urlLink)
        let data: NSData? = NSData(contentsOfURL: url!)
        
        let dataText = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString? as String?
        delegate?.totalViews?(dataText!)
    }

}
