//
//  CrosshairViewController.swift
//  Maps
//
//  Created by hagi on 01/10/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit
import MapKit

class CrosshairViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var crosshairView: UIView!
    
    var chosenHandler: (CLLocationCoordinate2D -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        println("map view:\(mapView.bounds.origin.x) / \(mapView.bounds.origin.y) / \(mapView.bounds.size)")
//        println("view in controller:\(view.bounds.origin.x) / \(view.bounds.origin.y) / \(view.bounds.size)")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        println("map view:\(mapView.bounds.origin.x) / \(mapView.bounds.origin.y) / \(mapView.bounds.size)")
        println("view in controller:\(view.bounds.origin.x) / \(view.bounds.origin.y) / \(view.bounds.size)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func handlePick(sender: UILongPressGestureRecognizer) {

        if sender.state == .Ended {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    @IBAction func handlePickButton(sender: UIButton) {
        let coordinates = mapView.centerCoordinate
        chosenHandler?(coordinates)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
//        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
