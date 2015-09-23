//
//  ViewController.swift
//  PassingData
//
//  Created by hagi on 23/09/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NamePickDelegate {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
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
    }
    
    func didPickName(name: String) {
        nameLabel.text = name
    }
}

