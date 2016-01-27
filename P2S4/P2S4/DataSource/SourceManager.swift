//
//  SourceManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/25/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit
import CoreData


@objc protocol SourceManagerDelegate {
    
    optional func dataChangeStatus(data: NSData)
    optional func dataSourceList(data: NSData)
}


class SourceManager: NSObject {
    
    var delegate: SourceManagerDelegate! = nil
    
    //MARK: - check for changes
    
    func checkForDataChange() {
        
        let link = JsonLinks.checkForUpdateLink()
        var url: NSURL? = NSURL(string: link)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.dataChangeStatus(data!)
        }
        task.resume()
    }
    
    func dataChangeStatus(data: NSData) {
        delegate?.dataChangeStatus?(data)
    }
    
    //MARK: - get source data
    
    func allSourceData() {
        
        let link = JsonLinks.allDataSourceLink()
        var url: NSURL? = NSURL(string: link)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            self.sourceDataList(data!)
        }
        task.resume()
    }
    
    func sourceDataList(data: NSData) {
        delegate?.dataSourceList?(data)
    }
    
    
    //MARK: - update core data
    
    func queryResults(data: NSData) {
        
        print(" ")
        print(" ")
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                //-- total 8 data
                
                if let dicts = json["data"] as? [[String: AnyObject]] {
                    let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
                    
                    let sportsData = dicts[0]
                    let sportsList = sportsData["sports"]
                    let sports: Array<AnyObject> = sportsList as! Array
                    self.updateSports(sports, context: appDele.managedObjectContext)
                    
                    let nationsData = dicts[1]
                    let nationsList = nationsData["nations"]
                    let nations: Array<AnyObject> = nationsList as! Array
                    self.updateNations(nations, context: appDele.managedObjectContext)
                    
                    let statesData = dicts[2]
                    let statesList = statesData["states"]
                    let states: Array<AnyObject> = statesList as! Array
                    self.updateStates(states, context: appDele.managedObjectContext)
                    
                    let positionsData = dicts[3]
                    let positionsList = positionsData["positions"]
                    let positions: Array<AnyObject> = positionsList as! Array
                    self.updatePositions(positions, context: appDele.managedObjectContext)
                    
                    let skillsData = dicts[4]
                    let skillsList = skillsData["skills"]
                    let skills: Array<AnyObject> = skillsList as! Array
                    self.updateSkills(skills, context: appDele.managedObjectContext)
                    
                    let heightsData = dicts[5]
                    let heightsList = heightsData["heights"]
                    let heights: Array<AnyObject> = heightsList as! Array
                    self.updateHeights(heights, context: appDele.managedObjectContext)
                    
                    let weightsData = dicts[6]
                    let weightsList = weightsData["weights"]
                    let weights: Array<AnyObject> = weightsList as! Array
                    self.updateWeights(weights, context: appDele.managedObjectContext)
                    
                    let ageRangesData = dicts[7]
                    let ageRangesList = ageRangesData["ageRanges"]
                    let ageRanges: Array<AnyObject> = ageRangesList as! Array
                    self.updateAgeRanges(ageRanges, context: appDele.managedObjectContext)
                }
            }
            catch {
                print("error serializing JSON: \(error)")
            }
        }
    }
    
    func updateSports(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("Sports", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                print("Sports ... code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "sportId")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updateNations(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("Nations", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                print("Nations ... code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updateStates(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("States", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                print("States ... code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updatePositions(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("Positions", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                let sportId: String? = item["sport"] as! NSString as String
                print("Positions ... sport ID = '\(sportId!)', code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                newItem.setValue(sportId!, forKey: "sportId")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updateSkills(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("Skills", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                let sportId: String? = item["sport"] as! NSString as String
                print("Skills ... sport ID = '\(sportId!)', code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                newItem.setValue(sportId!, forKey: "sportId")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updateHeights(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("Heights", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                print("Heights ... code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updateWeights(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("Weights", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                print("Weights ... code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
    func updateAgeRanges(data: Array<AnyObject>, context: NSManagedObjectContext) {
        
        do {
            let entity = NSEntityDescription.entityForName("AgeRanges", inManagedObjectContext: context)
            
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity!
            
            //-- remove existing rows
            let results = try context.executeFetchRequest(fetchRequest)
            if results.count > 0 {
                for item in results {
                    context.deleteObject(item as! NSManagedObject)
                }
                try context.save()
            }
            
            //-- insert new rows
            for item in data {
                let name: String? = item["name"] as! NSString as String
                let code: String? = item["code"] as! NSString as String
                print("Age Ranges ... code = '\(code!)', name = '\(name!)' ")
                
                let newItem = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
                newItem.setValue(name!, forKey: "name")
                newItem.setValue(code!, forKey: "code")
                try context.save()
            }
            print(" ")
            print(" ")
        }
        catch {
            let fetchError = error as NSError
            print("fetch error : '\(fetchError)' ")
        }
    }
    
}

