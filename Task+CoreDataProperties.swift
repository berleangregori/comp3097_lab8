//
//  Task+CoreDataProperties.swift
//  comp3097_lab8_101465969
//
//  Created by Joshua Nuezca on 2025-03-13.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?

}

extension Task : Identifiable {

}
