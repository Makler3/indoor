//
//  Vertex+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Vertex {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vertex> {
        return NSFetchRequest<Vertex>(entityName: "Vertex")
    }

    @NSManaged public var id: Int64
    @NSManaged public var coordinates: String?
    @NSManaged public var comment: String?
    @NSManaged public var roomsrelationship: Rooms?
    @NSManaged public var edgetorelationship: NSSet?
    @NSManaged public var edgefromrelationship: NSSet?

}

// MARK: Generated accessors for edgetorelationship
extension Vertex {

    @objc(addEdgetorelationshipObject:)
    @NSManaged public func addToEdgetorelationship(_ value: Edge)

    @objc(removeEdgetorelationshipObject:)
    @NSManaged public func removeFromEdgetorelationship(_ value: Edge)

    @objc(addEdgetorelationship:)
    @NSManaged public func addToEdgetorelationship(_ values: NSSet)

    @objc(removeEdgetorelationship:)
    @NSManaged public func removeFromEdgetorelationship(_ values: NSSet)

}

// MARK: Generated accessors for edgefromrelationship
extension Vertex {

    @objc(addEdgefromrelationshipObject:)
    @NSManaged public func addToEdgefromrelationship(_ value: Edge)

    @objc(removeEdgefromrelationshipObject:)
    @NSManaged public func removeFromEdgefromrelationship(_ value: Edge)

    @objc(addEdgefromrelationship:)
    @NSManaged public func addToEdgefromrelationship(_ values: NSSet)

    @objc(removeEdgefromrelationship:)
    @NSManaged public func removeFromEdgefromrelationship(_ values: NSSet)

}
