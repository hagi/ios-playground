//
//  NamePickViewController.swift
//  PassingData
//
//  Created by hagi on 23/09/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit

protocol NamePickDelegate {
    func didPickName(name: String)
}

class NamePickViewController: UIViewController {

    var delegate: NamePickDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func handleSave(sender: UIButton) {
        let name = nameField.text
        println("name choosen: \(name)")

        delegate?.didPickName(name)
        dismissViewControllerAnimated(true, completion: nil)
    }

}
