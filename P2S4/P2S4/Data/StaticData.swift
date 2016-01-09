//
//  StaticData.swift
//  Test7
//
//  Created by Liu, Johnson on 1/5/16.
//  Copyright © 2016 Home Office. All rights reserved.
//

import UIKit

class StaticData: NSObject {
    
    //MARK: - sports
    
    func allSports() -> [AnyObject] {
        
        var sports = [AnyObject]()
        var item: CommonDataObject? = CommonDataObject()
        
        
        item!.sport = ""
        item!.code = "1"
        item!.name = "Baseball (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "2"
        item!.name = "Basketball (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "3"
        item!.name = "Basketball (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "31"
        item!.name = "Cross Country  (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "32"
        item!.name = "Cross Country  (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "29"
        item!.name = "Diving (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "30"
        item!.name = "Diving (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "4"
        item!.name = "Field Hockey (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "5"
        item!.name = "Football (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "6"
        item!.name = "Golf (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "17"
        item!.name = "Golf (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "27"
        item!.name = "Ice Hockey (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "28"
        item!.name = "Ice Hockey (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "7"
        item!.name = "Lacrosse (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "8"
        item!.name = "Lacrosse (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "33"
        item!.name = "Rowing (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "34"
        item!.name = "Rowing (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "9"
        item!.name = "Soccer (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "10"
        item!.name = "Soccer (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "11"
        item!.name = "Softball (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "12"
        item!.name = "Swimming (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "18"
        item!.name = "Swimming (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "13"
        item!.name = "Tennis (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "19"
        item!.name = "Tennis (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "14"
        item!.name = "Track&Field-Indoor (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "22"
        item!.name = "Track&Field-Indoor (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "23"
        item!.name = "Track&Field-Outdoor (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "24"
        item!.name = "Track&Field-Outdoor (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "15"
        item!.name = "Volleyball (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "20"
        item!.name = "Volleyball (W)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "25"
        item!.name = "Water Polo (M)"
        sports.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.code = "26"
        item!.name = "Wrestling (M)"
        sports.append(item!)
        item = nil
        
        
        return sports
    }
    
    
    //MARK: - skills
    
