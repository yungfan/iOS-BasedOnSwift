//
//  ViewController.swift
//  UIView转场动画案例
//
//  Created by 杨帆 on 2018/12/29.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    
    var orangeView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        orangeView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        orangeView.backgroundColor = UIColor.orange
        
        orangeView.center = self.view.center
        
        let btn = UIButton(type: .contactAdd)
        
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        orangeView.addSubview(btn)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.transition(with: self.view, duration: 2.0, options: .transitionCurlUp, animations: {
            
            
            self.redView.isHidden = true
            
            self.view.addSubview(self.orangeView)
            
            
        }, completion: nil)
        
    }
    
    @objc func btnClick(){
        
        
        UIView.transition(with: self.view, duration: 2.0, options: .transitionCurlDown, animations: {
            
            
            self.redView.isHidden = false
            
            self.orangeView.removeFromSuperview()
        
            
        }, completion: nil)
        
    }
    
}

