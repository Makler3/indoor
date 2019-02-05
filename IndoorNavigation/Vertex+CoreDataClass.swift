//
//  Vertex+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Vertex)
public class Vertex: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Vertex", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Vertex.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(coordinates: String, comment: String) {
//        @NSManaged public var id: Int64
//        @NSManaged public var coordinates: String?
//        @NSManaged public var comment: String?
//        @NSManaged public var roomsrelationship: Rooms?
//        @NSManaged public var edgetorelationship: NSSet?
//        @NSManaged public var edgefromrelationship: NSSet?
        self.init()
        self.id = Int64(Vertex.maximum())
        self.coordinates = coordinates
        self.comment = comment
    }
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Vertex")
        
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
