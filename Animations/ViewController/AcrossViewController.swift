//
//  SecondViewController.swift
//  Animations
//
//  Created by Admin on 1/17/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class AcrossViewController: UIViewController  {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    var timer = Timer()
    let animations = ["Ball","Empty"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the animations when a different segment is selected.
        segmentControl.addTarget(self, action: #selector(self.changeAnimation), for: .valueChanged)
        
        // Replace the default segments with the animations.
        segmentControl.removeAllSegments()
        for i in 0..<animations.count {
            segmentControl.insertSegment(withTitle: animations[i], at: i, animated: true)
        }
    }

    
    @objc func changeAnimation() {
        
        // Stop any running timers
        timer.invalidate()
        
        // To remove all the circles remaining in the view.
        let remainingCircles = view.subviews
        for each in remainingCircles {
            if (each.tag == 1){
                each.removeFromSuperview()
            }
        }
        
        
        switch segmentControl.selectedSegmentIndex {
        case 0: // Ball
            // Start the timer for the circle animation
             timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.circleAnimation), userInfo: nil, repeats: true)
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
        circleContainer.layer.cornerRadius = 10 // To make it a circle.
        circleContainer.tag = 1

        // Center it in the view.
        circleContainer.center.x = view.center.x - view.frame.size.width + 5
        circleContainer.center.y = view.center.y
        
        
        
        // Generate a random color.
        circleContainer.backgroundColor = UIColor(red:CGFloat(drand48()) , green:CGFloat(drand48()) , blue: CGFloat(drand48()), alpha: 1)
        
        // Add to the top level view.
        view.addSubview(circleContainer)
        view.layoutIfNeeded()
        
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn, animations:{
            // Move to the max horizontal distance (x).
            circleContainer.center = CGPoint(x: self.view.bounds.maxX , y: self.view.center.y)
        }, completion: { _ in
                // After completion remove it from the view.
                circleContainer.removeFromSuperview()
        })
        
        
    }


}

