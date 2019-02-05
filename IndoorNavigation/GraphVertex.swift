//
//  GraphVertex.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

class GraphVertex: Hashable, Codable {
    
    var hashValue: Int {
        return identifier
    }
    
    static func == (lhs: GraphVertex, rhs: GraphVertex) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var identifier : Int
    var roomId: Int
    var coordinates: [[Double]]
    
<<<<<<< Updated upstream
    init(roomId: Int, coordinates: [[Double]]){
        self.identifier = GraphVertex.getUniqueIdentifier()
        self.coordinates = coordinates
        self.roomId = roomId
    }
    
    private static var uniqueIdentifier = 0
    private static func getUniqueIdentifier() -> Int{
=======
    init(identifier: Int) {
        self.identifier = GraphVertex.GetUniqueIdentifier()
    }
    
    private static var uniqueIdentifier = 0
    private static func GetUniqueIdentifier() -> Int {
>>>>>>> Stashed changes
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    
}

