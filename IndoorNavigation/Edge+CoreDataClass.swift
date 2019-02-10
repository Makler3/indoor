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
    convenience init(id: String, distance: String, doorscoordinates: String?, comment: String?, vertexto: String?, vertexfrom: String?) {
//        @NSManaged public var id: Int64
//        @NSManaged public var distance: Double
//        @NSManaged public var doorscoordinates: String?
//        @NSManaged public var comment: String?
//        @NSManaged public var vertexfromrelationship: Vertex?
//        @NSManaged public var vertextorelationship: Vertex?
        self.init()
        self.id = id
        self.distance = distance
        self.doorscoordinates = doorscoordinates
        self.comment = comment
        self.vertexto = vertexto!
        self.vertexfrom = vertexfrom!
    }
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
            print("I'm here")
            return 1
        }
    }
}
