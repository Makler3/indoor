//
//  Rooms+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Rooms {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rooms> {
        return NSFetchRequest<Rooms>(entityName: "Rooms")
    }

    @NSManaged public var comment: String?
    @NSManaged public var polygon: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var type: Int64
    @NSManaged public var beaconsrelationship: NSSet?
    @NSManaged public var floorsrelationship: Floors?
    @NSManaged public var sessioinrelationship: NSSet?
    @NSManaged public var vertexrelationship: NSSet?

}

// MARK: Generated accessors for beaconsrelationship
extension Rooms {

    @objc(addBeaconsrelationshipObject:)
    @NSManaged public func addToBeaconsrelationship(_ value: Beacons)

    @objc(removeBeaconsrelationshipObject:)
    @NSManaged public func removeFromBeaconsrelationship(_ value: Beacons)

    @objc(addBeaconsrelationship:)
    @NSManaged public func addToBeaconsrelationship(_ values: NSSet)

    @objc(removeBeaconsrelationship:)
    @NSManaged public func removeFromBeaconsrelationship(_ values: NSSet)

}

// MARK: Generated accessors for sessioinrelationship
extension Rooms {

    @objc(addSessioinrelationshipObject:)
    @NSManaged public func addToSessioinrelationship(_ value: Session)

    @objc(removeSessioinrelationshipObject:)
    @NSManaged public func removeFromSessioinrelationship(_ value: Session)

    @objc(addSessioinrelationship:)
    @NSManaged public func addToSessioinrelationship(_ values: NSSet)

    @objc(removeSessioinrelationship:)
    @NSManaged public func removeFromSessioinrelationship(_ values: NSSet)

}

// MARK: Generated accessors for vertexrelationship
extension Rooms {

    @objc(addVertexrelationshipObject:)
    @NSManaged public func addToVertexrelationship(_ value: Vertex)

    @objc(removeVertexrelationshipObject:)
    @NSManaged public func removeFromVertexrelationship(_ value: Vertex)

    @objc(addVertexrelationship:)
    @NSManaged public func addToVertexrelationship(_ values: NSSet)

    @objc(removeVertexrelationship:)
    @NSManaged public func removeFromVertexrelationship(_ values: NSSet)

}
