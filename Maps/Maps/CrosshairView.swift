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
        
        println("crosshair view bounds: \(bounds.size), origin: \(bounds.origin.x), \(bounds.origin.y)")
        println("crosshair view frame: \(frame.size), origin: \(frame.origin)")
        
        let context = UIGraphicsGetCurrentContext()
        let centerX = frame.size.width / 2.0
        let centerY = frame.size.height / 2.0
        let crossOffset = CGFloat(4.0)
        let crossSize = CGFloat(12.0)
        
        
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextSetLineWidth(context, 1.0)
        CGContextAddArc(context, centerX, centerY, 8, 0.0, CGFloat(M_PI * 2), 1)

        CGContextMoveToPoint(context, centerX + crossOffset, centerY)
        CGContextAddLineToPoint(context, centerX + crossSize, centerY)

        CGContextMoveToPoint(context, centerX - crossOffset, centerY)
        CGContextAddLineToPoint(context, centerX - crossSize, centerY)

        CGContextMoveToPoint(context, centerX, centerY + crossOffset)
        CGContextAddLineToPoint(context, centerX, centerY + crossSize)

        CGContextMoveToPoint(context, centerX, centerY - crossOffset)
        CGContextAddLineToPoint(context, centerX, centerY - crossSize)
        
        CGContextDrawPath(context, kCGPathStroke)
        
        
        
    }

}
