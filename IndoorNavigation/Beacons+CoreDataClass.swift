//
//  Beacons+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Beacons)
public class Beacons: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Beacons", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Beacons.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(name: String, coordinates: String, majorminor: String, uuid: String, comment: String) {
//        @NSManaged public var comment: String?
//        @NSManaged public var id: Int64
//        @NSManaged public var name: String?
//        @NSManaged public var coordinates: String?
//        @NSManaged public var majorminor: String?
//        @NSManaged public var uuid: String?
//        @NSManaged public var roomsrelationship: Rooms?
        self.init()
        self.id = Int64(Beacons.maximum())
        self.name = name
        self.coordinates = coordinates
        self.majorminor = majorminor
        self.uuid = uuid
        self.comment = comment
    }
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Beacons")
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "id", ascending: true)
        ]
        do {
            let results = try CoreDataHelper.instance.context.fetch(fetchRequest)
            return results.count
        } catch {
            print("I'm here")
            return 1
        }
    }
}
