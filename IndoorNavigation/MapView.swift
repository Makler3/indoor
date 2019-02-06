//
//  MapView.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import UIKit

class MapView: UIView {
    
    var mapScale: CGFloat = 1.0 { didSet { setNeedsDisplay() } }
    var mapOffsetX: CGFloat = 0.0 { didSet { setNeedsDisplay() } }
    var mapOffsetY: CGFloat = 0.0 { didSet { setNeedsDisplay() } }
    
    var needsPathBuild: Bool = false { didSet { setNeedsDisplay() } }
    var pathVertexes: [Vertex]? = nil { didSet { setNeedsDisplay() } }
    
    @objc func adjustMapScale(byHandlingGestureRecognizer recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed, .ended:
            mapScale *= recognizer.scale
            recognizer.scale = 1.0
            if mapScale < 0.25 {
                mapScale = 0.25
            }
            if mapScale > 10 {
                mapScale = 10
            }
        default:
            break
        }
    }
    
    @objc func adjustMapOffset(byHandlingGestureRecognizer recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            mapOffsetX += -recognizer.translation(in: recognizer.view).x
            mapOffsetY += -recognizer.translation(in: recognizer.view).y
            recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
        case .changed:
            mapOffsetX += -recognizer.translation(in: recognizer.view).x
            mapOffsetY += -recognizer.translation(in: recognizer.view).y
            recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
            
        default:
            break
        }
    }
    
    private func drawRooms(rooms: [Rooms], minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) {
        
        var figures =  [Polygon]()
        for room in rooms {
            figures.append(Polygon(points: room.parsePolygon()!))
        }
        
        for index in 0 ..< figures.count {
            figures[index].offset(dx: -minX, dy: -minY)
            figures[index].adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY)
            figures[index].offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01)
            figures[index].adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale))
            figures[index].offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY))
        }
        
        for current in figures {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: current.points[0].x, y: current.points[0].y))
            path.addLine(to: CGPoint(x: current.points[1].x, y: current.points[1].y))
            path.addLine(to: CGPoint(x: current.points[2].x, y: current.points[2].y))
            path.addLine(to: CGPoint(x: current.points[3].x, y: current.points[3].y))
            path.close()
            
            path.lineWidth = CGFloat(1.0)
            //UIColor.blue.setFill()
            UIColor.black.setStroke()
            //path.fill()
            path.stroke()
        }
    }
    
    private func drawExits(exits: [Edge], minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) {
        
        var exitsLines = [Polygon]()
        for exit in exits {
            if let currentExit = exit.parseDoordsCoordinates() {
                exitsLines.append(Polygon(points: currentExit))
            }
        }
        
        for index in exitsLines.indices {
            exitsLines[index].offset(dx: -minX, dy: -minY)
            exitsLines[index].adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY)
            exitsLines[index].offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01)
            exitsLines[index].adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale))
            exitsLines[index].offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY))
        }
        
        for current in exitsLines {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: current.points[0].x, y: current.points[0].y))
            path.addLine(to: CGPoint(x: current.points[1].x, y: current.points[1].y))
            
            path.lineWidth = CGFloat(2.0)
            UIColor.white.setStroke()
            path.stroke()
        }
    }
    
    private func drawPoints(vertexes: [CGPoint], minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) -> [CGPoint] {
        
        var secondVertexesArray = vertexes
         for index in vertexes.indices {
            let newVertexValue: CGPoint = secondVertexesArray[index].offset(dx: -minX, dy: -minY).adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY).offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01).adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale)).offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY))
             secondVertexesArray[index] = newVertexValue
         }
        
        for current in secondVertexesArray {
            let path = UIBezierPath()
            
            path.addArc(withCenter: current, radius: CGFloat(1), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            path.close()
            
            path.lineWidth = CGFloat(1.0)
            UIColor.blue.setFill()
            UIColor.black.setStroke()
            path.fill()
            path.stroke()
        }
         
        return secondVertexesArray
    }
    
    private func drawPath(vertexes: [CGPoint]?, minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) {
        
        if vertexes == nil {
            return
        }
        if (vertexes?.count == 0) {
            return
        }
        
        var secondVertexesArray = vertexes!
        for index in vertexes!.indices {
            let newVertexValue: CGPoint = secondVertexesArray[index].offset(dx: -minX, dy: -minY).adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY).offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01).adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale)).offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY))
            secondVertexesArray[index] = newVertexValue
        }
        
        let path = UIBezierPath()
        let start = secondVertexesArray[0]
        path.move(to: CGPoint(x: start.x, y: start.y))
        
        for current in secondVertexesArray {
            path.addLine(to: CGPoint(x: current.x, y: current.y))
        }
        
        path.lineWidth = CGFloat(1.0)
        UIColor.blue.setStroke()
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        
        var minX = Double.infinity
        var maxX = -Double.infinity
        var minY = Double.infinity
        var maxY = -Double.infinity
        
        for current in allRooms {
            for point in current.parsePolygon()! {
                minX = min(minX, point.x)
                maxX = max(maxX, point.x)
            
                minY = min(minY, point.y)
                maxY = max(maxY, point.y)
            }
        }
        
        let ratioX = (Double(bounds.width) * 0.98) / (maxX - minX)
        let ratioY = (Double(bounds.height) * 0.98) / (maxY - minY)
        
        //--------Ismagil's comment----------
        /*
         all zoom and offset variables created
        */
        
        drawRooms(rooms: allRooms, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
        
        drawExits(exits: allEdges, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
        
        var vertexes = [CGPoint]()
        for current in allEdges {
            if let point = current.vertexfromrelationship!.parseCoordinates() {
                vertexes.append(CGPoint(x: point.x, y: point.y))
            }
            if let point = current.vertextorelationship!.parseCoordinates() {
                vertexes.append(CGPoint(x: point.x, y: point.y))
            }
        }
        vertexes = drawPoints(vertexes: vertexes, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
        
        //--------Ismagil's comment----------
        /*
         map is created
        */
        
        if needsPathBuild {
            vertexes.removeAll()
            if pathVertexes == nil {
                return
            }
            if pathVertexes!.count == 0 {
                return
            }
            
            for current in pathVertexes! {
                if let point = current.parseCoordinates() {
                    vertexes.append(CGPoint(x: point.x, y: point.y))
                }
            }
            
            drawPath(vertexes: vertexes, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
        }
    }
}

extension CGPoint {
    func offset(dx: Double, dy: Double) -> CGPoint {
        let newX = x + CGFloat(dx)
        let newY = y + CGFloat(dy)
        return CGPoint(x: newX, y: newY)
    }
    
    func adjustCoordinates(multiplierX: Double, multiplierY: Double) -> CGPoint {
        let newX = x * CGFloat(multiplierX)
        let newY = y * CGFloat(multiplierY)
        return CGPoint(x: newX, y: newY)
    }
}

extension Polygon {
    func offset(dx: Double, dy: Double) {
        for index in 0 ..< points.count {
            points[index].x += dx
            points[index].y += dy
        }
    }
    
    func adjustCoordinates(multiplierX: Double, multiplierY: Double) {
        for index in 0 ..< points.count {
            points[index].x *= multiplierX
            points[index].y *= multiplierY
        }
    }
}

extension Vertex {
    func parseCoordinates() -> (x: Double, y: Double)? {
        var current = ""
        
        var coordinateX = 0.0
        var coordinateY = 0.0
        
        for currentSymbol in coordinates {
            if currentSymbol == Character(" ") {
                coordinateX = Double(current)!
                current = ""
            }
            else {
                current.append(currentSymbol)
            }
        }
        
        coordinateY = Double(current)!
        return (x: coordinateX, coordinateY)
    }
}

extension Edge {
    func parseDoordsCoordinates() -> [(x: Double, y: Double)]? {
        
        if doorscoordinates == nil {
            return nil
        }
        
        var current = ""
        
        var arrayToReturn = [(x: Double, y: Double)]()
        
        var coordinateX = 0.0
        var coordinateY = 0.0
        var numberOfCoordinatesFound = 0
        for currentSymbol in doorscoordinates! {
            if currentSymbol == Character(" ") {
                numberOfCoordinatesFound += 1
                
                if numberOfCoordinatesFound % 2 == 1 {
                    coordinateX = Double(current)!
                }
                else {
                    coordinateY = Double(current)!
                    arrayToReturn.append((x: coordinateX, y: coordinateY))
                }
                current = ""
            }
            else {
                current.append(currentSymbol)
            }
        }
        
        if numberOfCoordinatesFound % 2 == 0 {
            return nil
        }
        
        coordinateY = Double(current)!
        arrayToReturn.append((x: coordinateX, y: coordinateY))
        
        return arrayToReturn
    }
}

extension Rooms {
    func parsePolygon() -> [(x: Double, y: Double)]? {
        var current = ""
        
        var arrayToReturn = [(x: Double, y: Double)]()
        
        var coordinateX = 0.0
        var coordinateY = 0.0
        var numberOfCoordinatesFound = 0
        for currentSymbol in polygon {
            if currentSymbol == Character(" ") {
                numberOfCoordinatesFound += 1
                
                if numberOfCoordinatesFound % 2 == 1 {
                    coordinateX = Double(current)!
                }
                else {
                    coordinateY = Double(current)!
                    arrayToReturn.append((x: coordinateX, y: coordinateY))
                }
                current = ""
            }
            else {
                current.append(currentSymbol)
            }
        }
        
        if numberOfCoordinatesFound % 2 == 0 {
            return nil
        }
        
        coordinateY = Double(current)!
        arrayToReturn.append((x: coordinateX, y: coordinateY))

        return arrayToReturn
    }
}
