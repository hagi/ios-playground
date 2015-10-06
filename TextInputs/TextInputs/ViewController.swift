//
//  ViewController.swift
//  TextInputs
//
//  Created by hagi on 06/10/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        centerVertically(textView)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        centerVertically(textView)
        println("got: \(textView.text)")
    }
    
    func textViewDidChange(textView: UITextView) {
        centerVertically(textView)
    }

    // http://stackoverflow.com/questions/12591192/center-text-vertically-in-a-uitextview
    func centerVertically(textView: UITextView) {
        println("bounds: \(textView.bounds.size)")
        println("zoom: \(textView.zoomScale)")
        let size = textView.sizeThatFits(textView.bounds.size)
        println("fit size: \(size)")
        var topOffset = (textView.bounds.size.height - size.height * textView.zoomScale) / 2.0
        topOffset = topOffset < 0.0 ? 0.0 : topOffset
        println("top offset: \(topOffset)")
        textView.contentOffset = CGPointMake(0, -topOffset)
    }
    
    
    
    


}

