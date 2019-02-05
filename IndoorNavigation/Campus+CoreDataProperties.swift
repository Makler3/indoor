//
//  Campus+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Campus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Campus> {
        return NSFetchRequest<Campus>(entityName: "Campus")
    }

    @NSManaged public var comment: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var buildingsrelationship: NSSet?

}

// MARK: Generated accessors for buildingsrelationship
extension Campus {

    @objc(addBuildingsrelationshipObject:)
    @NSManaged public func addToBuildingsrelationship(_ value: Buildings)

    @objc(removeBuildingsrelationshipObject:)
    @NSManaged public func removeFromBuildingsrelationship(_ value: Buildings)

    @objc(addBuildingsrelationship:)
    @NSManaged public func addToBuildingsrelationship(_ values: NSSet)

    @objc(removeBuildingsrelationship:)
    @NSManaged public func removeFromBuildingsrelationship(_ values: NSSet)

}
