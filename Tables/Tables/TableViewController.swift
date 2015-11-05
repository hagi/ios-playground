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
    + dynamic backgorund color change
    + rearanging table cells
    + removing table cells
    - swipe gesture on cell

    issues:
    + how to disable swipe to delete (deleting should work on edit mode)?
        => use ...editingStyleForRowAtIndexPath method
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
//        cell.backgroundView?.backgroundColor = UIColor(rgb: 0x0000ee)
//        cell.selectedBackgroundView?.backgroundColor = UIColor(rgb: 0x00ff00)
        cell.textLabel?.textColor = UIColor(rgb: 0xffffff)
        cell.textLabel?.backgroundColor = UIColor(rgb: 0x2e8ece)
        cell.contentView.backgroundColor = UIColor(rgb: 0x2e8ece)
        
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
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        println("source idx: \(sourceIndexPath.row)")
        println("dest idx: \(destinationIndexPath.row)")
        
        let from = sourceIndexPath.row
        let to = destinationIndexPath.row
        let element = data.removeAtIndex(from)
        data.insert(element, atIndex: to)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    @IBAction func handleEdit(sender: UIButton) {
        tableView.setEditing(!tableView.editing, animated: true)
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        if editingStyle == UITableViewCellEditingStyle.Delete {
            data.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {

        return tableView.editing ? .Delete : .None
    }
    
}


extension UIColor {
    convenience init(rgb: UInt32) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
