//
//  ImageControl.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/28/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class ImageView: UIView {
    var location = CGPoint(x: 70, y: 20)
    var lastLocation:CGPoint = CGPointMake(20, 20)
    var imageView = UIImageView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(image anImage: UIImage) {
        var rect = CGRectMake(location.x, location.y, anImage.size.width / 4, anImage.size.height / 4)
        super.init(frame: CGRectMake(location.x, location.y, (anImage.size.width / 4) + 60, anImage.size.height / 4))
        
        super.layer.borderWidth = 1
        super.layer.borderColor = UIColor.whiteColor().CGColor
        
        imageView = UIImageView(image: anImage)
        imageView.frame = rect
        imageView.contentMode = .ScaleAspectFit
        addSubview(imageView)
        
        rect = CGRectMake(0, 0, 50, 20)
        var opacitySlider = UISlider(frame: rect);
        opacitySlider.minimumValue = 0
        opacitySlider.maximumValue = 100
        opacitySlider.tintColor = UIColor.redColor()
        opacitySlider.continuous = true
        opacitySlider.backgroundColor = UIColor.clearColor()
        addSubview(opacitySlider)
        
        // Initialize gesture recognizers
        let panRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePan:"))
        self.gestureRecognizers = [panRecognizer]
    }
    
    // MARK: Gesture recognizers
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.superview!)
       self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }
}
