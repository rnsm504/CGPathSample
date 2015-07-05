//
//  DetailViewController.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/06/10.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import UIKit
import CoreGraphics

class DetailViewController: UIViewController {

    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail: AnyObject = self.detailItem {
            
            switch detail.description {
            case "CGPathAddArc", "CGPathAddRelativeArc" :
                let myView = self.view as! SampleArcView
                myView.pathType = detail.description
            case "CGPathAddArcToPoint" :
                let myView = self.view as! SampleArcPointView
                myView.pathType = detail.description
            case "CGPathAddCurveToPoint", "CGPathAddQuadCurveToPoint" :
                let myView = self.view as! SampleCurveToPointView
                myView.pathType = detail.description
            default:
                let myView = self.view as! SampleRectView
                myView.pathType = detail.description
            }

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = self.detailItem!.description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

