//
//  ViewController.swift
//  TextInputs
//
//  Created by hagi on 06/10/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

/*
    Todo:
    - resizable view depending on keyboard visibility
    
    Issues:
    - default text jumps if keyboard visible on start (becomeFirstResponder)
    - lines above default text are not centered on simulator
*/

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("view did load, text? \(textView.text)")
        // centerVertically(textView)
        textView.becomeFirstResponder()
        textView.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear, text? \(textView.text)")
        // centerVertically(textView)
    }
    
    override func viewDidAppear(animated: Bool) {
        println("view did appear, text? \(textView.text)")
         centerVertically(textView)
        super.viewDidAppear(animated)
        // textView.becomeFirstResponder() // when uncommented 'placeholder' jumps from top :(
    }
    
    
    func textViewDidBeginEditing(textView: UITextView) {
        println("textViewDidBeginEditing, text? \(textView.text)")
        centerVertically(textView)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        println("textViewDidEndEditing, text? \(textView.text)")
        centerVertically(textView)
    }
    
    func textViewDidChange(textView: UITextView) {
        centerVertically(textView)
    }

    // http://stackoverflow.com/questions/12591192/center-text-vertically-in-a-uitextview
    func centerVertically(textView: UITextView) {
        println("text view frame: \(textView.frame.size)")
        
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

