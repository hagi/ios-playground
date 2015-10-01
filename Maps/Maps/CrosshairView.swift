//
//  CrosshairView.swift
//  Maps
//
//  Created by hagi on 01/10/15.
//  Copyright (c) 2015 lazylabs. All rights reserved.
//

import UIKit

class CrosshairView: UIView {

    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineWidth(context, 3.0)
        CGContextAddArc(context, frame.size.width/2, frame.size.height/2, 20, 0.0, CGFloat(M_PI * 2), 1)
        CGContextDrawPath(context, kCGPathStroke)
    }

}
