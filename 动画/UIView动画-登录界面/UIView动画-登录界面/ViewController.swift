//
//  ViewController.swift
//  UIView动画-登录界面
//
//  Created by 杨帆 on 2018/12/28.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinwheel: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.rotatePinWheel()
        
        self.loginAnimate()
    }
    
    func rotatePinWheel(){
        
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {
             self.pinwheel.transform = CGAffineTransform.init(rotationAngle: CGFloat(Float.pi)).concatenating(self.pinwheel.transform)
        }) { (isFinished) in
            
            
            self.rotatePinWheel()
        }

    }
    
   
    func loginAnimate(){
        
        UIView.animate(withDuration: 2.0, animations: {
            
            self.username.center = CGPoint(x: self.view.center.x, y: self.username.center.y)
            
        }) { (isFinished) in
            
            
            UIView.animate(withDuration: 2.0, animations: {
                
                 self.password.center = CGPoint(x: self.view.center.x, y: self.password.center.y)
                
            }, completion: { (isFinished) in
                
                
                UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveLinear, animations: {
                    
                    self.loginBtn.center = CGPoint(x: self.view.center.x, y: 390)
                    
                }, completion: nil)
                
                
            })
            
        }
        
        
        
    }

}

