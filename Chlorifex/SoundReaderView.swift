//
//  SoundReaderControl.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/28/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class SoundReaderView: UIView {
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var location = CGPoint(x: 70, y: 20)
    var lastLocation:CGPoint = CGPointMake(20, 20)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required init() {
        super.init(frame: CGRectMake(0, 0, 0, 0))
        super.layer.borderWidth = 1
        super.layer.borderColor = UIColor.whiteColor().CGColor
        
        let width : CGFloat = 100.0
        let height : CGFloat = 100.0
        
        super.frame = CGRectMake(location.x, location.y, width + 100, height)
        
        let levelLabel = UILabel(frame: CGRectMake(width + 10, 0, 90, 10))
        levelLabel.text = "Level"
        levelLabel.textColor = UIColor.whiteColor()
        levelLabel.font = UIFont.systemFontOfSize(14.0)
        addSubview(levelLabel)
        
        let levelSlider = UISlider(frame: CGRectMake(width + 10, 20, 90, 10))
        levelSlider.minimumValue = 0
        levelSlider.maximumValue = 100
        levelSlider.tintColor = UIColor.redColor()
        levelSlider.continuous = true
        levelSlider.backgroundColor = UIColor.clearColor()
        addSubview(levelSlider)
        
        // Initialize gesture recognizers
        let panRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePan:"))
        self.gestureRecognizers = [panRecognizer]
    }
    
    // MARK: Gesture recognizers
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }
    
}
