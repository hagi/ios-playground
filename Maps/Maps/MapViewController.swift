//
//  MapViewController.swift
//  Maps
//
//  Created by hagi on 30/09/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var chosenHandler: (CLLocationCoordinate2D -> Void)?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func handleLocationChosen(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .Ended {
            let point = sender.locationInView(mapView)
            let coordinates = mapView.convertPoint(point, toCoordinateFromView: mapView)
            chosenHandler?(coordinates)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
