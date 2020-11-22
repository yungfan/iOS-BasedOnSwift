//
//  ViewController.swift
//  关键帧动画
//
//  Created by 杨帆 on 2018/12/28.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var leaf: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animateKeyframes(withDuration: 6.0, delay: 0, options: .calculationModeCubic, animations: {
            // （88，203）-> （320, 860）

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 108, y: 260)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 138, y: 340)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 168, y: 420)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 200, y: 490)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 248, y: 570)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 278, y: 630)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 308, y: 690)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 318, y: 770)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1, animations: {
                self.leaf.center = CGPoint(x: 328, y: 860)

            })

            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1, animations: {
                self.leaf.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi * 0.25))

            })

        }, completion: nil)
    }
}
