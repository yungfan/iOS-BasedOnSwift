//
//  ViewController.swift
//  UIView动画-登录界面
//
//  Created by 杨帆 on 2018/12/28.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pinwheel: UIImageView!

    @IBOutlet var username: UITextField!

    @IBOutlet var password: UITextField!

    @IBOutlet var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        rotatePinWheel()

        loginAnimate()
    }

    func rotatePinWheel() {
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {
            self.pinwheel.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi)).concatenating(self.pinwheel.transform)
        }) { _ in

            self.rotatePinWheel()
        }
    }

    func loginAnimate() {
        UIView.animate(withDuration: 2.0, animations: {
            self.username.center = CGPoint(x: self.view.center.x, y: self.username.center.y)

        }) { _ in

            UIView.animate(withDuration: 2.0, animations: {
                self.password.center = CGPoint(x: self.view.center.x, y: self.password.center.y)

            }, completion: { _ in

                UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    self.loginBtn.center = CGPoint(x: self.view.center.x, y: 390)

                }, completion: nil)

            })
        }
    }
}
