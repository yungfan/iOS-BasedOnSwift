//
//  ViewController.swift
//  VFL
//
//  Created by 杨帆 on 2019/1/11.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var redView = UIView()
    lazy var blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.redView.backgroundColor = UIColor.red
        self.blueView.backgroundColor = UIColor.blue
        
        //必须关闭Autoresizing
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        
        //设置水平方向约束
        let h = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[redView]-10-[blueView(==redView)]-10-|", options: .directionMask, metrics: nil, views: ["redView":self.redView, "blueView": self.blueView])
        
        //设置垂直方向约束
        let v1 = NSLayoutConstraint.constraints(withVisualFormat: "V:[redView(50)]-50-|", options: .directionMask, metrics: nil, views: ["redView":self.redView])
        
        let v2 = NSLayoutConstraint.constraints(withVisualFormat: "V:[blueView(==redView)]-50-|", options: .directionMask, metrics: nil, views: ["redView":self.redView, "blueView": self.blueView])
        
        //往他们的superView添加约束
        self.view.addConstraints(h)
        self.view.addConstraints(v1)
        self.view.addConstraints(v2)
    }


}

