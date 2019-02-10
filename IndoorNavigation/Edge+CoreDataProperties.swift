//
//  Edge+CoreDataProperties.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 09/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//
//

import Foundation
import CoreData


extension Edge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Edge> {
        return NSFetchRequest<Edge>(entityName: "Edge")
    }

    @NSManaged public var comment: String?
    @NSManaged public var distance: String
    @NSManaged public var doorscoordinates: String?
    @NSManaged public var id: String
    @NSManaged public var vertexfrom: String
    @NSManaged public var vertexto: String
    @NSManaged public var vertexfromrelationship: Vertex?
    @NSManaged public var vertextorelationship: Vertex?

}
