//
//  ViewController.swift
//  Background
//
//  Created by hagi on 02/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

/*
    todo: 
    + fetch data in fg
    + put to background
    + local notification
    - notification treshold

    issues: 
    + q: why the rateLabel is updated few+ seconds after fetching data?
        a: not in main queue, setting in main queue helps
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rateLabel: UILabel!
    
    var rate: Double? {
        didSet {
            println("did set \(rate)")
            rateLabel.text = rate == nil ? "?" : "\(rate!)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRate()
    }

    func fetchRate() {
        println("fetch rate...")
        let session = NSURLSession.sharedSession()
        var request = NSMutableURLRequest(URL: NSURL(string: "https://kantor.aliorbank.pl/chart/PLN,USD/json")!)
        
        var task = session.dataTaskWithRequest(request) { [unowned self] (data, response, error) -> Void in
            if error != nil {
                println("error \(error)")
                
            } else {
                var result = NSString(data: data, encoding: NSASCIIStringEncoding)!
                // println("result: \(result)")
                let regex = NSRegularExpression(pattern: "actualBuyRate.:.([\\d\\.]+)", options: nil, error: nil)!
                let match = regex.firstMatchInString(result as String, options: nil, range: NSMakeRange(0, result.length))
                
                if let range = match?.rangeAtIndex(1) {
                    let value = (result.substringWithRange(range) as NSString).doubleValue
                    println("double: \(value)")

                    dispatch_async(dispatch_get_main_queue()) {
                        self.rate = value
                    }
                }
            }
        }
        
        task.resume()
    }
}

