//
//  ViewController.swift
//  PassingData
//
//  Created by hagi on 23/09/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NamePickDelegate, PickDateDelegate {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as? NamePickViewController)?.delegate = self
        (segue.destinationViewController as? PickDateViewController)?.delegate = self
    }
    
    // delegates
    
    func didPickName(name: String) {
        nameLabel.text = name
    }
    
    func didPickDate(date: NSDate?) {
        if date == nil {
            return
        }
        
        let date = date!
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        dateLabel.text = formatter.stringFromDate(date)
    }
}

