//
//  ViewController.swift
//  indoor navigation a
//
//  Created by Исмагил Сайфутдинов on 01/02/2019.
//  Copyright © 2019 Исмагил Сайфутдинов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mapView: MapView! {
        didSet {
            let pinch = UIPinchGestureRecognizer(target: mapView, action: #selector(MapView.adjustMapScale(byHandlingGestureRecognizer:)))
            mapView.addGestureRecognizer(pinch)
            
            let pan = UIPanGestureRecognizer(target: mapView, action: #selector(MapView.adjustMapOffset(byHandlingGestureRecognizer:)))
            mapView.isUserInteractionEnabled = true
            mapView.addGestureRecognizer(pan)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

