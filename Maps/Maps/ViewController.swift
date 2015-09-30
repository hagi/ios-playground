//
//  ViewController.swift
//  Maps
//
//  Created by hagi on 30/09/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    var location: CLLocationCoordinate2D? {
        didSet {
            if let loc = location {
                latitude.text = "\(loc.latitude)"
                longitude.text = "\(loc.longitude)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as? MapViewController)?.chosenHandler = { [weak self] in self?.location = $0 }
    }

}

