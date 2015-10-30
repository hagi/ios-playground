//
//  TableViewController.swift
//  Tables
//
//  Created by hagi on 27/10/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//


/*
    todo:
    + dynamic height of rows depending on the data size
    - dynamic backgorund change

*/
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var data = ["Monday", "Tuesday", "Wednesday"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count(data)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let desc = data[indexPath.row]
        cell.textLabel?.text = data[indexPath.row]

        return cell
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        println("bounds: \(UIScreen.mainScreen().bounds)")
        println("app frame: \(UIScreen.mainScreen().applicationFrame)")
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        var rowHeight = Double(screenHeight) / Double(data.count)
        rowHeight = rowHeight < 100 ? 100 : rowHeight
        
        return CGFloat(rowHeight)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as? SettingsViewController)?.didEnterValueHandler = {
            self.addValueToData($0)
        }
    }
    
    func addValueToData(value: String) {
        data.append(value)
        tableView.reloadData()
    }
}
