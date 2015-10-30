//
//  SettingsViewController.swift
//  Tables
//
//  Created by hagi on 28/10/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    var didEnterValueHandler: (String -> Void)?
    
    @IBOutlet weak var valueField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueField.delegate = self
        valueField.becomeFirstResponder()
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("should return?")
        
        didEnterValueHandler?(valueField.text)
        
        dismissViewControllerAnimated(true, completion: nil)
        return true
    }
}
