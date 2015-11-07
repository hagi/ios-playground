//
//  ViewController.swift
//  Data
//
//  Created by hagi on 07/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

/*
    todo:
    + initial based on: https://www.youtube.com/watch?v=3IDfgATVqHw
*/

import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bttnSave(sender: UIButton) {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context = appDelegate.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as? NSManagedObject
        
        if let user = newUser {
            user.setValue(txtUsername.text, forKey: "username")
            user.setValue(txtPassword.text, forKey: "password")
        
        }

        context.save(nil)
        println(newUser)
        println("Object saved")
        
    }
    
    @IBAction func bttnLoad(sender: UIButton) {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context = appDelegate.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text)
        
        var results = context.executeFetchRequest(request, error: nil) ?? []
        if results.count > 0 {
            let user = results.first as? NSManagedObject
            txtUsername.text = user?.valueForKey("username") as? String
            txtPassword.text = user?.valueForKey("password") as? String
            
        } else {
            println("0 results returned... potential error")
        }
        
    }
    
    
}

