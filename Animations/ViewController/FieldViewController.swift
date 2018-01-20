//
//  FirstViewController.swift
//  Animations
//
//  Created by Admin on 1/17/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class FieldViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var Text_1: UITextView!
    @IBOutlet weak var Text_2: UITextView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    let animations = ["Grow","Fade","Move"]
    
    // Save for the animation.
    var size  = CGSize()
    var firstFieldCenter = CGPoint()
    var secondFieldCenter = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the animation when a different segment is selected.
        segmentControl.addTarget(self, action: #selector(self.changeAnimation), for: .valueChanged)
        
        // Replace the default segments with the animations.
        segmentControl.removeAllSegments()
        for i in 0..<animations.count {
            segmentControl.insertSegment(withTitle: animations[i], at: i, animated: true)
        }
        
        // Save the size and center for the animation.
        size  = Text_1.frame.size
        firstFieldCenter = Text_1.center
        secondFieldCenter = Text_2.center
        
        // Make them round.
        Text_1.layer.cornerRadius = 20
        Text_2.layer.cornerRadius = 20
        
        
    }
    
    
    
    
    @objc func changeAnimation() {
        // Change the animations according to the selected segment.
        switch segmentControl.selectedSegmentIndex {
        case 0: // Grow
            growTextField()
        case 1: // Fade
            fadeTextField()
        case 2: // Move
            moveTextField()
        default:
            print("Still not supported yet!")
        }
    }
    
    @objc func growTextField() {
        // Reset them to 0
        Text_1.frame.size.width = 0.0
        Text_1.frame.size.height = 0.0
        
        Text_2.frame.size.width = 0.0
        Text_2.frame.size.height = 0.0
        
        // Animate to the original size.
        UIView.animate(withDuration: 1, animations: {
            self.Text_1.frame.size = self.size
            
        })
        
        UIView.animate(withDuration: 1, animations: {
            self.Text_2.frame.size = self.size
            
        })
    }
    
    
    
    @objc func fadeTextField(){
        
        // Make them invisible.
        Text_1.alpha = 0
        Text_2.alpha = 0

        // Animate them to complete visiblity.
        UIView.animate(withDuration: 1.5, animations: {
            self.Text_1.alpha = 1
            
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.Text_2.alpha = 1
            
        })
    }
    
    @objc func moveTextField(){
        
        // Move them away from the screen.
        Text_1.center.x = -500
        Text_2.center.y = 800

        // Animate them bach to place.
        UIView.animate(withDuration: 1, animations: {
            self.Text_1.center = self.firstFieldCenter
            
        })
        
        UIView.animate(withDuration: 1, animations: {
            self.Text_2.center = self.secondFieldCenter
            
        })
    }
    
    
}

