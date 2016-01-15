//
//  AppDelegate.swift
//  P2S4
//
//  Created by Johnson Liu on 1/6/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var currentUser: CurrentUserObject? = CurrentUserObject()
    var urlHeader: String? = ""
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        var email: String?
        email = NSUserDefaults.standardUserDefaults().valueForKey(UserDefaultKeys.savedUserEmail) as? String
        if email == nil {
            NSUserDefaults.standardUserDefaults().setValue("", forKey: UserDefaultKeys.savedUserEmail)
        }
        
        var password: String?
        password = NSUserDefaults.standardUserDefaults().valueForKey(UserDefaultKeys.savedUserPassword) as? String
        if password == nil {
            NSUserDefaults.standardUserDefaults().setValue("", forKey: UserDefaultKeys.savedUserPassword)
        }
        
        
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("dbLink", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
            
            if let dict = myDict {
                let envValue: String? = dict.objectForKey("env") as? NSString as? String
                
                if envValue != nil && envValue! == "prod" {
                    self.urlHeader = dict.objectForKey("prod") as? NSString as? String
                }
                else {
                    self.urlHeader = dict.objectForKey("dev") as? NSString as? String
                }
            }
        }
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {}
    
    func applicationDidEnterBackground(application: UIApplication) {}
    
    func applicationWillEnterForeground(application: UIApplication) {}
    
    func applicationDidBecomeActive(application: UIApplication) {}
    
    func applicationWillTerminate(application: UIApplication) {}
    
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        
        // The directory the application uses to store the Core Data store file. This code uses a directory named "HomeOffice.Test8" in the application's documents Application Support directory.
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        
        let modelURL = NSBundle.mainBundle().URLForResource("Selection", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    }()
    
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
}

