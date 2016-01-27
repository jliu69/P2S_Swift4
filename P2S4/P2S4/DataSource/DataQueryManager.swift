//
//  DataQueryManager.swift
//  P2S4
//
//  Created by Johnson Liu on 1/26/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit
import CoreData


@objc protocol DataQueryManagerDelegate {
    
    optional func selectionData(type: String, data: Array<AnyObject>)
}


class DataQueryManager: NSObject {
    
    var delegate: DataQueryManagerDelegate! = nil
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    
    //MARK: - redirects
    
    func selectDataWithType(type: String, sportId: String) {
        
        switch (type) {
        case SelectionType.sport:
            self.allSportsData()
            break
        case SelectionType.nation:
            self.allNationsData()
            break
        case SelectionType.state:
            self.allStatesData()
            break
        case SelectionType.position:
            self.positionsDataWithSport(sportId)
            break
        case SelectionType.skill:
            self.skillsDataWithSport(sportId)
            break
        case SelectionType.ageRange:
            self.allAgeRangesData()
            break
        case SelectionType.height:
            self.allHeightsData()
            break
        case SelectionType.weight:
            self.allWeightsData()
            break
        default:
            break
        }
        
    }
    
    //MARK: - full selections
    
    func allSportsData() {
        
        dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            var resultsArray: Array<AnyObject>? = [AnyObject]()
            let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDele.managedObjectContext
            
            do {
                let entity = NSEntityDescription.entityForName("Sports", inManagedObjectContext: context)
                
                let fetchRequest = NSFetchRequest()
                fetchRequest.entity = entity!
                
                var sortDescriptor = NSSortDescriptor(key: "sportId", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                let queryResults = try context.executeFetchRequest(fetchRequest)
                if queryResults.count > 0 {
                    for item in queryResults as! [Sports] {
                        var dataObject: CommonDataObject? = CommonDataObject()
                        dataObject!.name = item.name
                        dataObject!.code = item.sportId
                        resultsArray!.append(dataObject!)
                    }
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.selectionResults(SelectionType.sport, data: resultsArray!)
                }
            }
            catch {
                let fetchError = error as NSError
                print("fetch error : '\(fetchError)' ")
            }
        }
    }
    
    func allNationsData() {
        
        dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            var resultsArray: Array<AnyObject>? = [AnyObject]()
            let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDele.managedObjectContext
            
            do {
                let entity = NSEntityDescription.entityForName("Nations", inManagedObjectContext: context)
                
                let fetchRequest = NSFetchRequest()
                fetchRequest.entity = entity!
                
                var sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                let queryResults = try context.executeFetchRequest(fetchRequest)
                if queryResults.count > 0 {
                    for item in queryResults as! [Nations] {
                        var dataObject: CommonDataObject? = CommonDataObject()
                        dataObject!.name = item.name
                        dataObject!.code = item.code
                        resultsArray!.append(dataObject!)
                    }
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.selectionResults(SelectionType.nation, data: resultsArray!)
                }
            }
            catch {
                let fetchError = error as NSError
                print("fetch error : '\(fetchError)' ")
            }
        }
    }
    
    func allStatesData() {
        
        dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            var resultsArray: Array<AnyObject>? = [AnyObject]()
            let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDele.managedObjectContext
            
            do {
                let entity = NSEntityDescription.entityForName("States", inManagedObjectContext: context)
                
                let fetchRequest = NSFetchRequest()
                fetchRequest.entity = entity!
                
                var sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                let queryResults = try context.executeFetchRequest(fetchRequest)
                if queryResults.count > 0 {
                    for item in queryResults as! [States] {
                        var dataObject: CommonDataObject? = CommonDataObject()
                        dataObject!.name = item.name
                        dataObject!.code = item.code
                        resultsArray!.append(dataObject!)
                    }
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.selectionResults(SelectionType.state, data: resultsArray!)
                }
            }
            catch {
                let fetchError = error as NSError
                print("fetch error : '\(fetchError)' ")
            }
        }
    }
    
    func allAgeRangesData() {
        
        dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            var resultsArray: Array<AnyObject>? = [AnyObject]()
            let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDele.managedObjectContext
            
            do {
                let entity = NSEntityDescription.entityForName("AgeRanges", inManagedObjectContext: context)
                
                let fetchRequest = NSFetchRequest()
                fetchRequest.entity = entity!
                
                var sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                let queryResults = try context.executeFetchRequest(fetchRequest)
                if queryResults.count > 0 {
                    for item in queryResults as! [AgeRanges] {
                        var dataObject: CommonDataObject? = CommonDataObject()
                        dataObject!.name = item.name
                        dataObject!.code = item.code
                        resultsArray!.append(dataObject!)
                    }
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.selectionResults(SelectionType.ageRange, data: resultsArray!)
                }
            }
            catch {
                let fetchError = error as NSError
                print("fetch error : '\(fetchError)' ")
            }
        }
    }
    
    func allHeightsData() {
        
        dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            var resultsArray: Array<AnyObject>? = [AnyObject]()
            let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDele.managedObjectContext
            
            do {
                let entity = NSEntityDescription.entityForName("Heights", inManagedObjectContext: context)
                
                let fetchRequest = NSFetchRequest()
                fetchRequest.entity = entity!
                
                var sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                let queryResults = try context.executeFetchRequest(fetchRequest)
                if queryResults.count > 0 {
                    for item in queryResults as! [Heights] {
                        var dataObject: CommonDataObject? = CommonDataObject()
                        dataObject!.name = item.name
                        dataObject!.code = item.code
                        resultsArray!.append(dataObject!)
                    }
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.selectionResults(SelectionType.height, data: resultsArray!)
                }
            }
            catch {
                let fetchError = error as NSError
                print("fetch error : '\(fetchError)' ")
            }
        }
    }
    
    func allWeightsData() {
        
        dispatch_async(dispatch_get_global_queue(self.priority, 0)) {
            
            var resultsArray: Array<AnyObject>? = [AnyObject]()
            let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDele.managedObjectContext
            
            do {
                let entity = NSEntityDescription.entityForName("Weights", inManagedObjectContext: context)
                
                let fetchRequest = NSFetchRequest()
                fetchRequest.entity = entity!
                
                var sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                let queryResults = try context.executeFetchRequest(fetchRequest)
                if queryResults.count > 0 {
                    for item in queryResults as! [Weights] {
                        var dataObject: CommonDataObject? = CommonDataObject()
                        dataObject!.name = item.name
                        dataObject!.code = item.code
                        resultsArray!.append(dataObject!)
                    }
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.selectionResults(SelectionType.weight, data: resultsArray!)
                }
            }
            catch {
                let fetchError = error as NSError
                print("fetch error : '\(fetchError)' ")
            }
        }
    }
    
    //MARK: - with sports ID
    
    func positionsDataWithSport(sportId: String) {
        //
    }
    
    func skillsDataWithSport(sportId: String) {
        //
    }
    
    //MARK: - return data
    
    func selectionResults(type: String, data: Array<AnyObject>) {
        delegate?.selectionData?(type, data: data)
    }
    
    
}

