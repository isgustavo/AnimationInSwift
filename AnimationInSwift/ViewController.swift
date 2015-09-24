//
//  ViewController.swift
//  AnimationInSwift
//
//  Created by gustavo.freitas2 on 9/22/15.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfFishSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...15 {
            
            let size: CGFloat = CGFloat(arc4random_uniform(40))+20
            let yPosition: CGFloat = CGFloat( arc4random_uniform(200))+20
            
            let randomYOffset = CGFloat(arc4random_uniform(150))
            let color = CGFloat(arc4random_uniform(3))
            
            
            let fish = UIImageView()
            
            switch(color){
            case 0:
                fish.image = UIImage(named: "blue-fish.png")
            case 1:
                fish.image = UIImage(named: "red-fish.png")
            default:
                fish.image = UIImage(named: "orange-fish.png")
            }
            
            
            fish.frame = CGRectMake(0-size, yPosition, size, size)
            self.view.addSubview(fish)
            
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16, y: 239 + randomYOffset))
            path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset),
                controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset),
                controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
            
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = Double(arc4random_uniform(40)+30) / 10
            anim.timeOffset = Double(arc4random_uniform(290))
            
            fish.layer.addAnimation(anim, forKey: "animate position along path")
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

