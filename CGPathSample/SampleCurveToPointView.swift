//
//  SampleCurveToPointView.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/07/03.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import Foundation
import UIKit

class SampleCurveToPointView : SampleBaseView {
    
   
    
    @IBOutlet weak var x0field: UITextField!
    
    @IBOutlet weak var y0field: UITextField!
    
    @IBOutlet weak var cp1xfield: UITextField!
    
    @IBOutlet weak var cp1yfield: UITextField!
    
    @IBOutlet weak var cp2xfield: UITextField!
    
    @IBOutlet weak var cp2yfield: UITextField!
    
    @IBOutlet weak var xfield: UITextField!
    
    @IBOutlet weak var yfield: UITextField!
    
    
    @IBAction func fieldChanged(sender: AnyObject) {
        self.setNeedsDisplay()
    }
    
    
    override func awakeFromNib() {
        
        x0field.text = "0"
        y0field.text = "0"
        cp1xfield.text = "200"
        cp1yfield.text = "100"
        cp2xfield.text = "100"
        cp2yfield.text = "200"
        xfield.text = "200"
        yfield.text = "300"
    }
    
    
    override func drawRect(rect: CGRect) {
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        
        let path : CGMutablePathRef = CGPathCreateMutable()
        
        var x0  = CGFloat(NSString(string: x0field.text).doubleValue)
        var y0 = CGFloat(NSString(string: y0field.text).doubleValue)
        var cp1x = CGFloat(NSString(string: cp1xfield.text).doubleValue)
        var cp1y = CGFloat(NSString(string: cp1yfield.text).doubleValue)
        var cp2x = CGFloat(NSString(string: cp2xfield.text).doubleValue)
        var cp2y = CGFloat(NSString(string: cp2yfield.text).doubleValue)
        var x = CGFloat(NSString(string: xfield.text).doubleValue)
        var y = CGFloat(NSString(string: yfield.text).doubleValue)
        
        if(pathType == "CGPathAddCurveToPoint") {
            CGPathMoveToPoint(path, nil, x0, y0)
            CGPathAddCurveToPoint(path, nil, cp1x, cp1y, cp2x, cp2y, x, y)
        } else if(pathType == "CGPathAddQuadCurveToPoint") {
            cp2xfield.enabled = false
            cp2yfield.enabled = false
            CGPathMoveToPoint(path, nil, x0, y0)
            CGPathAddQuadCurveToPoint(path, nil, cp1x, cp1y, x, y)
        }
        
        CGContextAddPath(context, path)
        CGContextSetStrokeColorWithColor(context,UIColor.blackColor().CGColor)
        CGContextDrawPath(context, kCGPathFillStroke)
        
        CGContextRestoreGState(context)

    }
    
}