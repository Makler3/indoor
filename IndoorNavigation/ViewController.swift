//
//  ViewController.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth
import Firebase

//private var allRooms: [[Rooms]] = [[Rooms(comment: nil, polygon: "0 0 3 0 3 5 0 5", name: nil, type: 1), Rooms(comment: nil, polygon: "3 0 7 0 7 10 3 5", name: nil, type: 1), Rooms(comment: nil, polygon: "7 0 11 0 11 10 7 10", name: nil, type: 1)], [Rooms(comment: nil, polygon: "2 3 5 3 5 6 2 6", name: nil, type: 1), Rooms(comment: nil, polygon: "5 3 8 3 8 9 5 9", name: nil, type: 1)]]



//var allFloors: [Floors] = [Floors(roomsrelationship: NSSet(array: allRooms[0]), name: nil, comment: nil), Floors(roomsrelationship: NSSet(array: allRooms[1]), name: nil, comment: nil)]

private var allRooms = [Rooms]()
var allFloors = [Floors]()
var allVertexes = [Vertex]()
var allEdges = [Edge]()

private var graph: Graph = Graph(edgesList: allEdges, vertexesList: allVertexes)

//private var beaconsFromMinor = [Int: (CLBeacon, Beacons)]()

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var leadingS: NSLayoutConstraint!
    @IBOutlet weak var trailingS: NSLayoutConstraint!
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    
//    @IBOutlet var ubeView: UIView!
    
    
    
    var hamburgerMenuIsVisible = false
    
    @IBAction func hamburgerBtnTapped(_ sender: Any) {
        //if the hamburger menu is NOT visible, then move the ubeView back to where it used to be
        if !hamburgerMenuIsVisible {
            leadingC.constant = 300
            //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
            trailingC.constant = -300
            leadingS.constant = 300
            //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
            trailingS.constant = -300
            
            //1
            hamburgerMenuIsVisible = true
        } else {
            //if the hamburger menu IS visible, then move the ubeView back to its original position
            leadingC.constant = 0
            trailingC.constant = 0
            leadingS.constant = 0
            trailingS.constant = 0
            
            //2
            hamburgerMenuIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }

    
    @IBOutlet weak var mapView: MapView! {
        didSet {
            let pinch = UIPinchGestureRecognizer(target: mapView, action: #selector(MapView.adjustMapScale(byHandlingGestureRecognizer:)))
            mapView.addGestureRecognizer(pinch)
            
            let pan = UIPanGestureRecognizer(target: mapView, action: #selector(MapView.adjustMapOffset(byHandlingGestureRecognizer:)))
            mapView.isUserInteractionEnabled = true
            mapView.addGestureRecognizer(pan)
            
            print("__________KEK___________")
            //mapView.needsPathBuild = true
        }
    }
    @IBAction func floorStepper(_ sender: UIStepper) {
        mapView.currentFloor = allFloors[Int(sender.value)]
        currentFloorLabel.text = "Floor: \(Int(sender.value))"
    }
    
    @IBOutlet weak var currentFloorLabel: UILabel!
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        self.mapView.mapScale *= 1
    }
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hse = WriteBase()
        //        hse.writeCampus()
        //        hse.writeBuildings()
        //        hse.writeFloors()
        //        hse.writeRooms()
        //        hse.writeVertex()
        //        hse.writeEdge()
        
        print("||||||")
        FirebaseApp.configure()
        hse.readRoom()
        DispatchQueue.global(qos: .background).async { //асинхронное выполнение
            sleep(2)
            print("Tell me a story...")
            hse.saving()
            print(11, Rooms.maximum())
            print(12, Vertex.maximum())
            print(13, Vertex.allitems().first!.comment ?? ";;")
            print(14, Vertex.allitems().first!.roomsrelationship?.name ?? "pp")
            allVertexes = Vertex.allitems()
            allEdges = Edge.allitems()
            allRooms = Rooms.allitems()
            allFloors = Floors.allitems()
        }
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        // the default direction is right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        
        /*allVertexes.append(Vertex(coordinates: "2 2.5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[0][0]
        
        allVertexes.append(Vertex(coordinates: "4 2.5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[0][1]
        
        allVertexes.append(Vertex(coordinates: "6 1.5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[0][1]
        
        allVertexes.append(Vertex(coordinates: "8 1.5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[0][2]
        
        allVertexes.append(Vertex(coordinates: "6 5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[0][1]
        
        allVertexes.append(Vertex(coordinates: "8 5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[0][2]
        
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
        
        allVertexes.append(Vertex(coordinates: "4.5 4.5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[1][0]
        
        allVertexes.append(Vertex(coordinates: "5.5 4.5", comment: nil))
        allVertexes.last!.roomsrelationship = allRooms[1][1]
        
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[6], vertextorelationship: allVertexes[7], doorscoordinates: "5 4 5 5", comment: nil))
        allEdges.append(Edge(distance: 0, vertexfromrelationship: allVertexes[7], vertextorelationship: allVertexes[6], doorscoordinates: "5 4 5 5", comment: nil))
        
        allEdges.append(Edge(distance: 0.5, vertexfromrelationship: allVertexes[0], vertextorelationship: allVertexes[6], doorscoordinates: nil, comment: nil))
        allEdges.append(Edge(distance: 0.5, vertexfromrelationship: allVertexes[6], vertextorelationship: allVertexes[0], doorscoordinates: nil, comment: nil))*/
        
        
        //mapView.pathVertexes = graph.findShortestPathRunningDijkstra(start: allRooms[0][2], finish: allRooms[1][1]).1
        //mapView.needsPathBuild = true
        
        locationManager.delegate = self
        //locationManager.requestAlwaysAuthorization()
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        //locationManager.startRangingBeaconsInRegion(region)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                //print("CLLocationManager.isMonitoringAvailable == true")
                if CLLocationManager.isRangingAvailable() {
                    //print("CLLocationManager.isRangingAvailable == true")
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "10F86430-1346-11E4-9191-0800200C9A66")! // Fine // last digit was 5 early
        //E2 C5 6D B5 DF FB 48 D2 B0 60 D0 F5 A7 10 96 E0
        
        //        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 34832, minor: 34833, identifier: "brf0") // fine
        
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "brf0")
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        //print(beacons)
        
        //var coordinates = ["2 3", "5 6"]
        var iteration = 0
        if beacons.count > 0 {
            //updateDistance(beacons[0].proximity)
            
            // major 123 minor 1
            //var allBeacons = [(Int, Beacons)]()
            for current in beacons {
                //let majorminor = String(Int(truncating: current.major)) + " " + String(Int(truncating: current.minor))
                var distance: Int
                if current.proximity == .immediate {
                    distance = 0
                }
                else if current.proximity == .near {
                    distance = 1
                }
                else if current.proximity == .far {
                    distance = 2
                }
                else {
                    distance = 3
                }
                
                //allBeacons.append((distance, Beacons(name: nil, coordinates: coordinates[iteration], majorminor: majorminor, uuid: "10F86430-1346-11E4-9191-0800200C9A66", comment: nil)))
                //allBeacons.last!.1.roomsrelationship = allRooms[1][0]
                iteration += 1
                
                //beaconsFromMinor[allBeacons.last!.parseMajorMinor().minor!] = (beacons[0], allBeacons[0])
            }
            
            //mapView.findLocation(allBeacons)
            
            //print(beacon.accuracy)
            //print(distanceFromRSSI(rssi: beacon.rssi) ?? "nil")
        }
        else {
            mapView.findLocation(Array())
            //updateDistance(.unknown)
        }
    }
    
    func updateDistance(_ distance: CLProximity) {
        UIView.animate(withDuration: 0.1, animations: {
            
            switch distance {
            case .unknown:
                self.mapView!.backgroundColor = UIColor.darkGray
            case .far:
                self.mapView!.backgroundColor = UIColor.red
            case .near:
                self.mapView!.backgroundColor = UIColor.orange
            case .immediate:
                self.mapView!.backgroundColor = UIColor.green
            }
        })
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                if !hamburgerMenuIsVisible {
                    leadingC.constant = 300
                    //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
                    trailingC.constant = -300
                    leadingS.constant = 300
                    //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
                    trailingS.constant = -300
                    //1
                    hamburgerMenuIsVisible = true
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    }) { (animationComplete) in
                        print("The animation is complete!")
                    }
                }
            case .left:
                if hamburgerMenuIsVisible {
                    leadingC.constant = 0
                    trailingC.constant = 0
                    leadingS.constant = 0
                    trailingS.constant = 0
                    //2
                    hamburgerMenuIsVisible = false
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    }) { (animationComplete) in
                        print("The animation is complete!")
                    }
                }
            default:
                break
                
            }
        }
    }
}

