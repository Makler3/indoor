//
//  GraphVertex.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

class GraphVertex: Hashable {
    
    var hashValue: Int {
        return identifier
    }
    
    static func == (lhs: GraphVertex, rhs: GraphVertex) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var identifier : Int
    
    init(identifier: Int){
        self.identifier = GraphVertex.GetUniqueIdentifier()
    }
    
    private static var uniqueIdentifier = 0
    private static func GetUniqueIdentifier() -> Int{
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    
}

