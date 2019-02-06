//
//  Beacons+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Beacons {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beacons> {
        return NSFetchRequest<Beacons>(entityName: "Beacons")
    }

    @NSManaged public var comment: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var coordinates: String
    @NSManaged public var majorminor: String?
    @NSManaged public var uuid: String?
    @NSManaged public var roomsrelationship: Rooms?

}
