//
//  Todo+CoreDataProperties.swift
//  TodoApp
//
//  Created by student on 4/15/16.
//  Copyright © 2016 student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var name: String?
    @NSManaged var completed: NSNumber?

}
