//
//  ImageControl.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/28/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class ImageControl: UIView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(image anImage: UIImage) {
        let rect = CGRectMake(60, 60, anImage.size.width / 4, anImage.size.height / 4)
        super.init(frame: rect)
        
        let imageView = UIImageView(image: anImage)
        imageView.frame = rect
        imageView.contentMode = .ScaleAspectFit
        addSubview(imageView)
        
    }
    
}
