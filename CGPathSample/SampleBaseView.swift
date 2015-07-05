//
//  GraphicsView.swift
//  CGPathSample
//
//  Created by Kuze Masanori on 2015/06/11.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import Foundation
import UIKit


class SampleBaseView : UIView  {
    
    // property
    var pathType : NSString = ""
    
    // 角度計算
    func toRadians(degress : Double) -> CGFloat {
        return CGFloat((degress * M_PI)/180.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
}
