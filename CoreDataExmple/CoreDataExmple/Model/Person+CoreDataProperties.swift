//
//  Person+CoreDataProperties.swift
//  CoreDataExmple
//
//  Created by Namik Karabiyik on 16.01.2023.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: Int16

}

extension Person : Identifiable {

}
