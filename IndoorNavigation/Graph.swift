//
//  Graph.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

class Graph {
    var adjacencyList = [Vertex : [(vertex: Vertex, length: Double)]] ()
    
    init(edgesList: [Edge], vertexesList: [Vertex]) {
        for currentEdge in edgesList {
            if let from = currentEdge.vertexfromrelationship, let to = currentEdge.vertextorelationship {
                if self.adjacencyList[from] == nil {
                    self.adjacencyList[from] = Array()
                }
                self.adjacencyList[from]!.append((to, currentEdge.distance))
            }
        }
    }
    
    func findShortestPathRunningDijkstra(start: Vertex, finish: Vertex) -> (Double?, [Vertex]) {
        var usedVertexes = Set<Vertex>()
        var distances = [Vertex : Double]()
        var parents = [Vertex: Vertex]()
        
        distances[start] = 0
        while true {
            var currentVertex: Vertex? = nil
            
            
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
                if (distances[connected.vertex] ?? Double.infinity > distances[currentVertex!]! + connected.length) {
                    distances[connected.vertex] = distances[currentVertex!]! + connected.length
                    parents[connected.vertex] = currentVertex
                }
            }
        }
        
        if distances[finish] == nil {
            return (nil, Array())
        }
        
        var lastVertexInPath = finish
        var shortestPath = [Vertex]()
        while (lastVertexInPath != start) {
            shortestPath.append(lastVertexInPath)
            lastVertexInPath = parents[lastVertexInPath]!
        }
        shortestPath.append(start)
        shortestPath.reverse()
        
        return (distances[finish], shortestPath)
    }
}
