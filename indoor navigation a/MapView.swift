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
    
    private var rooms:[Polygon] = [Polygon(points: [[0, 0], [3, 0], [3, 5], [0, 5]]), Polygon(points: [[7, 0], [11, 0], [11, 10], [7, 10]]), Polygon(points: [[3, 0], [7, 0], [7, 10], [3, 5]])]
    
    private var exits: [Int: [Polygon]] = [1: [Polygon(points: [[7, 1], [7, 2]]), Polygon(points: [[7, 4], [7, 6]])], 2: [Polygon(points: [[3, 2], [3, 3]])]]

    private var vertexes: [(CGPoint, Double)] = [(CGPoint(x: 7, y: 5), 1), (CGPoint(x: 3, y: 2.5), 1)]
    
    private func drawRooms(figures: [Polygon], minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) {
        for index in 0 ..< figures.count {
            figures[index].offset(dx: -minX, dy: -minY)
            figures[index].adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY)
            figures[index].offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01)
            figures[index].adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale))
            figures[index].offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY))
        }
        
        for current in figures {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: current.points[0][0], y: current.points[0][1]))
            path.addLine(to: CGPoint(x: current.points[1][0], y: current.points[1][1]))
            path.addLine(to: CGPoint(x: current.points[2][0], y: current.points[2][1]))
            path.addLine(to: CGPoint(x: current.points[3][0], y: current.points[3][1]))
            path.close()
            
            path.lineWidth = CGFloat(1.0)
            //UIColor.blue.setFill()
            UIColor.black.setStroke()
            //path.fill()
            path.stroke()
        }
    }
    
        private func drawExits(exits: [Int: [Polygon]], minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) {
        for key in exits.keys {
            for index in 0 ..< exits[key]!.count {
                exits[key]![index].offset(dx: -minX, dy: -minY)
                exits[key]![index].adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY)
                exits[key]![index].offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01)
                exits[key]![index].adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale))
                exits[key]![index].offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY))
            }
        }
        
        for key in exits.keys {
            for index in 0 ..< exits[key]!.count {
                let path = UIBezierPath()
                path.move(to: CGPoint(x: exits[key]![index].points[0][0], y: exits[key]![index].points[0][1]))
                path.addLine(to: CGPoint(x: exits[key]![index].points[1][0], y: exits[key]![index].points[1][1]))
                
                path.lineWidth = CGFloat(2.0)
                UIColor.white.setStroke()
                path.stroke()
            }
        }
    }
    
    private func drawPoints(vertexes: [(CGPoint, Double)], minX: Double, minY: Double, maxX: Double, maxY: Double, ratioX: Double, ratioY: Double) -> [(CGPoint, Double)] {
        var secondVertexesArray: [(CGPoint, Double)] = vertexes
         for index in 0 ..< vertexes.count {
            let newVertexValue: (center: CGPoint, radius: Double) = (secondVertexesArray[index].0.offset(dx: -minX, dy: -minY).adjustCoordinates(multiplierX: ratioX, multiplierY: ratioY).offset(dx: Double(bounds.width) * 0.01, dy: Double(bounds.height) * 0.01).adjustCoordinates(multiplierX: Double(mapScale), multiplierY: Double(mapScale)).offset(dx: -Double(mapOffsetX), dy: -Double(mapOffsetY)), vertexes[index].1)
             secondVertexesArray[index] = newVertexValue
         }
        
        for current in secondVertexesArray {
            let path = UIBezierPath()
            
            path.addArc(withCenter: current.0, radius: CGFloat(current.1), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            path.close()
            
            path.lineWidth = CGFloat(1.0)
            UIColor.blue.setFill()
            UIColor.black.setStroke()
            path.fill()
            path.stroke()
        }
         
        return secondVertexesArray
    }
    
    override func draw(_ rect: CGRect) {
        
        var minX = Double.infinity
        var maxX = -Double.infinity
        var minY = Double.infinity
        var maxY = -Double.infinity
        
        for current in rooms {
            for point in current.points {
                minX = min(minX, point[0])
                maxX = max(maxX, point[0])
            
                minY = min(minY, point[1])
                maxY = max(maxY, point[1])
            }
        }
        
        let ratioX = (Double(bounds.width) * 0.98) / (maxX - minX)
        let ratioY = (Double(bounds.height) * 0.98) / (maxY - minY)

        drawRooms(figures: rooms, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
        drawExits(exits: exits, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
        vertexes = drawPoints(vertexes: vertexes, minX: minX, minY: minY, maxX: maxX, maxY: maxY, ratioX: ratioX, ratioY: ratioY)
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
            points[index][0] += dx
            points[index][1] += dy
        }
    }
    
    func adjustCoordinates(multiplierX: Double, multiplierY: Double) {
        for index in 0 ..< points.count {
            points[index][0] *= multiplierX
            points[index][1] *= multiplierY
        }
    }
}
