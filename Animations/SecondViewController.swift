//
//  SecondViewController.swift
//  Animations
//
//  Created by Admin on 1/17/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController  {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    var timer = Timer()
    let animations = ["Ball","Empty"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.addTarget(self, action: #selector(self.changeAnimation), for: .valueChanged)
        
        
        // Add the animations to the segment control.
        segmentControl.removeAllSegments()
        for i in 0..<animations.count {
            segmentControl.insertSegment(withTitle: animations[i], at: i, animated: true)
        }
        segmentControl.selectedSegmentIndex = 0

        
        
    }

    
    @objc func changeAnimation() {
        
        timer.invalidate()
        let remainingCircles = view.subviews
        for each in remainingCircles {
            if (each.tag == 1){
                each.removeFromSuperview()
            }
        }
        
        let animationChoosen = animations[segmentControl.selectedSegmentIndex]
        switch animationChoosen {
        case "Ball":
            // Start the timer for the circle animation
             timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.circleAnimation), userInfo: nil, repeats: true)
            timer.fire()
        default:
            print("Still not supported yet!")
        }
        
        
    }
    
    
    @objc func circleAnimation()
    {
        // Initialize the circle.
        let circleContainer = UIView()
        circleContainer.frame.size = CGSize(width: 20.0, height: 20.0)
        circleContainer.tag = 1
        
        
        // Center it in the view.
        circleContainer.center.x = view.center.x - view.frame.size.width + 5
        circleContainer.center.y = view.center.y
        
        // To make it a circle
        circleContainer.layer.cornerRadius = 10
        
        // Generate a random color.
        circleContainer.backgroundColor = UIColor(red:CGFloat(drand48()) , green:CGFloat(drand48()) , blue: CGFloat(drand48()), alpha: 1)
        
        // Add to the top level view.
        view.addSubview(circleContainer)
        view.layoutIfNeeded()
        
        // Animate then remove it on finish
        UIView.animate(withDuration: 5, delay: 0, options: .curveEaseIn, animations:{
            circleContainer.center = CGPoint(x: self.view.bounds.maxX , y: self.view.center.y)
        }, completion: { (fin) in
            if (fin) {
                circleContainer.removeFromSuperview()
            }
        })
        
        
    }


}