    func skillsFromSport(sport: String) -> Array<AnyObject> {
        
        if sport.isEmpty {
            let emptyArray = [AnyObject]()
            return emptyArray
        }
        
        let skillsDict = self.allSkills()
        let skills = skillsDict[sport] as! Array<AnyObject>
        return skills
    }
    
    
    func allSkills() -> [String: AnyObject] {
        
        var skillsDict = [String: AnyObject]()
        var skillsArray = [AnyObject]()
        var dataItem: CommonDataObject? = CommonDataObject()
        
        
        //-- Baseball (M), 1
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "1001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "1002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "1003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "1004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "1005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "1006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Baseball (M)"] = skillsArray
        
        
        //-- Basketball (M), 2
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "2001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "2002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "2003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "2004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "2005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "2006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Basketball (M)"] = skillsArray
        
        
        //-- Basketball (W), 3
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "3001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "3002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "3003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "3004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "3005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "3006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Basketball (W)"] = skillsArray
        
        
        //-- Field Hockey (W), 4
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "4001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "4002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "4003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "4004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "4005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "4006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Field Hockey (W)"] = skillsArray
        
        
        //-- Football (M), 5
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "5001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "5002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "5003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "5004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "5005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "5006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Football (M)"] = skillsArray
        
        
        //-- Golf (M), 6
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "6001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Short-Game"
        dataItem!.code = "6002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Approach"
        dataItem!.code = "6003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "6004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "6005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "6006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Golf (M)"] = skillsArray
        
        
        //-- Lacrosse (M), 7
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "7001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "7002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "7003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "7004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "7005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "7006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Lacrosse (M)"] = skillsArray
        
        
        //-- Lacrosse (W), 8
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "8001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "8002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "8003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "8004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "8005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "8006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Lacrosse (W)"] = skillsArray
        
        
        //-- Soccer (M), 9
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "9001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "9002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "9003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "9004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "9005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "9006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Soccer (M)"] = skillsArray
        
        
        //-- Soccer (W), 10
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "10001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "10002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "10003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "10004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "10005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "10006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Soccer (W)"] = skillsArray
        
        
        //-- Softball (W), 11
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "11001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "11002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "11003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "11004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "11005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "11006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Softball (W)"] = skillsArray
        
        
        //-- Swimming (M), 12
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "11001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Coordination"
        dataItem!.code = "11002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "11003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "11004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "11005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "11006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Swimming (M)"] = skillsArray
        
        
        //-- Tennis (M), 13
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "13001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "13002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Accuracy"
        dataItem!.code = "13003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "13004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "13005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "13006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Tennis (M)"] = skillsArray
        
        
        //-- Track&Field-Indoor (M), 14
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "14001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "14002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "14003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "14004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "14005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "14006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Track&Field-Indoor (M)"] = skillsArray
        
        
        //-- Volleyball (M), 15
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "15001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "15002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "15003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "15004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "15005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "15006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Volleyball (M)"] = skillsArray
        
        
        //-- Golf (W), 17
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "17001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Short-Game"
        dataItem!.code = "17002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Approach"
        dataItem!.code = "17003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "17004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "17005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "17006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Golf (W)"] = skillsArray
        
        
        //-- Swimming (W), 18
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "18001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Coordination"
        dataItem!.code = "18002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "18003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "18004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "18005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "18006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Swimming (W)"] = skillsArray
        
        
        //-- Tennis (W), 19
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "19001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "19002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Accuracy"
        dataItem!.code = "19003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "19004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "19005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "19006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Tennis (W)"] = skillsArray
        
        
        //-- Volleyball (W), 20
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "20001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "20002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "20003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "20004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "20005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "20006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Volleyball (W)"] = skillsArray
        
        
        //-- Track&Field-Indoor (W), 22
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "22001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "22002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "22003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "22004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "22005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "22006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Track&Field-Indoor (W)"] = skillsArray
        
        
        //-- Track&Field-Outdoor (M), 23
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "23001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "23002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "23003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "23004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "23005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "23006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Track&Field-Outdoor (M)"] = skillsArray
        
        
        //-- Track&Field-Outdoor (W), 24
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "24001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "24002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "24003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "24004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "24005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "24006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Track&Field-Outdoor (W)"] = skillsArray
        
        
        //-- Water Polo (M), 25
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "25001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Coordination"
        dataItem!.code = "25002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "25003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "25004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "25005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "25006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Water Polo (M)"] = skillsArray
        
        
        //-- Wrestling (M), 26
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "26001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "26002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "26003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "26004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "26005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "26006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Wrestling (M)"] = skillsArray
        
        
        //-- Ice Hockey (M), 27
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "27001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "27002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "27003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "27004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "27005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "27006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Ice Hockey (M)"] = skillsArray
        
        
        //-- Ice Hockey (W), 28
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "28001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "28002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Defensive Ability"
        dataItem!.code = "28003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "28004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "28005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "28006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Ice Hockey (W)"] = skillsArray
        
        
        //-- Diving (M), 29
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "29001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Coordination"
        dataItem!.code = "29002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "29003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "29004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "29005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "29006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Diving (M)"] = skillsArray
        
        
        //-- Diving (W), 30
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "30001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Coordination"
        dataItem!.code = "30002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "30003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "30004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "30005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "30006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Diving (W)"] = skillsArray
        
        
        //-- Cross Country  (M), 31
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "31001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "31002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "31003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "31004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "31005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "31006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Cross Country  (M)"] = skillsArray
        
        
        //-- Cross Country  (W), 32
        
        skillsArray.removeAll()
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Athleticism"
        dataItem!.code = "32001"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Speed/Quickness"
        dataItem!.code = "32002"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Endurance"
        dataItem!.code = "32003"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Strength"
        dataItem!.code = "32004"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Physical Makeup"
        dataItem!.code = "32005"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        dataItem = CommonDataObject()
        dataItem!.sport = ""
        dataItem!.name = "Next Level Potential"
        dataItem!.code = "32006"
        skillsArray.append(dataItem!)
        dataItem = nil
        
        skillsDict["Cross Country  (W)"] = skillsArray
        
        
        //-- ending
        
        return skillsDict
    }
    
    
    //MARK: - birthyear, height, weight
    
    func birthYears() -> [AnyObject] {
        
        var birthYearsArray = [AnyObject]()
        var item: CommonDataObject? = CommonDataObject()
        
        item!.sport = ""
        item!.name = "Under 12"
        item!.code = "1011"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "12 - 17"
        item!.code = "1217"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "18 - 24"
        item!.code = "1824"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "25 - 34"
        item!.code = "2534"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "35 - 44"
        item!.code = "3544"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "45 - 54"
        item!.code = "4554"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "55 - 64"
        item!.code = "5564"
        birthYearsArray.append(item!)
        item = nil
        
        item = CommonDataObject()
        item!.sport = ""
        item!.name = "65+"
        item!.code = "6500"
        birthYearsArray.append(item!)
        item = nil
        
        return birthYearsArray
    }
    
    func allWeights() -> [AnyObject] {
        
        var weightsArray = [AnyObject]()
        var item: CommonDataObject? = CommonDataObject()
        
        for var i=100; i<=400; {
            let value = String(i)
            
            item = CommonDataObject()
            item!.sport = ""
            item!.name = value
            item!.code = value
            
            weightsArray.append(item!)
            item = nil
            i += 5
        }
        
        return weightsArray
    }
    
    func allHeights() -> [AnyObject] {
        
        var heightsArray = [AnyObject]()
        var item: CommonDataObject? = CommonDataObject()
        
        var valueText = ""
        var codeText = ""
        
//        item!.sport = ""
//        item!.name = ""
//        item!.code = ""
//        heightsArray.append(item!)
//        item = nil
        
        var foot = 4
        var inch = 8
        
        var value = foot * 12 + inch
        let max = 7 * 12 + 5
        
        while value <= max {
            
            if inch > 0 {
                valueText = "\(foot)' \(inch)\""
                codeText = "\(foot)-\(inch)"
            }
            else {
                valueText = "\(foot)'"
                codeText = "\(foot)"
            }
            
            item!.sport = ""
            item!.name = valueText
            item!.code = codeText
            heightsArray.append(item!)
            
            item = nil
            item = CommonDataObject()
            
            inch++
            
            if (inch % 12) == 0 {
                foot++
                inch = 0
            }
            value = foot * 12 + inch
        }
        
        return heightsArray
    }
    
    
}

