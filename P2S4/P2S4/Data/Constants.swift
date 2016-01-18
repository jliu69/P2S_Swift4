//
//  Constants.swift
//  P2S4
//
//  Created by Johnson Liu on 1/12/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


struct RegisterSave {
    static let notificationKey = "RegisterSaveNotificationKey"
}

struct SelectionType {
    static let ageRange = "ageRange"
    static let state = "state"
    static let nation = "nation"
    static let sport = "sport"
    static let height = "height"
    static let weight = "weight"
    static let position = "position"
    static let playerName = "playerName"
    static let schoolName = "schoolName"
}

struct UserDefaultKeys {
    static let savedUserEmail = "SavedUserEmail"
    static let savedUserPassword = "SavedUserPassword"
}


class Constants: NSObject {
    //
    
    class func selectionTitle(type: String) -> String {
        
        var title: String? = ""
        
        switch (type) {
        case SelectionType.state:
            title = "Select a State/Province"
            break
        case SelectionType.nation:
            title = "Select a Country"
            break
        case SelectionType.sport:
            title = "Select a Sport"
            break
        case SelectionType.height:
            title = "Select a Height"
            break
        case SelectionType.weight:
            title = "Select a Weight"
            break
        case SelectionType.position:
            title = "Select a Position"
            break
        default:
            break
        }
        
        return title!
    }
    
    
}
