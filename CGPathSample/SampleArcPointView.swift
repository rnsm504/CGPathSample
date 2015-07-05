//
//  SampleArcPointView.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/06/29.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import Foundation
import UIKit

class SampleArcPointView : SampleBaseView {

       
    @IBOutlet weak var rafield: UITextField!
    
    
    @IBAction func fieldChanged(sender: AnyObject){
        self.setNeedsDisplay()
    }
    
     override func awakeFromNib() {
    
        rafield.text = "90"
    }
    
    override func drawRect(rect: CGRect) {
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        if(pathType == "CGPathAddArcToPoint") {
            addArcToPoint(context)
        }
    }

    func addArcToPoint(context : CGContextRef){
        
        var ra = NSString(string: rafield.text).doubleValue
        
        let path : CGMutablePathRef = CGPathCreateMutable()
        
        var scale : CGAffineTransform = CGAffineTransformMakeScale(5.0, 5.0)
        
        CGPathMoveToPoint(path, &scale, CGFloat(0), CGFloat(50))
        CGPathAddArcToPoint(path, &scale, CGFloat(50), CGFloat(50), CGFloat(50), CGFloat(100), CGFloat(toRadians(ra)))
        CGPathAddLineToPoint(path, &scale, CGFloat(50), CGFloat(100))
        //CGPathCloseSubpath(path)
        
        CGContextAddPath(context, path)
        CGContextSetStrokeColorWithColor(context,UIColor.blackColor().CGColor)
        CGContextDrawPath(context, kCGPathFillStroke)
        
        CGContextRestoreGState(context)
    }
}
