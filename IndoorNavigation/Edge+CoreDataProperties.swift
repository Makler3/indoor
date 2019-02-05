//
//  Edge+CoreDataProperties.swift
//  TableData
//
//  Created by Александр Воронцов on 05/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//
//

import Foundation
import CoreData


extension Edge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Edge> {
        return NSFetchRequest<Edge>(entityName: "Edge")
    }

    @NSManaged public var id: Int64
    @NSManaged public var distance: Double
    @NSManaged public var doorscoordinates: String?
    @NSManaged public var comment: String?
    @NSManaged public var vertexfromrelationship: Vertex?
    @NSManaged public var vertextorelationship: Vertex?

}
