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
    convenience init(comment: String?, polygon: String, name: String?, type: Int) {
        self.init()
        self.comment = comment
        self.polygon = polygon
        self.id = Int64(Rooms.maximum())
        self.name = name
        self.type = Int64(type)

    }
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Rooms")
        
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
