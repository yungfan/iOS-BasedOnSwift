//
//  ViewController.swift
//  SwiftIntro
//
//  Created by 杨帆 on 2018/10/12.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit


//视图 UIView、视图控制器UIViewController
//每一个UIViewController中都有一个UIView，这个UIView与屏幕一样大
//UIViewController负责对UIView进行生命周期的管理；负责处理用户的交互
class ViewController: UIViewController {
    
    var btn:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.backgroundColor = UIColor.red
        
        
        btn = UIButton(type: .contactAdd)
        
//        btn.frame = CGRect(x: 100, y: 200, width: 20, height: 20)
//
//        print(btn.bounds)
        
        btn?.center = self.view.center
        
        view.addSubview(btn!)
        
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        btn!.removeFromSuperview()
        
        let s = view.viewWithTag(101)
        
        s?.removeFromSuperview()
        
    }

}

