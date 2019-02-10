//
//  WorldMapViewController.swift
//  HamburgerMenuBlog
//
//  Created by EventUser on 08/02/2019.
//  Copyright © 2019 Erica Millado. All rights reserved.
//

import UIKit
import MapKit


class WorldMapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var SearchBarField: UISearchBar!
    

    @IBOutlet weak var ButtonCurrentLocation: UIButton!
    enum MyError: Error {
        case runtimeError(String)
    }
    
    func ThrowLocation() throws -> Void {
        let userlocation = mapView.userLocation
        if userlocation.location == nil {
            throw MyError.runtimeError("No location");
        }
        let region = MKCoordinateRegion(center: (userlocation.location?.coordinate)!, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func CurrentLocation(_ sender: Any) {
        do {
            try ThrowLocation()
        } catch {
            print("No Location")
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        

        self.view.addSubview(activityIndicator)
        //Create the search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                self.mapView.setRegion(region, animated: true)
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        mapView.showsUserLocation = true;
        mapView.delegate = self
        
        do {
            try ThrowLocation()
        } catch {
            print("No Location")
        }
    
        
        SearchBarField.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
