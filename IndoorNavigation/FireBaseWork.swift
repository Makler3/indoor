//
//  FireBaseWork.swift
//  TableData
//
//  Created by Александр Воронцов on 06/02/2019.
//  Copyright © 2019 Александр Воронцов. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import CoreData
import UIKit

class WriteBase {
    /*func writeCampus() {
        let ref = Database.database().reference()
        
        let roomRef = ref.child("Campus")
        
        let msu = roomRef.childByAutoId()
        let postmsu = ["name": "MSU",
                    "comment": "Oldest University"] as [String : Any]
        msu.updateChildValues(postmsu)
        
        let hse = roomRef.childByAutoId()
        let posthse = ["name": "HSE",
                    "comment": "Far leaving"] as [String : Any]
        hse.updateChildValues(posthse)
    }
    
    func writeBuildings() {
        let ref = Database.database().reference().child("Campus").child("-LY6PG5DJ_baCMsgTVMn")

        let mainBuilding = ref.childByAutoId()
        let postmainBuilding = ["name": "MainBuilding",
                           "adress": "Leninskye Gori, 1",
                           "comment": "Testy"] as [String : Any]
        mainBuilding.updateChildValues(postmainBuilding)
        
        let vmkBuilding = ref.childByAutoId()
        let postvmkBuilding = ["name": "VMKBuilding",
                                "adress": "Leninskye Gori, 2",
                                "comment": "Nice math"] as [String : Any]
        vmkBuilding.updateChildValues(postvmkBuilding)
    }
    
    func writeFloors() {
        let ref = Database.database().reference().child("Campus").child("-LY6PG5DJ_baCMsgTVMn").child("-LY6W2JrLO8_ZShdVjxb")
        
        
        let firstFloor = ref.childByAutoId()
        let postfirstFloor = ["name": "FirstFloor",
                           "comment": "A lot of people"] as [String : Any]
        firstFloor.updateChildValues(postfirstFloor)
        
        let secondFloor = ref.childByAutoId()
        let postsecondFloor = ["name": "SecondFloor",
                              "comment": "Good shop"] as [String : Any]
        secondFloor.updateChildValues(postsecondFloor)
        
        let lastFloor = ref.childByAutoId()
        let postlastFloor = ["name": "LastFloor",
                              "comment": "Wonderful place"] as [String : Any]
        lastFloor.updateChildValues(postlastFloor)
    }
    
    func writeRooms() {
        let ref: DatabaseReference! = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD")
        
        let hallway = ref.childByAutoId()
        let postHallway = ["name": "Hallway",
                           "polygon": "6.5 4.5 9.8 12.9 10.9 4.5",
                           "comment": "Snowly",
                           "type": 0] as [String : Any]
        hallway.updateChildValues(postHallway)
        
        let corridor = ref.childByAutoId()
        let postCorridor = ["name": "Corridor",
                            "polygon": "6.5 4.5 9.8 12.9 10.9 4.5",
                            "comment": "Big",
                            "type": 0] as [String : Any]
        corridor.updateChildValues(postCorridor)
        
        let lounge = ref.childByAutoId()
        let postLounge = ["name": "Lounge",
                          "polygon": "6.5 4.5 9.8 12.9 10.9 4.5",
                          "comment": "Good tables",
                          "type": 0] as [String : Any]
        lounge.updateChildValues(postLounge)
    }
    
    func writeVertex() {
        let ref = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPeJu0YtI7ZxSKWH")
        
        let vertexA = ref.childByAutoId()
        let postvertexA = ["comment": "--",
                           "coordinates": "9.0 4.7"] as [String : Any]
        vertexA.updateChildValues(postvertexA)
        
        let vertexB = ref.childByAutoId()
        let postvertexB = ["comment": "-?-",
                           "coordinates": "19.2 14.7"] as [String : Any]
        vertexB.updateChildValues(postvertexB)
        
        let ref1 = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPepByL2A-2q5sVh")
        
        let vertexA1 = ref1.childByAutoId()
        let postvertexA1 = ["comment": "|||",
                           "coordinates": "9.0 4.7"] as [String : Any]
        vertexA1.updateChildValues(postvertexA1)
        
        let vertexB1 = ref1.childByAutoId()
        let postvertexB1 = ["comment": "||",
                           "coordinates": "19.2 14.7"] as [String : Any]
        vertexB1.updateChildValues(postvertexB1)
        
        let ref12 = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPepByL2A-2q5sVi")
        
        let vertexA12 = ref12.childByAutoId()
        let postvertexA12 = ["comment": "|||",
                            "coordinates": "9.0 4.7"] as [String : Any]
        vertexA12.updateChildValues(postvertexA12)
        
        let vertexB12 = ref12.childByAutoId()
        let postvertexB12 = ["comment": "||",
                            "coordinates": "19.2 14.7"] as [String : Any]
        vertexB12.updateChildValues(postvertexB12)
    }
    
    func writeEdge() {
        let ref = Database.database().reference().child("Edge")

        let edgeFrom = ref.childByAutoId()
        let postedgeFrom = [
                            "distance": "4.3",
                            "commentEdge":"[[[",
                            "vertexfrom": "Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPeJu0YtI7ZxSKWH/-LY6ZCyhdIJZfI211hD0",
                            "vertexto": "Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPeJu0YtI7ZxSKWH/-LY6ZCykkoKchsN-neja",
                           "doorscoordinates": "9.0 4.7 10.0 4.7"] as [String : Any]
        edgeFrom.updateChildValues(postedgeFrom)
        
        let edgeTo = ref.childByAutoId()
        let postedgeTo = [
                            "distance": "4.3",
                            "commentEdge":"]]]",
                            "vertexto": "Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPeJu0YtI7ZxSKWH/-LY6ZCyhdIJZfI211hD0",
                            "vertexfrom": "Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPeJu0YtI7ZxSKWH/-LY6ZCykkoKchsN-neja",
                            "doorscoordinates": "9.0 4.7 10.0 4.7"] as [String : Any]
        edgeTo.updateChildValues(postedgeTo)
    }*/
    
