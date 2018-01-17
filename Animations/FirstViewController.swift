//
//  FirstViewController.swift
//  Animations
//
//  Created by Admin on 1/17/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var Text_1: UITextView!
    @IBOutlet weak var Text_2: UITextView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    let animations = ["Grow","Fade","Move"]
    
    var size  = CGSize()
    var firstFieldCenter = CGPoint()
    var secondFieldCenter = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        segmentControl.addTarget(self, action: #selector(self.changeAnimation), for: .valueChanged)
        
        
        segmentControl.removeAllSegments()
        
        for i in 0..<animations.count {
            segmentControl.insertSegment(withTitle: animations[i], at: i, animated: true)
        }
        segmentControl.selectedSegmentIndex = 0
        
        size  = Text_1.frame.size
        firstFieldCenter = Text_1.center
        secondFieldCenter = Text_2.center
        
        
        //            // Animate the button
        //            let currentButtonCenter = compressBtn.center
        //            compressBtn.center.x = 500
        //            compressBtn.alpha = 0.1
        //
        //            UIView.animate(withDuration: 2, animations: {
        //                self.compressBtn.center = currentButtonCenter
        //
        //            })
        //
        //
        //            UIView.animate(withDuration: 4, animations: {
        //                self.compressBtn.alpha = 1
        //
        //            })
        //
        //            // Make the corners round because it's ugly.
        //            compressBtn.layer.cornerRadius = 20
        Text_1.layer.cornerRadius = 20
        Text_2.layer.cornerRadius = 20
        
        
    }
    
    
    
    
    @objc func changeAnimation() {
        
        let animationChoosen = animations[segmentControl.selectedSegmentIndex]
        switch animationChoosen {
        case "Grow":
            growTextField()
        case "Fade":
            fadeTextField()
        case "Move":
            moveTextField()
        default:
            print("Still not supported yet!")
        }
    }
    
    @objc func growTextField() {
        // Animate the fields.
        
        Text_1.frame.size.width = 0.0
        Text_1.frame.size.height = 0.0
        
        UIView.animate(withDuration: 1, animations: {
            self.Text_1.frame.size = self.size
            
        })
        
        Text_2.frame.size.width = 0.0
        Text_2.frame.size.height = 0.0
        
        UIView.animate(withDuration: 1, animations: {
            self.Text_2.frame.size = self.size
            
        })
    }
    
    
    
    @objc func fadeTextField(){
        Text_1.alpha = 0
        UIView.animate(withDuration: 1.5, animations: {
            self.Text_1.alpha = 1
            
        })
        
        Text_2.alpha = 0
        UIView.animate(withDuration: 1.5, animations: {
            self.Text_2.alpha = 1
            
        })
    }
    
    @objc func moveTextField(){
        Text_1.center.x = -500
        UIView.animate(withDuration: 1, animations: {
            self.Text_1.center = self.firstFieldCenter
            
        })
        
        Text_2.center.y = 800
        UIView.animate(withDuration: 1, animations: {
            self.Text_2.center = self.secondFieldCenter
            
        })
    }
    
    
}

