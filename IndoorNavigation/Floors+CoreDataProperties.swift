//
//  Floors+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Floors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Floors> {
        return NSFetchRequest<Floors>(entityName: "Floors")
    }

    @NSManaged public var comment: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var buildingsrelationship: Buildings?
    @NSManaged public var roomsrelationship: NSSet?

}

// MARK: Generated accessors for roomsrelationship
extension Floors {

    @objc(addRoomsrelationshipObject:)
    @NSManaged public func addToRoomsrelationship(_ value: Rooms)

    @objc(removeRoomsrelationshipObject:)
    @NSManaged public func removeFromRoomsrelationship(_ value: Rooms)

    @objc(addRoomsrelationship:)
    @NSManaged public func addToRoomsrelationship(_ values: NSSet)

    @objc(removeRoomsrelationship:)
    @NSManaged public func removeFromRoomsrelationship(_ values: NSSet)

}
