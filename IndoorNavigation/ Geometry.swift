//
//   Geometry.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 07/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import Foundation

let eps = 1e-4

func crossProduct(firstVector: (x: Double, y: Double), secondVector: (x: Double, y: Double)) -> Double {
    return firstVector.x * secondVector.y - firstVector.y * secondVector.x
}

func dotProduct(firstVector: (x: Double, y: Double), secondVector: (x: Double, y: Double)) -> Double {
    return firstVector.x * secondVector.x + firstVector.y * secondVector.y
}

func sqr(_ value: Double) -> Double {
    return value * value
}

func distance(_ first: (x: Double, y: Double), _ second: (x: Double, y: Double)) -> Double {
    return sqrt(sqr(first.x - second.x) + sqr(first.y - second.y))
}

func circlesIntersection(first: (x: Double, y: Double, r: Double), second: (x: Double, y: Double, r: Double)) -> [(x: Double, y: Double)]? {
    let dist = sqrt(sqr(first.x - second.x) + sqr(first.y - second.y))
    if dist > first.r + second.r || dist + min(first.r, second.r) < max(first.r, second.r) {
        return nil
    }
    
    //x^2+y^2=first.r^2
    //(dist-x)^2+y^2=second.r^2
    let x = (sqr(dist) - sqr(second.r) + sqr(first.r)) / 2 / dist
    let y = sqrt(sqr(first.r) - sqr(x))
    let vector = (x: (second.x - first.x) / dist, y: (second.y - first.y) / dist)
    
    let firstPoint = (x: first.x + vector.x * x + vector.y * y, y: first.y + vector.y * x - vector.x * y)
    let secondPoint = (x: first.x + vector.x * x - vector.y * y, y: first.y + vector.y * x + vector.x * y)
    
    return [firstPoint, secondPoint]
}

func isInside(point: (x: Double, y: Double), first: (x: Double, y: Double), second: (x: Double, y: Double)) -> Bool {
    let firstVector = (x: first.x - point.x, y: first.y - point.y)
    let secondVector = (x: second.x - point.x, y: second.y - point.y)
    
    if abs(crossProduct(firstVector: firstVector, secondVector: secondVector)) < eps {
        if first <= second {
            return first <= point && point <= second
        }
        else {
            return second <= point && point <= first
        }
    }
    
    return false
}

extension Double {
    func sign() -> Int {
        if self > 0 {
            return 1
        }
        if self < 0 {
            return -1
        }
        
        return 0
    }
}

/*func getPointFromThreeCircles(circles: [(x: Double, y: Double, r: Double)]) -> (x: Double, y: Double)? {
    if circles.count != 3 {
        return nil
    }
    
    var sumOfAllResults = (x: 0.0, y: 0.0)
    var count = 0
    
    var intersect = circlesIntersection(first: circles[0], second: circles[1])
    
    if intersect != nil {
        for current in intersect! {
            if (distance(current, (x: circles[2].x, y: circles[2].y)) < eps) {
                sumOfAllResults.x += current.x
                sumOfAllResults.y += current.y
                count += 1
            }
        }
    }
    
    intersect = circlesIntersection(first: circles[0], second: circles[2])
    
    if intersect != nil {
        for current in intersect! {
            if (distance(current, (x: circles[1].x, y: circles[1].y)) < eps) {
                sumOfAllResults.x += current.x
                sumOfAllResults.y += current.y
                count += 1
            }
        }
    }
    
    intersect = circlesIntersection(first: circles[1], second: circles[2])
    
    if intersect != nil {
        for current in intersect! {
            if (distance(current, (x: circles[0].x, y: circles[0].y)) < eps) {
                sumOfAllResults.x += current.x
                sumOfAllResults.y += current.y
                count += 1
            }
        }
    }
    
    if count == 0 {
        return nil
    }
    
    return (x: sumOfAllResults.x / Double(count), y: sumOfAllResults.y / Double(count))
}

func getPointFromBeaconDistances(beacons: [(x: Double, y: Double, r: Double)]?) -> (x: Double, y: Double)? {
    var sumOfAllResults = (x: 0.0, y: 0.0)
    var count = 0
    
    if let circles = beacons {
        for firstIndex in circles.indices {
            for secondIndex in circles.indices {
                for thirdIndex in circles.indices {
                    if firstIndex == secondIndex || firstIndex == thirdIndex || secondIndex == thirdIndex {
                        continue
                    }
                    
                    let firstVector = (x: circles[secondIndex].x - circles[firstIndex].x, y: circles[secondIndex].y - circles[firstIndex].y)
                    
                    let secondVector = (x: circles[thirdIndex].x - circles[firstIndex].x, y: circles[thirdIndex].y - circles[firstIndex].y)
                    
                    if crossProduct(firstVector: firstVector, secondVector: secondVector) == 0 {
                        continue
                    }
                    
                    if let intersect = getPointFromThreeCircles(circles: [circles[firstIndex], circles[secondIndex], circles[thirdIndex]]) {
                        sumOfAllResults.x += intersect.x
                        sumOfAllResults.y += intersect.y
                        
                        count += 1
                    }
                    
                }
            }
        }
        
        if count == 0 {
            return nil
        }
        return (x: sumOfAllResults.x / Double(count), y: sumOfAllResults.y / Double(count))
    }
    
    return nil
}*/
