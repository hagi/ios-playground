//
//  FieldViewController.swift
//  TextInputs
//
//  Created by hagi on 14/10/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

/*
    Todo:
    + centered text field which resizes font to fit entered text
    + limit size of text
    - block adding more text to prevent scroll allowing downsizing font only

    Issues:

    Hints:
    - you cannnot change height for rounded borders:
    http://stackoverflow.com/questions/8641557/how-set-uitextfield-height
*/

import UIKit

class FieldViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        textField.delegate = self
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        println("should change... text: \(textField.text), range: \(range), replacement: \(string)")
        let newText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        return count(newText) > 10 ? false : true
    }
    
}
