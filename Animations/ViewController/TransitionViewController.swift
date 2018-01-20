//
//  TransitionViewController.swift
//  Animations
//
//  Created by Admin on 1/18/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {

    @IBOutlet weak var transitionsButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let transition = PopTransitions()
    let animations = ["Fade","Empty"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the button round
        transitionsButton.layer.cornerRadius = 20
        
        // Replace the default segments with the animations.
        segmentControl.removeAllSegments()
        for i in 0..<animations.count {
            segmentControl.insertSegment(withTitle: animations[i], at: i, animated: true)
        }
    }
    
    @IBAction func transitionsButtonTap(_ sender: Any) {
        let transitionedVC = storyboard?.instantiateViewController(withIdentifier: "Transitioned")
        transitionedVC?.transitioningDelegate = self
        present(transitionedVC!, animated: true, completion: nil)
    }
    
}

extension TransitionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // Check for which animation
        switch segmentControl.selectedSegmentIndex {
        case 0:
            return transition
        default:
            return nil
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}


