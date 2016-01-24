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
    optional func profileImageData(data: NSData)
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
        let url = NSURL(string: playersUrl)
        
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
        let url = NSURL(string: detailsUrl)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.detailsAndVotingsData(isForVotings, data: data!)
        }
        task.resume()
    }
    
    func detailsAndVotingsData(isForVotings: Bool, data: NSData) {
        
        if isForVotings {
            delegate?.playerVotingsData?(data)
        }
        else {
            delegate?.playerDetailsData?(data)
        }
    }
    
    
    //MARK: - profile image
    
    func playerProfileImage(parameters: String) {
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        let linkHeader = appDele.urlHeader!
        
        var linkBody = JsonLinks.profileImageLink()
        let imageUrl = "\(linkHeader)\(linkBody)/\(parameters)"
        let url = NSURL(string: imageUrl)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.playerProfileImageData(data!)
        }
        task.resume()
    }
    
    func playerProfileImageData(data: NSData) {
        delegate?.profileImageData?(data)
    }
    
    
}

