//
//  PopTransition.swift
//  Animations
//
//  Created by Admin on 1/18/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class PopTransitions: NSObject , UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    let presenting = true
    let originFrame = CGRect.zero
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        
        toView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            toView.alpha = 1
        }, completion: {_ in
            transitionContext.completeTransition(true)
            
        })
        
    }
    
}
