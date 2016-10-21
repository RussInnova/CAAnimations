//
//  ViewController.swift
//  CAAnimations
//
//  Created by Keith Russell on 7/23/16.
//  Copyright © 2016 Keith Russell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: YellowView!
    @IBOutlet weak var redViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberOfItems: UISlider!
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
@IBAction func replay (sender: AnyObject) {
    
    let numberOfFish = Int(self.numberOfItems.value) - 1
    
        for _ in 0...numberOfFish {
            
            // code in here will be performed in each loop
            // `loopNumber` will keep track of which loop we're currently in
            //TODO - need to slow down animation as more fish added or it loops to quickly making fish swim too quickly
            
            let blueOptions: UIViewAnimationOptions = [.repeat,.curveLinear]
            // randomly assign a delay of 0.9 to 7s
            let delay = TimeInterval(900 + arc4random_uniform(6000)) / 1000
            // randomly assign a duration of 3 to 6s
            let duration = TimeInterval(3000 + arc4random_uniform(3000)) / 1000
            // set size to be a random number between 10.0 and 40.0
            let size : CGFloat = CGFloat( arc4random_uniform(30))+10
            // set yPosition to be a random number between 40.0 and height of screen
            let ySpan = UInt32(view.bounds.height)
            let yPosition : CGFloat = CGFloat( arc4random_uniform(ySpan-80)) + 40
            
            let fish = UIImageView()
       
            fish.backgroundColor = UIColor.clear
            
            fish.image = UIImage(named: "f1.png") //set up animated sprite of fish swimming
            
            for x in 1...12 {
                
                let img = UIImage(named: "f\(x).png")
              
                imageArray.append(img!)
            }
            
            fish.animationImages = imageArray
            fish.animationDuration = 2
            fish.animationRepeatCount = 0
            fish.startAnimating()
            
            let PI = CGFloat(M_PI)
            
            // Fish images need to be reversed so they swim forwards left to right
            fish.transform = CGAffineTransform(rotationAngle: -PI)
            fish.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            fish.frame = CGRect(x: 0 - 3 * size, y: yPosition, width: 3 * size, height: size)
            
            self.view.addSubview(fish)
            
            UIView.animate(withDuration: duration, delay: delay, options: blueOptions, animations: {
                
                fish.backgroundColor = UIColor.brown
                
                fish.frame = CGRect(x: self.view.frame.width + size, y: yPosition, width: 3 * size, height: size)
                }, completion: {
                    
                    animationFinished in
                    
                    // when complete, remove the square from the parent view
                    fish.removeFromSuperview()
            })
        }

    //Create view in IB - RED - Red circles
        
        let newredConstraint = NSLayoutConstraint(item: self.redView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: self.view.frame.width)
        
        let options = UIViewAnimationOptions.repeat
        
        UIView.animate(withDuration: 8.0, delay: 0.0, options: options, animations: {
            
            self.redView.backgroundColor = UIColor.orange
            self.redView.layer.cornerRadius = 5
            
            self.view.removeConstraint(self.redViewLeadingConstraint)
            self.view.addConstraint(newredConstraint)
            self.view.layoutIfNeeded()
            
            }, completion: {
        
                animationFinished in
                
                // when complete, remove the square from the parent view
                self.redView.removeFromSuperview()
        })
        
        redViewLeadingConstraint = newredConstraint
        
    //Create view in IB as custom view class - YELLOW - yellow circle delayed start
    
         let newyellowConstraint = NSLayoutConstraint(item: self.yellowView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: self.view.frame.width)
        
        UIView.animate(withDuration: 6.0, delay: 2.0, options: options, animations: {
                        
            self.view.removeConstraint(self.yellowViewLeadingConstraint)
            self.view.addConstraint(newyellowConstraint)
            self.view.layoutIfNeeded()
            }, completion: {
                
                animationFinished in
                
                // when complete, remove the square from the parent view
                self.yellowView.removeFromSuperview()
        })
        
        yellowViewLeadingConstraint = newyellowConstraint

    }

}

