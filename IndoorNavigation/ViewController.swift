//
//  ViewController.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import UIKit

var allRooms: [Rooms] = [Rooms(comment: nil, polygon: "0 0 3 0 3 5 0 5", name: nil, type: 1), Rooms(comment: nil, polygon: "3 0 7 0 7 10 3 5", name: nil, type: 1), Rooms(comment: nil, polygon: "7 0 11 0 11 10 7 10", name: nil, type: 1)]

var allVertexes = [Vertex]()
var allEdges = [Edge]()

private var graph: Graph = Graph(edgesList: allEdges, vertexesList: allVertexes)

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mapView: MapView! {
        didSet {
            let pinch = UIPinchGestureRecognizer(target: mapView, action: #selector(MapView.adjustMapScale(byHandlingGestureRecognizer:)))
            mapView.addGestureRecognizer(pinch)
            
            let pan = UIPanGestureRecognizer(target: mapView, action: #selector(MapView.adjustMapOffset(byHandlingGestureRecognizer:)))
            mapView.isUserInteractionEnabled = true
            mapView.addGestureRecognizer(pan)
            
            mapView.needsPathBuild = true
            //mapView.pathVertexes = graph.findShortestPathRunningDijkstra(start: , finish: <#T##Rooms#>)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allVertexes.append(Vertex(coordinates: "2 2.5", comment: nil))
        allVertexes.append(Vertex(coordinates: "4 2.5", comment: nil))
        allVertexes.append(Vertex(coordinates: "6 1.5", comment: nil))
        allVertexes.append(Vertex(coordinates: "8 1.5", comment: nil))
        allVertexes.append(Vertex(coordinates: "6 5", comment: nil))
        allVertexes.append(Vertex(coordinates: "8 5", comment: nil))
        
        allVertexes[0].roomsrelationship = allRooms[0]
        allVertexes[1].roomsrelationship = allRooms[1]
        allVertexes[2].roomsrelationship = allRooms[1]
        allVertexes[3].roomsrelationship = allRooms[2]
        allVertexes[4].roomsrelationship = allRooms[1]
        allVertexes[5].roomsrelationship = allRooms[2]
        
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[0], vertextorelationship: allVertexes[1], doorscoordinates: "3 2 3 3", comment: nil))
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[1], vertextorelationship: allVertexes[0], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[2], vertextorelationship: allVertexes[3], doorscoordinates: "7 1 7 2", comment: nil))
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[3], vertextorelationship: allVertexes[2], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[4], vertextorelationship: allVertexes[5], doorscoordinates: "7 4 7 6", comment: nil))
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[5], vertextorelationship: allVertexes[4], doorscoordinates: nil, comment: nil))
        
        allEdges.append(Edge(distance: 3.5, vertexfromrelationship: allVertexes[3], vertextorelationship: allVertexes[5], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 3.5, vertexfromrelationship: allVertexes[5], vertextorelationship: allVertexes[3], doorscoordinates: nil, comment: nil))
        
        allEdges.append(Edge(distance: 3.5, vertexfromrelationship: allVertexes[2], vertextorelationship: allVertexes[4], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 3.5, vertexfromrelationship: allVertexes[4], vertextorelationship: allVertexes[2], doorscoordinates: nil, comment: nil))
        
        allEdges.append(Edge(distance: 1.5, vertexfromrelationship: allVertexes[1], vertextorelationship: allVertexes[2], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 1.5, vertexfromrelationship: allVertexes[2], vertextorelationship: allVertexes[1], doorscoordinates: nil, comment: nil))
        
        allEdges.append(Edge(distance: 100, vertexfromrelationship: allVertexes[1], vertextorelationship: allVertexes[4], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 100, vertexfromrelationship: allVertexes[4], vertextorelationship: allVertexes[1], doorscoordinates: nil, comment: nil))
        
        mapView.pathVertexes = graph.findShortestPathRunningDijkstra(start: allVertexes[5], finish: allRooms[0]).1
        mapView.needsPathBuild = true
    }

}

