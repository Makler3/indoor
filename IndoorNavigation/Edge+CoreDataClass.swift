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
    convenience init(distance: Double, vertexfromrelationship: Vertex, vertextorelationship: Vertex, doorscoordinates: String?, comment: String?) {
        self.init()
        self.id = Int64(Edge.maximum())
        self.distance = distance
        self.vertextorelationship = vertextorelationship
        self.vertexfromrelationship = vertexfromrelationship
        self.doorscoordinates = doorscoordinates
        self.comment = comment
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
