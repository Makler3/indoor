//
//  Beacons+CoreDataProperties.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 09/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//
//

import Foundation
import CoreData


extension Beacons {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beacons> {
        return NSFetchRequest<Beacons>(entityName: "Beacons")
    }

    @NSManaged public var comment: String?
    @NSManaged public var coordinates: String?
    @NSManaged public var height: String?
    @NSManaged public var id: String?
    @NSManaged public var majorminor: String?
    @NSManaged public var name: String?
    @NSManaged public var uuid: String?
    @NSManaged public var roomsrelationship: Rooms?

}
