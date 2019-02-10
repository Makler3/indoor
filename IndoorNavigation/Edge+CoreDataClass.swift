//
//  Edge+CoreDataClass.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Edge)
public class Edge: NSManagedObject {
    override public class func entity() -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: "Edge", in: CoreDataHelper.instance.context)!
    }
    convenience init() {
        self.init(entity: Edge.entity(), insertInto: CoreDataHelper.instance.context)
    }
    convenience init(id: String, distance: String, doorscoordinates: String, comment: String?, vertexto: String, vertexfrom: String) {
        self.init()
        self.id = id
        self.distance = distance
        self.doorscoordinates = doorscoordinates
        self.comment = comment
        self.vertexto = vertexto
        self.vertexfrom = vertexfrom
    }
    
    //--------Ismagil's comment----------
    /*
     coordinates's format: "0 0"
     coordinates need to have 2 coordinates
     */
    
    class func allitems() -> [Edge] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Edge")
        
        let results = try? CoreDataHelper.instance.context.fetch(
            fetchRequest)
        
        return results as! [Edge]
    }
    class func maximum() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Edge")
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "id", ascending: true)
        ]
        do {
            let results = try CoreDataHelper.instance.context.fetch(fetchRequest)
            return results.count
        } catch {
            return 1
        }
    }
}
