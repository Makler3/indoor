//
//  Buildings+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Buildings)
public class Buildings: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Buildings", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Buildings.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(name: String?, comment: String?, adress: String?) {
        
        self.init()
        self.name = name
        self.id = Int64(Buildings.maximum())
        self.comment = comment
        self.adress = adress
    }
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Buildings")
        
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
