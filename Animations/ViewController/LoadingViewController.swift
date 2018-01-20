//
//  LoadingViewController.swift
//  Animations
//
//  Created by Admin on 1/18/18.
//  Copyright © 2018 ahmednader. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let shapeLayer = CAShapeLayer()
    let animations = ["Circle",""]
    
    
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
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            circleAnimation()
        default:
            print("Not yet supported")
        }
    }
    
    
    func circleAnimation(){
        let center = view.center
        
        // Path
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.black.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.blue.cgColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.strokeEnd = 0
        view.layer.addSublayer(trackLayer)
        
        
        //Animated
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1.0
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "Circle")
    }

}
