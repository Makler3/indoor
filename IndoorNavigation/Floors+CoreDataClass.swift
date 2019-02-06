//
//  Floors+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Floors)
public class Floors: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Floors", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Floors.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(name: String?, comment: String?) {
        
        self.init()
        self.name = name
        self.id = Int64(Floors.maximum())
        self.comment = comment
    }
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Floors")
        
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
