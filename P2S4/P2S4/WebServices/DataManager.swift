//
//  DataManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/14/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol DataManagerDelegate {
    
    optional func selectionWithData(data: NSData)
}


class DataManager: NSObject {
    
    var delegate: DataManagerDelegate! = nil
    
    
    //MARK: - action methods
    
    func dataWithSelectTypeAndParameters(type: String, parameters: String) {
        
        var link = self.linkWithType(type)
        if link == "" {
            return
        }
        
        if parameters != "" {
            link = "\(link)?\(parameters)"
        }
        let url = NSURL(string: link)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.selectionData(data!)
        }
        task.resume()
    }
    
    func selectionData(data: NSData) {
        self.delegate?.selectionWithData?(data)
    }
    
    
    //MARK: - private methods
    
    private func linkWithType(typeName: String) -> String {
        var link: String? = ""
        
        switch (typeName) {
        case SelectionType.state:
            link = JsonLinks.allStatesLink()
            break
        case SelectionType.nation:
            link = JsonLinks.allNationsLink()
            break
        case SelectionType.sport:
            link = JsonLinks.allSportsLink()
            break
        case SelectionType.ageRange:
            link = JsonLinks.ageRangesLink()
            break
        case SelectionType.height:
            link = JsonLinks.heightsList()
            break
        case SelectionType.weight:
            link = JsonLinks.weightsList()
            break
        case SelectionType.position:
            link = JsonLinks.positionsFromSport()
            break
        default:
            link = ""
            break
        }
        
        return link!
    }
    
    
}

