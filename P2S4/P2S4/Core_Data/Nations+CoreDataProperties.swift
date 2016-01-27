//
//  Nations+CoreDataProperties.swift
//  P2S4
//
//  Created by Johnson Liu on 1/26/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Nations {

    @NSManaged var code: String?
    @NSManaged var name: String?

}
