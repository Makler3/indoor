//
//  Campus+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//
//import Foundation
//import CoreData
//
//@objc(Campus)
//public class Campus: NSManagedObject {
//    override public class func entity() -> NSEntityDescription {
//        return NSEntityDescription.entity(forEntityName: "Campus", in: CoreDataHelper.instance.context)!
//    }
//    convenience init() {
//        self.init(entity: Campus.entity(), insertInto: CoreDataHelper.instance.context)
//    }
//    convenience init(name: String, comment: String) {
//
//        self.init()
//        self.name = name
//        self.id = Int32(Campus.maximum())
//        self.comment = comment
//    }
//    class func maximum() -> Int {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Campus")
//
//        fetchRequest.sortDescriptors = [
//            NSSortDescriptor(key: "id", ascending: true)
//        ]
//        //        fetchRequest.fetchLimit = 1
//        do {
//            let results = try CoreDataHelper.instance.context.fetch(fetchRequest)
//            return results.count
//        } catch {
//            print("I'm here")
//            return 1
//        }
//    }
//}

import Foundation
import CoreData

@objc(Campus)
public class Campus: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Campus", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Campus.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(id: String, name: String, comment: String) {

        self.init()
        self.name = name
        self.id = id
        self.comment = comment
    }
    class func allitems() -> [Campus] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Campus")

        
        let results = try? CoreDataHelper.instance.context.fetch(
            fetchRequest)
        
        return results as! [Campus]
    }

    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Campus")
        print(fetchRequest)
        //        fetchRequest.fetchLimit = 1
        do {
            let results = try CoreDataHelper.instance.context.fetch(fetchRequest)
            return results.count
        } catch {
            print("I'm here")
            return 1
        }
    }
}
