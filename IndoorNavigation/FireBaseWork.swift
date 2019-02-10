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

//var birthdayList = [String]()
class WriteBase{
    
    func writeCampus() {
        let ref: DatabaseReference! = Database.database().reference()
        
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
        let ref: DatabaseReference! = Database.database().reference().child("Campus").child("-LY6PG5DJ_baCMsgTVMn")
        
//        let roomRef = ref.child("Moscow SU")
//        @NSManaged public var adress: String?
//        @NSManaged public var comment: String?
//        @NSManaged public var id: Int64
//        @NSManaged public var name: String?
//        @NSManaged public var campusrelationship: Campus?
//        @NSManaged public var floorsrelationship: NSSet?

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
        let ref: DatabaseReference! = Database.database().reference().child("Campus").child("-LY6PG5DJ_baCMsgTVMn").child("-LY6W2JrLO8_ZShdVjxb")
        
        
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
        let ref: DatabaseReference! = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPeJu0YtI7ZxSKWH")
        
        let vertexA = ref.childByAutoId()
        let postvertexA = ["comment": "--",
                           "coordinates": "9.0 4.7"] as [String : Any]
        vertexA.updateChildValues(postvertexA)
        
        let vertexB = ref.childByAutoId()
        let postvertexB = ["comment": "-?-",
                           "coordinates": "19.2 14.7"] as [String : Any]
        vertexB.updateChildValues(postvertexB)
        
        let ref1: DatabaseReference! = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPepByL2A-2q5sVh")
        
        let vertexA1 = ref1.childByAutoId()
        let postvertexA1 = ["comment": "|||",
                           "coordinates": "9.0 4.7"] as [String : Any]
        vertexA1.updateChildValues(postvertexA1)
        
        let vertexB1 = ref1.childByAutoId()
        let postvertexB1 = ["comment": "||",
                           "coordinates": "19.2 14.7"] as [String : Any]
        vertexB1.updateChildValues(postvertexB1)
        
        let ref12: DatabaseReference! = Database.database().reference().child("Campus/-LY6PG5DJ_baCMsgTVMn/-LY6W2JrLO8_ZShdVjxb/-LY6Wh5TkS3G8xY7xqaD/-LY6YPepByL2A-2q5sVi")
        
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
        let ref: DatabaseReference! = Database.database().reference().child("Edge")
//        @NSManaged public var id: Int64
//        @NSManaged public var distance: Double
//        @NSManaged public var doorscoordinates: String?
//        @NSManaged public var comment: String?
//        @NSManaged public var vertexfromrelationship: Vertex?
//        @NSManaged public var vertextorelationship: Vertex?
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
        
    }
    func readRoom() {
        let ref = Database.database().reference()
        
        var nameCampus : String = " "
        var commentCampus : String = " "
        var idCampus : String = " "
        var valueCampus : Int = 0
        var campusArray = [Campus]()
        
        var distanceEdge : String = "0.0"
        var doorscoordinatesEdge : String = " "
        var vertexfromEdge : String = " "
        var vertextoEdge : String = " "
        var idEdge : String = " "
        var commentEdge : String = " "
        var valueEdge : Int = 0
        var edgeArray = [Edge]()
        
        var adressBuilding : String = " "
        var commentBuilding : String = " "
        var nameBuilding : String = " "
        var idBuilding : String = " "
        var valueBuilding : Int = 0
        var buildingArray = [Buildings]()
        
        var commentFloor : String = " "
        var nameFloor : String = " "
        var idFloor : String = " "
        var valueFloor : Int = 0
        var floorArray = [Floors]()
        
        var commentRoom : String = " "
        var nameRoom : String = " "
        var polygonRoom : String = " "
        var typeRoom : Int = 0
        var idRoom : String = " "
        var valueRoom : Int = 0
        var roomArray = [Rooms]()
        
        var commentVertex : String = " "
        var coordinatesVertex : String = " "
        var idVertex : String = " "
        var valueVertex : Int = 0
        var vertexArray = [Vertex]()
 
        var coordinatesBeacon : String = " "
        var commentBeacon : String = " "
        var nameBeacon : String = " "
        var majorminorBeacon : String = " "
        var uuidBeacon : String = " "
        var idBeacon : String = " "
        var valueBeacon : Int = 0
        var heightBeacon : String = "0.0"
        var beaconArray = [Beacons]()
        
        var cordinatesSession : String = " "
        var dt_startSession = NSDate()
        var dt_endSession = NSDate()
        var dt_modificationSession = NSDate()
        var commentSession : String = " "
        var idSession : String = " "
        var valueSession : Int = 0
        var sessionArray = [Session]()
        
        ref.observe(.value, with: { (snapshot) in
            if let allData = snapshot.children.allObjects as? [DataSnapshot] {
                    for data in allData {
                        for first in (data.children.allObjects as? [DataSnapshot])!{
                            
                            var flagCampus = 0
                            //var flagEdge = 0
                            for campusANDedge in (first.children.allObjects as? [DataSnapshot])!{
                                if campusANDedge.key == "name"{ /* Кампус */
                                    nameCampus = campusANDedge.value as! String
                                    idCampus = first.key
                                    valueCampus += 1
                                }
                                if campusANDedge.key == "comment"{ /* Кампус */
                                    commentCampus = campusANDedge.value as! String
                                    valueCampus += 1
                                }
                                if campusANDedge.key == "distance"{ /* Ребро */
                                    distanceEdge = campusANDedge.value as! String
                                    idEdge = first.key
                                    valueEdge += 1
                                }
                                if campusANDedge.key == "doorscoordinates"{ /* Ребро */
                                    doorscoordinatesEdge = campusANDedge.value as! String
                                    valueEdge += 1
                                }
                                if campusANDedge.key == "vertexfrom"{ /* Ребро */
                                    vertexfromEdge = campusANDedge.value as! String
                                    valueEdge += 1
                                }
                                if campusANDedge.key == "vertexto"{ /* Ребро */
                                    vertextoEdge = campusANDedge.value as! String
                                    valueEdge += 1
                                }
                                if campusANDedge.key == "commentEdge"{ /* Ребро */
                                    commentEdge = campusANDedge.value as! String
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
                                    //flagEdge = 1
                                }
                                var flagBuild = 0
                                for build in (campusANDedge.children.allObjects as? [DataSnapshot])! {
                                    if build.key == "adress"{ /* Здание */
                                        adressBuilding = build.value as! String
                                        idBuilding = campusANDedge.key
                                        valueBuilding += 1
                                    }
                                    if build.key == "comment"{ /* Здание */
                                        commentBuilding = build.value as! String
                                        valueBuilding += 1
                                    }
                                    if build.key == "name"{ /* Здание */
                                        nameBuilding = build.value as! String
                                        valueBuilding += 1
                                    }
                                    if valueBuilding == 3 {
                                        let BuildinA = Buildings(id: idBuilding, name: nameBuilding, comment: commentBuilding, adress: adressBuilding)
                                        buildingArray.append(BuildinA)
                                        valueBuilding = 0
                                        flagBuild = 1
                                    }
                                    var flagFloor = 0
                                    for floor in (build.children.allObjects as? [DataSnapshot])!{
                                        if floor.key == "comment" { /* Этаж */
                                            commentFloor = floor.value as! String
                                            idFloor = build.key
                                            valueFloor += 1
                                        }
                                        if floor.key == "name" { /* Этаж */
                                            nameFloor = floor.value as! String
                                            valueFloor += 1
                                        }
                                        if valueFloor == 2 {
                                            let FloorA = Floors(id: idFloor, name: nameFloor, comment: commentFloor)
                                            floorArray.append(FloorA)
                                            valueFloor = 0
                                            flagFloor = 1
                                        }
                                        
                                        
                                        var flagRoom = 0
                                        for room in (floor.children.allObjects as? [DataSnapshot])!{
                                            
                                            var flagRoomNote = true
                                            if room.key == "comment" { /* Комната */
                                                commentRoom = room.value as! String
                                                idRoom = floor.key
                                                valueRoom += 1
                                                flagRoomNote = false
                                            }
                                            if room.key == "name" { /* Комната */
                                                nameRoom = room.value as! String
                                                valueRoom += 1
                                                flagRoomNote = false
                                            }
                                            if room.key == "polygon" { /* Комната */
                                                polygonRoom = room.value as! String
                                                valueRoom += 1
                                                flagRoomNote = false
                                            }
                                            if room.key == "type" { /* Комната */
                                                typeRoom = room.value as! Int
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
                                                
                                                for vertex in (room.children.allObjects as? [DataSnapshot])!{
                                                
                                                    if vertex.key == "comment" { /* Вершина */
                                                        commentVertex = vertex.value as! String
                                                        idVertex = room.key
                                                        valueVertex += 1
                                                    }
                                                    if vertex.key == "coordinates" { /* Вершина */
                                                        coordinatesVertex = vertex.value as! String
                                                        valueVertex += 1
                                                    }
                                                    if vertex.key == "coordinatesbeacon" { /* Beacon */
                                                        coordinatesBeacon = vertex.value as! String
                                                        idBeacon = room.key
                                                        valueBeacon += 1
                                                    }
                                                    if vertex.key == "commentbeacon" { /* Beacon */
                                                        commentBeacon = vertex.value as! String
                                                        valueBeacon += 1
                                                    }
                                                    if vertex.key == "namebeacon" { /* Beacon */
                                                        nameBeacon = vertex.value as! String
                                                        valueBeacon += 1
                                                    }
                                                    if vertex.key == "majorminorbeacon" { /* Beacon */
                                                        majorminorBeacon = vertex.value as! String
                                                        valueBeacon += 1
                                                    }
                                                    if vertex.key == "uuidbeacon" { /* Beacon */
                                                        uuidBeacon = vertex.value as! String
                                                        valueBeacon += 1
                                                    }
                                                    if vertex.key == "heightbeacon" { /* Beacon */
                                                        heightBeacon = vertex.value as! String
                                                        valueBeacon += 1
                                                    }
                                                    if vertex.key == "cordinatessession" { /* Сессия */
                                                        cordinatesSession = vertex.value as! String
                                                        idSession = room.key
                                                        valueSession += 1
                                                    }
                                                    if vertex.key == "dt_startsession" { /* Сессия */
                                                        dt_startSession = vertex.value as! NSDate
                                                        valueSession += 1
                                                    }
                                                    if vertex.key == "dt_endsession" { /* Сессия */
                                                        dt_endSession = vertex.value as! NSDate
                                                        valueSession += 1
                                                    }
                                                    if vertex.key == "dt_modificationsession" { /* Сессия */
                                                        dt_modificationSession = vertex.value as! NSDate
                                                        valueSession += 1
                                                    }
                                                    if vertex.key == "commentsession" { /* Сессия */
                                                        commentSession = vertex.value as! String
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
                                            
//                                            print(388, Floors.maximum())
                                        }
                                        if roomArray.count > 0 && flagFloor > 0 {
                                            floorArray.last!.roomsrelationship = NSOrderedSet(array: roomArray)
                                            flagFloor -= 1
                                            for roomArr in roomArray{
                                                roomArr.floorsrelationship = floorArray.last
                                            }
                                            roomArray = []
                                            
                                        }
//                                        print(390, Floors.maximum())
                                    }
                                    if floorArray.count > 0 && flagBuild > 0 {
                                        buildingArray.last!.floorsrelationship = NSOrderedSet(array: floorArray)
                                        flagBuild -= 1
                                        for floorArr in floorArray{
                                            floorArr.buildingsrelationship = buildingArray.last
                                        }
                                        floorArray = []
                                        
                                    }
//                                    print(392, Floors.maximum())
                                }
                                if buildingArray.count > 0 && flagCampus > 0 {
                                    campusArray.last!.buildingsrelationship = NSOrderedSet(array: buildingArray)
                                    flagCampus -= 1
                                    for buildingArr in buildingArray{
                                        buildingArr.campusrelationship = campusArray.last
                                    }
                                    buildingArray = []
                                    
                                }
//                                print(394, Floors.maximum())
                            }
//                            print(396, Floors.maximum())
                        }
//                        print(398, Floors.maximum())
                    }
//                    print(400, Floors.maximum())
                }
//                print(402, Floors.maximum())
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
        print(404, Floors.maximum())
        print(405, Rooms.maximum())
        print(206, Campus.maximum())
        if context1.hasChanges {
            do {
                try context1.save()
            } catch {
                print("Error")
            }
        }
        print(5656565, Floors.maximum())
        print(3443, Rooms.maximum())
    }




//                            print(33, build)
//                        ref.child("Campus").observe(.value, with: { (snapshot) in
//                            if let cam = snapshot.children.allObjects as [AnyObject]? {
//                                for build in cam{
////                            self.cities.append(city.value.valueForKey("cityTitle") as! String);
//                            }
//                        } else {
//                            print(2, cam)

//             else {
//                    print(3, snapshot.children.allObjects as [AnyObject]? as Any)
//            }
//            self.value = snapshot.value
//            self.pickerViewCity.reloadAllComponents()
//            self.pickerViewStation.reloadAllComponents()
//            }, withCancelBlock: { error in
//            print(error.description)
//            })
            
//            for i in userDict {
////                print(i)
//                print("------------------------------------")
//                iu += 1
//                print(i.key)
//                print("kkkkkkk")
//                if i.key == "name" {
//                    print("name",i.value as? String ?? "")
//                    name1 = i.value as? String ?? ""
//                } else {
//                    if i.key == "comment" {
//                        print("comment",i.value as? String ?? "")
//                        comment1 = i.value as? String ?? ""
//                    } else {
//                        print("id",i.key)
//                        id1 = i.key
//                    }
//                }
//                if iu % 3 == 0 {
//                print("Add")
////                _ = Campus(id: id1, name: name1, comment: comment1)
//                print("-----------///////-------------")
//                }
//            }
//
            
//        })
//        ref.child("Vertex").observe(.childAdded, with: { (snapshot) in
//            //            print(snapshot.value)
//            let userDict = (snapshot.value as? [String:AnyObject])!
//            for i in userDict {
//                print(i.key)
//                print(i.value)
//                print("------------------------------------")
//            }
//
//
//        })




}
