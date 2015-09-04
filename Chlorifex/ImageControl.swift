//
//  ImageControl.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/28/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class ImageControl: UIView {
    var location = CGPoint(x: 20, y: 20)
    var imageView = UIImageView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(image anImage: UIImage) {
        let rect = CGRectMake(location.x, location.y, anImage.size.width / 4, anImage.size.height / 4)
        super.init(frame: rect)
        
        imageView = UIImageView(image: anImage)
        imageView.frame = rect
        imageView.contentMode = .ScaleAspectFit
        self.center = location;
        addSubview(imageView)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch : UITouch! = touches.first as! UITouch
        location = touch.locationInView(self.superview)
        self.center = location
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch : UITouch! = touches.first as! UITouch
        location = touch.locationInView(self.superview)
        self.center = location
    }
}
