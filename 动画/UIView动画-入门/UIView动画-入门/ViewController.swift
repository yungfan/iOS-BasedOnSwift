//
//  ViewController.swift
//  UIView动画-入门
//
//  Created by 杨帆 on 2018/12/28.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var pinWheel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //介绍方法 - 三类
        //frame、bounds、center、backgroundColor、alpha、transform
        
        
        
        
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /**
        //最简单的方法
        UIView.animate(withDuration: 2.0) {
            
            self.redView.frame = CGRect(x: 100, y: 500, width: 55, height: 200)
            
            self.redView.center = self.view.center
            
            self.redView.backgroundColor = UIColor.blue
            
            self.redView.alpha = 0.5
            
            
            self.redView.transform = CGAffineTransform.init(translationX: 100, y: 100)
           
            self.redView.transform = CGAffineTransform.init(scaleX: 0.5, y: 1.5)
            
            self.pinWheel.transform = CGAffineTransform.init(rotationAngle: CGFloat(Float.pi))
           
        } */
        
        /**
        //带completion
        UIView.animate(withDuration: 3.0, animations: {

            self.pinWheel.transform = CGAffineTransform.init(rotationAngle: CGFloat(Float.pi))

        }) { (isFinished) in

            self.pinWheel.isHidden = true
        } */
        
        /**
        //带延迟与动画选项
        UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseInOut, animations: {
            
            self.redView.frame = CGRect(x: 100, y: 500, width: 55, height: 200)
            
        }, completion: nil)
        */
        
        //弹簧动画
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            
            self.redView.center = self.view.center
            
        }, completion: nil)

    }
}


