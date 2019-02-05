//
//  GraphEdge.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

class GraphEdge {
    var from: GraphVertex
    var to: GraphVertex
    var length: Int
    
    init(from: GraphVertex, to: GraphVertex, length: Int) {
        self.from = from
        self.to = to
        self.length = length
    }
}
