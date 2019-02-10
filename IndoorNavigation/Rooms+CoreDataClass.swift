//
//  Rooms+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Rooms)
public class Rooms: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Rooms", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Rooms.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(id: String, comment: String?, polygon: String, name: String?, type: Int) {
//        @NSManaged public var comment: String?
//        @NSManaged public var polygon: String?
//        @NSManaged public var id: Int64
//        @NSManaged public var name: String?
//        @NSManaged public var type: Int64
//        @NSManaged public var beaconsrelationship: NSSet?
//        @NSManaged public var floorsrelationship: Floors?
//        @NSManaged public var sessioinrelationship: NSSet?
//        @NSManaged public var vertexrelationship: NSSet?
        self.init()
        self.comment = comment
        self.polygon = polygon
        self.id = id
        self.name = name
        self.type = Int64(type)

    }
    
    class func allitems() -> [Rooms] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Rooms")
        
        
        let results = try? CoreDataHelper.instance.context.fetch(
            fetchRequest)
        
        return results as! [Rooms]
    }
    
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Rooms")
        
        do {
            let results = try CoreDataHelper.instance.context.fetch(fetchRequest)
            return results.count
        } catch {
            print("I'm here")
            return 1
        }
    }
}
