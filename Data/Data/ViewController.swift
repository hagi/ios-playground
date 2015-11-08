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
    + custom User object
    - initializer with properties from https://realm.io/news/jesse-squires-core-data-swift/ (29min)
    + UsersStore & CoreDataStackManager 

    issues: 
    - @objc(User) formula required on model to prevent exceptions, not sure what does it mean
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
        let user = usersStore.createUser(username: txtUsername.text, password: txtPassword.text)
        println("user created: \(user)")
        dataStack.saveContext()
    }
    
    @IBAction func bttnLoad(sender: UIButton) {
        let result = usersStore.fetchUsers(txtUsername.text)
        if result.success {
            let user = result.objects.first
            txtUsername.text = user?.username
            txtPassword.text = user?.password
            
        } else {
            println("Error found: \(result.error)")
        }
    }
    
    
}

