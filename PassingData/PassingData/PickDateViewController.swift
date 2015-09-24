//
//  PickDateViewController.swift
//  PassingData
//
//  Created by hagi on 24/09/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit

protocol PickDateDelegate {
    func didPickDate(date: NSDate?)
}

class PickDateViewController: UIViewController {

    var delegate: PickDateDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func handleSave(sender: UIButton) {
        let date = datePicker.date
        delegate?.didPickDate(date)
        dismissViewControllerAnimated(true, completion: nil)
    }
}
