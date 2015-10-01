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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
