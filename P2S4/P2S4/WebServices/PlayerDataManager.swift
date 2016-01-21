//
//  PlayerDataManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/20/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol PlayerDataManagerDelegate {
    
    optional func playersListData(data: NSData)
}


class PlayerDataManager: NSObject {
    
    var delegate: PlayerDataManagerDelegate! = nil
    
    
    func getPlayersList(isFromSearch: Bool, parameters: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        
        var linkBody = ""
        if isFromSearch {
            linkBody = JsonLinks.playersFromSearch()
        }
        else {
            linkBody = JsonLinks.topPlayers()
        }
        let playersUrl = "\(linkHeader)\(linkBody)?\(parameters)"
        
        self.retrievePlayers(playersUrl)
    }
    
    
    func retrievePlayers(urlLink: String) {
        
        let url = NSURL(string: urlLink)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.playersData(data!)
        }
        task.resume()
    }
    
    
    func playersData(data: NSData) {
        delegate?.playersListData?(data)
    }
    
}

