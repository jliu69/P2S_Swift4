//
//  JsonLinks.swift
//  Test5
//
//  Created by Liu, Johnson on 12/29/15.
//  Copyright © 2015 Home Office. All rights reserved.
//

import UIKit

class JsonLinks: NSObject {
    
    
    //MARK: - selection data
    
    static func allStatesLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/all_states.php"
    }
    
    static func allNationsLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/all_nations.php"
    }
    
    static func allSportsLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/all_sports.php"
    }
    
    static func ageRangesLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/age_ranges.php"
    }
    
    static func heightsList() -> String {
        return "http://www.mysohoplace.com/php_p2s/height_list.php"
    }
    
    static func weightsList() -> String {
        return "http://www.mysohoplace.com/php_p2s/weight_list.php"
    }
    
    
    //MARK: - position of sport
    
    static func positionsFromSport() -> String {
        return "http://www.mysohoplace.com/php_p2s/sport_positions.php"
    }
    
    
    //MARK: - player register (or quick register)
    
    static func quickRegisterLink() -> String {
        return "http://prep2star.com/prep2starApp/public/web/pages/player/QuickRegister.php"
    }
    
    
    //MARK: - login & register
    
    static func userLogin() -> String {
        return "/mobile/controller/MobileLoginController/login?"
    }
    
    static func checkRegisterEmail() -> String {
        return "/mobile/controller/MobileDataController/checkRegisterEmail?"
    }
    
    static func saveRegister() -> String {
        return "/controller/RegisterController/registerFan?"
    }
    
    
    //MARK: - totally rated & viewed
    
    static func totallyRatedLink() -> String {
        return "/mobile/controller/MobileViewController/totalFanRates"
    }
    
    static func totallyViewedLink() -> String {
        return "/mobile/controller/MobileViewController/totalFanViews"
    }
    
    
    //MARK: - players list
    
    static func topPlayers() -> String {
        return "/mobile/controller/MobileViewController/listTopPlayer"
    }
    
    static func playersFromSearch() -> String {
        return "/mobile/controller/MobileViewController/getPlayerSearchResult"
    }
    
    
    //MARK: - player details
    
    static func playerDetailsLink() -> String {
        return "/mobile/controller/MobileDataController/playerDetails"
    }
    
    static func playerVotingsLink() -> String {
        return "/controller/SelectDataController/playerVotesInfo"
    }
    
    
    //MARK: - profile image
    
    static func profileImageLink() -> String {
        return "/mobile/controller/MobileViewController/getImage"
    }
    
    
    //MARK: - save votes
    
    static func saveVotesLink() -> String {
        return "/mobile/controller/MobileVoteController/newVote"
    }
    
    
    //MARK: - source, check for update
    
    static func checkForUpdateLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/change_flag.php"
    }
    
    static func allDataSourceLink() -> String {
        return "http://www.mysohoplace.com/php_p2s/data_source.php"
    }
    
    
}

