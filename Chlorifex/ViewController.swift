//
//  ViewController.swift
//  Chlorifex
//
//  Created by Scott Metoyer on 8/22/15.
//  Copyright (c) 2015 Scott Metoyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set view background color
        self.view.backgroundColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoGallery(sender: UIButton) {
        let imagePickerControl = UIImagePickerController()
        imagePickerControl.delegate = self
        presentViewController(imagePickerControl, animated: true, completion: nil)
        
    }

}

