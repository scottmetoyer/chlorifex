//
//  ImageControl.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/28/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class ImageView: UIView {
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
        addSubview(imageView)
        
        // Initialize gesture recognizers
        let panRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePan:"))
    }
    
    // MARK: Gesture recognizers
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self)
    }
}
