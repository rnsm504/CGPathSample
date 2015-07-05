//
//  GraphicsViewArc.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/06/23.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import Foundation
import UIKit

class SampleArcView : SampleBaseView {
    
    
    @IBOutlet weak var xfield: UITextField!
    
    @IBOutlet weak var yfield: UITextField!
    
    @IBOutlet weak var rfield: UITextField!
    
    @IBOutlet weak var safield: UITextField!
    
    @IBOutlet weak var eafield: UITextField!
    
    @IBOutlet weak var dfield: UITextField!
    
    
    @IBAction func fieldChanged(sender: AnyObject){
        self.setNeedsDisplay()
    }
    
    
    override func awakeFromNib() {
        
        xfield.text = "100"
        yfield.text = "100"
        rfield.text = "100"
        safield.text = "0"
        eafield.text = "180"
        dfield.text = "180"
    }
    
    
    // over view
    override func drawRect(rect: CGRect) {
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        var x = CGFloat(NSString(string: xfield.text).doubleValue)
        var y = CGFloat(NSString(string: yfield.text).doubleValue)
        var r = CGFloat(NSString(string: rfield.text).doubleValue)
        var sa = NSString(string: safield.text).doubleValue
        var ea = NSString(string: eafield.text).doubleValue
        var d = NSString(string: dfield.text).doubleValue
        
        let path : CGMutablePathRef = CGPathCreateMutable()
        
        if(pathType == "CGPathAddArc") {
            dfield.enabled = false
            eafield.enabled = true
            CGPathAddArc(path, nil, x, y, r, toRadians(sa), toRadians(ea), false)
        } else if(pathType == "CGPathAddRelativeArc") {
            dfield.enabled = true
            eafield.enabled = false
            CGPathAddRelativeArc(path, nil, x, y, r, toRadians(sa), toRadians(d))
        }
        
        CGContextAddPath(context, path)
        CGContextSetStrokeColorWithColor(context,UIColor.blackColor().CGColor)
        CGContextDrawPath(context, kCGPathFillStroke)
        
        CGContextRestoreGState(context)
    }
    
  }
