//
//  Polygon.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

/*class Polygon {
    
    var points = [(x: Double, y: Double)]()
    
    init(points: [(Double, Double)]) {
        self.points = points
    }
    
}*/

class Polygon: Codable {
    var points: [[Double]]
    
    init(points: [[Double]]) {
        self.points = points
    }
}