    func readRoom() {
        let ref = Database.database().reference()
        
        var nameCampus = " "
        var commentCampus = " "
        var idCampus: String = " "
        var valueCampus = 0
        var campusArray = [Campus]()
        
        var distanceEdge = "0.0"
        var doorscoordinatesEdge = " "
        var vertexfromEdge = " "
        var vertextoEdge = " "
        var idEdge = " "
        var commentEdge = " "
        var valueEdge = 0
        var edgeArray = [Edge]()
        
        var adressBuilding = " "
        var commentBuilding = " "
        var nameBuilding = " "
        var idBuilding = " "
        var valueBuilding = 0
        var buildingArray = [Buildings]()
        
        var commentFloor = " "
        var nameFloor = " "
        var idFloor = " "
        var valueFloor = 0
        var floorArray = [Floors]()
        
        var commentRoom = " "
        var nameRoom = " "
        var polygonRoom = " "
        var typeRoom = 0
        var idRoom = " "
        var valueRoom = 0
        var roomArray = [Rooms]()
        
        var commentVertex : String = " "
        var coordinatesVertex : String = " "
        var idVertex : String = " "
        var valueVertex : Int = 0
        var vertexArray = [Vertex]()
 
        var coordinatesBeacon = " "
        var commentBeacon = " "
        var nameBeacon = " "
        var majorminorBeacon = " "
        var uuidBeacon = " "
        var idBeacon = " "
        var valueBeacon = 0
        var heightBeacon = "0.0"
        var beaconArray = [Beacons]()
        
        var cordinatesSession = " "
        var dt_startSession = NSDate()
        var dt_endSession = NSDate()
        var dt_modificationSession = NSDate()
        var commentSession = " "
        var idSession = " "
        var valueSession = 0
        var sessionArray = [Session]()
        
        ref.observe(.value, with: { snapshot in
            if let allData = snapshot.children.allObjects as? [DataSnapshot] {
                for data in allData {
                    if data.children.allObjects as? [DataSnapshot] == nil {
                        print("Error")
                        return
                    }
                    
                    for first in data.children.allObjects as! [DataSnapshot] {
                        if first.children.allObjects as? [DataSnapshot] == nil {
                            print("Error")
                            return
                        }
                        
                        var flagCampus = 0
                        for campusANDedge in first.children.allObjects as! [DataSnapshot] {
                            if campusANDedge.key == "name" { /* Кампус */
                                nameCampus = campusANDedge.value as? String ?? ""
                                idCampus = first.key
                                valueCampus += 1
                            }
                            if campusANDedge.key == "comment" { /* Кампус */
                                commentCampus = campusANDedge.value as? String ?? ""
                                valueCampus += 1
                            }
                            if campusANDedge.key == "distance" { /* Ребро */
                                distanceEdge = campusANDedge.value as? String ?? ""
                                idEdge = first.key
                                valueEdge += 1
                            }
                            if campusANDedge.key == "doorscoordinates" { /* Ребро */
                                doorscoordinatesEdge = campusANDedge.value as? String ?? ""
                                valueEdge += 1
                            }
                            if campusANDedge.key == "vertexfrom" { /* Ребро */
                                vertexfromEdge = campusANDedge.value as? String ?? ""
                                valueEdge += 1
                            }
                            if campusANDedge.key == "vertexto" { /* Ребро */
                                vertextoEdge = campusANDedge.value as? String ?? ""
                                valueEdge += 1
                            }
                            if campusANDedge.key == "commentEdge" { /* Ребро */
                                commentEdge = campusANDedge.value as? String ?? ""
                                valueEdge += 1
                            }
                            if valueCampus == 2 {
                                let campusA = Campus(id: idCampus, name: nameCampus, comment: commentCampus)
                                campusArray.append(campusA)
                                valueCampus = 0
                                flagCampus = 1
                            }
                            if valueEdge == 5 {
                                let EdgeA = Edge(id: idEdge, distance: distanceEdge, doorscoordinates: doorscoordinatesEdge, comment: commentEdge, vertexto: vertextoEdge, vertexfrom: vertexfromEdge)
                                edgeArray.append(EdgeA)
                                valueEdge = 0
                            }
                            
                            if campusANDedge.children.allObjects as? [DataSnapshot] == nil {
                                print("Error")
                                break
                            }
                            
                            var flagBuild = 0
                            for build in campusANDedge.children.allObjects as! [DataSnapshot] {
                                if build.key == "adress" { /* Здание */
                                    adressBuilding = build.value as? String ?? ""
                                    idBuilding = campusANDedge.key
                                    valueBuilding += 1
                                }
                                if build.key == "comment" { /* Здание */
                                    commentBuilding = build.value as? String ?? ""
                                    valueBuilding += 1
                                }
                                if build.key == "name" { /* Здание */
                                    nameBuilding = build.value as? String ?? ""
                                    valueBuilding += 1
                                }
                                if valueBuilding == 3 {
                                    let BuildinA = Buildings(id: idBuilding, name: nameBuilding, comment: commentBuilding, adress: adressBuilding)
                                    buildingArray.append(BuildinA)
                                    valueBuilding = 0
                                    flagBuild = 1
                                }
                                
                                if build.children.allObjects as? [DataSnapshot] == nil {
                                    print("Error")
                                    break
                                }
                                
                                var flagFloor = 0
                                for floor in build.children.allObjects as! [DataSnapshot] {
                                    if floor.key == "comment" { /* Этаж */
                                        commentFloor = floor.value as? String ?? ""
                                        idFloor = build.key
                                        valueFloor += 1
                                    }
                                    if floor.key == "name" { /* Этаж */
                                        nameFloor = floor.value as? String ?? ""
                                        valueFloor += 1
                                    }
                                    if valueFloor == 2 {
                                        let FloorA = Floors(id: idFloor, name: nameFloor, comment: commentFloor)
                                        floorArray.append(FloorA)
                                        valueFloor = 0
                                        flagFloor = 1
                                    }
                                    
                                    if floor.children.allObjects as? [DataSnapshot] == nil {
                                        print("Error")
                                        break
                                    }
                                    
                                    var flagRoom = 0
                                    for room in floor.children.allObjects as! [DataSnapshot] {
                                        
                                        var flagRoomNote = true
                                        if room.key == "comment" { /* Комната */
                                            commentRoom = room.value as? String ?? ""
                                            idRoom = floor.key
                                            valueRoom += 1
                                            flagRoomNote = false
                                        }
                                        if room.key == "name" { /* Комната */
                                            nameRoom = room.value as? String ?? ""
                                            valueRoom += 1
                                            flagRoomNote = false
                                        }
                                        if room.key == "polygon" { /* Комната */
                                            polygonRoom = room.value as? String ?? ""
                                            valueRoom += 1
                                            flagRoomNote = false
                                        }
                                        if room.key == "type" { /* Комната */
                                            typeRoom = room.value as? Int ?? -1
                                            valueRoom += 1
                                            flagRoomNote = false
                                        }
                                        if valueRoom == 4 {
                                            let roomA = Rooms(id: idRoom, comment: commentRoom, polygon: polygonRoom, name: nameRoom, type: typeRoom)
                                            roomArray.append(roomA)
                                            flagRoom = 3
                                            
                                            valueRoom = 0
                                        }
                                        if flagRoomNote {
                                            if room.children.allObjects as? [DataSnapshot] == nil {
                                                print("Error")
                                                break
                                            }
                                            
                                            for vertex in room.children.allObjects as! [DataSnapshot] {
                                                if vertex.key == "comment" { /* Вершина */
                                                    commentVertex = vertex.value as? String ?? ""
                                                    idVertex = room.key
                                                    valueVertex += 1
                                                }
                                                if vertex.key == "coordinates" { /* Вершина */
                                                    coordinatesVertex = vertex.value as? String ?? ""
                                                    valueVertex += 1
                                                }
                                                if vertex.key == "coordinatesbeacon" { /* Beacon */
                                                    coordinatesBeacon = vertex.value as? String ?? ""
                                                    idBeacon = room.key
                                                    valueBeacon += 1
                                                }
                                                if vertex.key == "commentbeacon" { /* Beacon */
                                                    commentBeacon = vertex.value as? String ?? ""
                                                    valueBeacon += 1
                                                }
                                                if vertex.key == "namebeacon" { /* Beacon */
                                                    nameBeacon = vertex.value as? String ?? ""
                                                    valueBeacon += 1
                                                }
                                                if vertex.key == "majorminorbeacon" { /* Beacon */
                                                    majorminorBeacon = vertex.value as? String ?? ""
                                                    valueBeacon += 1
                                                }
                                                if vertex.key == "uuidbeacon" { /* Beacon */
                                                    uuidBeacon = vertex.value as? String ?? ""
                                                    valueBeacon += 1
                                                }
                                                if vertex.key == "heightbeacon" { /* Beacon */
                                                    heightBeacon = vertex.value as? String ?? ""
                                                    valueBeacon += 1
                                                }
                                                if vertex.key == "cordinatessession" { /* Сессия */
                                                    cordinatesSession = vertex.value as? String ?? ""
                                                    idSession = room.key
                                                    valueSession += 1
                                                }
                                                if vertex.key == "dt_startsession" { /* Сессия */
                                                    dt_startSession = vertex.value as? NSDate ?? NSDate()
                                                    valueSession += 1
                                                }
                                                if vertex.key == "dt_endsession" { /* Сессия */
                                                    dt_endSession = vertex.value as? NSDate ?? NSDate()
                                                    valueSession += 1
                                                }
                                                if vertex.key == "dt_modificationsession" { /* Сессия */
                                                    dt_modificationSession = vertex.value as? NSDate ?? NSDate()
                                                    valueSession += 1
                                                }
                                                if vertex.key == "commentsession" { /* Сессия */
                                                    commentSession = vertex.value as? String ?? ""
                                                    valueSession += 1
                                                }
                                                if valueVertex == 2 {
                                                    let vertexA = Vertex(id: idVertex, coordinates: coordinatesVertex, comment: commentVertex)
                                                    vertexArray.append(vertexA)
                                                    valueVertex = 0
                                                }
                                                if valueBeacon == 6 {
                                                    let beaconA = Beacons(id: idBeacon, name: nameBeacon, coordinates: coordinatesBeacon, majorminor: majorminorBeacon, uuid: uuidBeacon, comment: commentBeacon, height: heightBeacon)
                                                    beaconArray.append(beaconA)
                                                    valueBeacon = 0
                                                }
                                                if valueSession == 5 {
                                                    let sessionA = Session(id: idSession, cordinates: cordinatesSession, dt_start: dt_startSession, dt_end: dt_endSession, dt_modification: dt_modificationSession, comment: commentSession)
                                                    sessionArray.append(sessionA)
                                                    valueSession = 0
                                                }
                                            }
                                        }
                                        
                                        if vertexArray.count > 0 && flagRoom > 0 {
                                            roomArray.last!.vertexrelationship = NSOrderedSet(array: vertexArray)
                                            flagRoom -= 1
                                            for vertexArr in vertexArray{
                                                vertexArr.roomsrelationship = roomArray.last
                                                }
                                            vertexArray = []
                                        }
                                        
                                        if beaconArray.count > 0 && flagRoom > 0 {
                                            roomArray.last!.beaconsrelationship = NSOrderedSet(array: beaconArray)
                                            flagRoom -= 1
                                            for beaconArr in beaconArray{
                                                beaconArr.roomsrelationship = roomArray.last
                                            }
                                            beaconArray = []
                                        }
                                        
                                        if sessionArray.count > 0 && flagRoom > 0 {
                                            roomArray.last!.sessioinrelationship = NSOrderedSet(array: sessionArray)
                                            flagRoom -= 1
                                            for sessionArr in sessionArray{
                                                sessionArr.roomsrelationship = roomArray.last
                                            }
                                            sessionArray = []
                                        }
                                    }
                                    
                                    if roomArray.count > 0 && flagFloor > 0 {
                                        floorArray.last!.roomsrelationship = NSOrderedSet(array: roomArray)
                                        flagFloor -= 1
                                        for roomArr in roomArray{
                                            roomArr.floorsrelationship = floorArray.last
                                        }
                                        roomArray = []
                                    }
                                }
                                
                                if floorArray.count > 0 && flagBuild > 0 {
                                    buildingArray.last!.floorsrelationship = NSOrderedSet(array: floorArray)
                                    flagBuild -= 1
                                    for floorArr in floorArray{
                                        floorArr.buildingsrelationship = buildingArray.last
                                    }
                                    floorArray = []
                                }
                            }
                            
                            if buildingArray.count > 0 && flagCampus > 0 {
                                campusArray.last!.buildingsrelationship = NSOrderedSet(array: buildingArray)
                                flagCampus -= 1
                                for buildingArr in buildingArray{
                                    buildingArr.campusrelationship = campusArray.last
                                }
                                buildingArray = []
                            }
                        }
                    }
                }
            }
        })
        
        let arrayEdgeForVertex = Edge.allitems()
        let arrayVertexForEdge = Vertex.allitems()
        
        for edgeForVertex in arrayEdgeForVertex {
            for VertexForEdge in arrayVertexForEdge {
                if VertexForEdge.id == edgeForVertex.vertexfrom {
                    edgeForVertex.vertexfromrelationship = VertexForEdge
                }
                if VertexForEdge.id == edgeForVertex.vertexto {
                    edgeForVertex.vertextorelationship = VertexForEdge
                }
            }
        }
        
        
    }
    
    func saving () {
        if context1.hasChanges {
            do {
                try context1.save()
            } catch {
                print("Error")
            }
        }
    }
}
