//
//  GraphicsView.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/06/11.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import Foundation
import UIKit

class SampleRectView : SampleBaseView {
    
    // text field
    @IBOutlet weak var rectTextField: UITextField!
    
    @IBAction func fieldChanged(sender: AnyObject){
        self.setNeedsDisplay()
    }
    
    
    // over view
    override func drawRect(rect: CGRect) {
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        
        var rect = rect
        var text = NSString(string: rectTextField.text)
        if(text != ""){
            let size = CGFloat(text.doubleValue)
            rect = CGRectMake(0, 0, size, size)
        }
        
        if(pathType == "CGPathCreateWithEllipseInRect"){
            CGPathCreateWithEllipseInRect(rect, nil)
        } else if(pathType == "CGPathCreateWithRect") {
            CGPathCreateWithRect(rect, nil)
        } else if(pathType == "CGPathCreateWithRoundedRect") {
            CGPathCreateWithRoundedRect(rect, 10, 10, nil)
        }
        
        let path : CGPathRef = CGPathCreateWithRect(rect, nil)
        CGContextAddPath(context, path)
        CGContextSetStrokeColorWithColor(context,UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 2.0);
        CGContextDrawPath(context, kCGPathFillStroke)
        
        CGContextRestoreGState(context)
        
    }
}
