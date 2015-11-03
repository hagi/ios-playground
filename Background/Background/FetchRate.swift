//
//  FetchRate.swift
//  Background
//
//  Created by hagi on 03/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

import Foundation

class FetchRate {
    
    let url = NSURL(string: "https://kantor.aliorbank.pl/chart/PLN,USD/json")!
    
    func call(callback: (NSError?, Double) -> Void) {
        println("FetchRate called")
        
        let session = NSURLSession.sharedSession()
        var request = NSMutableURLRequest(URL: url)
        
        var task = session.dataTaskWithRequest(request) { [unowned self] (data, response, error) -> Void in
            if error != nil {
                println("error: \(error)")
                callback(error, 0)
            
            } else {
                var result = NSString(data: data, encoding: NSASCIIStringEncoding)!
                let regex = NSRegularExpression(pattern: "actualBuyRate.:.([\\d\\.]+)", options: nil, error: nil)!
                let match = regex.firstMatchInString(result as String, options: nil, range: NSMakeRange(0, result.length))
                
                if let range = match?.rangeAtIndex(1) {
                    let value = (result.substringWithRange(range) as NSString).doubleValue
                    println("double: \(value)")
                    
                    callback(nil, value)
                }
            }
        }
        task.resume()
    }
    
    required init() {
    }
    
    static func call(callback: (NSError?, Double) -> Void) {
        self().call(callback)
    }
}