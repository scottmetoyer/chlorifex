//
//  ImageControl.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/28/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class ImageView: UIView {
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var location = CGPoint(x: 70, y: 20)
    var lastLocation:CGPoint = CGPointMake(20, 20)
    var imageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(image anImage: UIImage) {
        super.init(frame: CGRectMake(0, 0, 0, 0))
        super.layer.borderWidth = 1
        super.layer.borderColor = UIColor.whiteColor().CGColor
        
        let scale = getImageScale(anImage.size.width)
        let width = anImage.size.width * scale
        let height = anImage.size.height * scale
        
        super.frame = CGRectMake(location.x, location.y, width + 100, height)
        
        
        imageView = UIImageView(image: anImage)
        imageView.frame = CGRectMake(0, 0, width, height)
        imageView.contentMode = .ScaleAspectFit
        addSubview(imageView)
        
        let opacityLabel = UILabel(frame: CGRectMake(width + 10, 0, 90, 10))
        opacityLabel.text = "Opacity"
        opacityLabel.textColor = UIColor.whiteColor()
        opacityLabel.font = UIFont.systemFontOfSize(14.0)
        addSubview(opacityLabel)
        
        let opacitySlider = UISlider(frame: CGRectMake(width + 10, 20, 90, 10))
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
        let velocity = recognizer.velocityInView(self.superview!)
        
        if (recognizer.state == UIGestureRecognizerState.Began) {
        } else if (recognizer.state == UIGestureRecognizerState.Changed) {
            // Track the movement
            self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        } else if (recognizer.state == UIGestureRecognizerState.Ended) {
            self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
            

            // Animate to final position
            let finalPosition = CGPointMake(self.center.x + (velocity.x / 10), self.center.y + (velocity.y / 10))
            
            UIView.animateWithDuration(
                0.2,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.center = finalPosition
                },
                completion: nil
            )
            print(velocity)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }
    
    func getImageScale(imageWidth: CGFloat) -> CGFloat {
        let screenWidth = screenSize.width
        
        // Target is 1/2 the screen width
        return (screenWidth * 0.5) / imageWidth
    }
}
