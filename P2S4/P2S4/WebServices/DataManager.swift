//
//  DataManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/14/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol DataManagerDelegate {
    
    optional func didReceiveData(data: Array<AnyObject>)
}


class DataManager: NSObject {
    
    var delegate: DataManagerDelegate! = nil
    
    
    //MARK: - action methods
    
    func dataWithSelectType(type: String) {
        
        let link = self.linkWithType(type)
        if link == "" {
            return
        }
        
        let url = NSURL(string: link)
        var data = NSData(contentsOfURL: url!)
        
        var dataList = [AnyObject]()
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let items = json["selects"] as? [[String: AnyObject]] {
                for item in items {
                    var object: CommonDataObject? = CommonDataObject()
                    
                    if let name = item["name"] as? String {
                        object!.name = name
                    }
                    if let code = item["code"] as? String {
                        object!.code = code
                    }
                    
                    dataList.append(object!)
                    object = nil
                }
            }
        }
        catch {
            print("error serializing JSON: \(error)")
        }
        
        self.delegate?.didReceiveData?(dataList)
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
        default:
            link = ""
            break
        }
        
        return link!
    }
    
    
}

