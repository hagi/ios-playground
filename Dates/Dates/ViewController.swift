//
//  ViewController.swift
//  Dates
//
//  Created by hagi on 16/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        return formatter
    }()
    
    var date: NSDate? {
        didSet {
            dateLabel.text = date == nil ? "??" : dateFormatter.stringFromDate(date!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date = NSDate()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTenMinutes(sender: UIButton) {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.minute = 10
        date = calendar.dateByAddingComponents(components, toDate: date!, options: NSCalendarOptions.MatchNextTime)
    }
    
    @IBAction func addOneWeek(sender: UIButton) {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.day = 7
        date = calendar.dateByAddingComponents(components, toDate: date!, options: NSCalendarOptions.MatchNextTime)
    }
    
    @IBAction func minusThreeDays(sender: UIButton) {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.day = -3
        date = calendar.dateByAddingComponents(components, toDate: date!, options: NSCalendarOptions.MatchNextTime)
    }
    
}

