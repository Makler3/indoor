//
//  Graph.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

class Graph {
    var adjacencyList = [GraphVertex : [(vertex: GraphVertex, length: Int)]] ()
    
    init(edgesList: [GraphEdge], vertexesList: [GraphVertex]) {
        for currentEdge in edgesList {
            if self.adjacencyList[currentEdge.from] == nil {
                self.adjacencyList[currentEdge.from] = Array()
            }
            self.adjacencyList[currentEdge.from]!.append((currentEdge.to, currentEdge.length))
        }
    }
    
    func findShortestPathRunningDijkstra(start: GraphVertex, finish: GraphVertex) -> (Int?, [GraphVertex]) {
        var usedVertexes = Set<GraphVertex>()
        var distances = [GraphVertex : Int]()
        var parents = [GraphVertex: GraphVertex]()
        
        distances[start] = 0
        while true {
            var currentVertex: GraphVertex? = nil
            
            
            for probablyNewCurrentVertex in adjacencyList.keys {
                if (usedVertexes.contains(probablyNewCurrentVertex) == false) {
                    if distances[probablyNewCurrentVertex] == nil {
                        continue
                    }
                    
                    if currentVertex == nil {
                        currentVertex = probablyNewCurrentVertex
                    }
                    else if distances[probablyNewCurrentVertex]! < distances[currentVertex!]! {
                        currentVertex = probablyNewCurrentVertex
                    }
                }
            }
            
            if currentVertex == nil {
                break
            }
            
            usedVertexes.insert(currentVertex!)
            
            for connected in adjacencyList[currentVertex!] ?? Array() {
                if (distances[connected.vertex] ?? Int(Double.infinity) > distances[currentVertex!]! + connected.length) {
                    distances[connected.vertex] = distances[currentVertex!]! + connected.length
                    parents[connected.vertex] = currentVertex
                }
            }
        }
        
        if distances[finish] == nil {
            return (nil, Array())
        }
        
        var lastVertexInPath = finish
        var shortestPath = [GraphVertex]()
        while (lastVertexInPath != start) {
            shortestPath.append(lastVertexInPath)
            lastVertexInPath = parents[lastVertexInPath]!
        }
        shortestPath.append(start)
        shortestPath.reverse()
        
        return (distances[finish], shortestPath)
    }
}
