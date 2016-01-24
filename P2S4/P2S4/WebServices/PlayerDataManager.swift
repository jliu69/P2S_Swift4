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
    optional func playerDetailsData(data: NSData)
    optional func playerVotingsData(data: NSData)
}


class PlayerDataManager: NSObject {
    
    var delegate: PlayerDataManagerDelegate! = nil
    
    //MARK: - players listing
    
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
    
    //MARK: - player details
    
    func playerDetailsAndVotingsInfo(isForVotings: Bool, parameters: String) {
        
        //-- details : person ID, sport ID
        //-- votings : player ID, sport ID
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        
        var linkBody = ""
        if isForVotings {
            linkBody = JsonLinks.playerVotingsLink()
        }
        else {
            linkBody = JsonLinks.playerDetailsLink()
        }
        let detailsUrl = "\(linkHeader)\(linkBody)?\(parameters)"
        self.getDetailsAndVotings(isForVotings, urlLink: detailsUrl)
    }
    
    func getDetailsAndVotings(isForVotings: Bool, urlLink: String) {
        
        let url = NSURL(string: urlLink)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.detailsAndVotingsData(isForVotings, data: data!)
        }
        task.resume()
    }
    
    func detailsAndVotingsData(isForVotings: Bool, data: NSData) {
        //delegate?.detailsAndVotingData?(data)
        
        if isForVotings {
            delegate?.playerVotingsData?(data)
        }
        else {
            delegate?.playerDetailsData?(data)
        }
    }
    
}

