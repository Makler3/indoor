//
//  Buildings+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Buildings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Buildings> {
        return NSFetchRequest<Buildings>(entityName: "Buildings")
    }

    @NSManaged public var adress: String?
    @NSManaged public var comment: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var campusrelationship: Campus?
    @NSManaged public var floorsrelationship: NSSet?

}

// MARK: Generated accessors for floorsrelationship
extension Buildings {

    @objc(addFloorsrelationshipObject:)
    @NSManaged public func addToFloorsrelationship(_ value: Floors)

    @objc(removeFloorsrelationshipObject:)
    @NSManaged public func removeFromFloorsrelationship(_ value: Floors)

    @objc(addFloorsrelationship:)
    @NSManaged public func addToFloorsrelationship(_ values: NSSet)

    @objc(removeFloorsrelationship:)
    @NSManaged public func removeFromFloorsrelationship(_ values: NSSet)

}
