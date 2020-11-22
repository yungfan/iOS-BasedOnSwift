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

        redView.backgroundColor = UIColor.red
        blueView.backgroundColor = UIColor.blue

        // 必须关闭Autoresizing
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(redView)
        view.addSubview(blueView)

        // 设置水平方向约束
        let h = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[redView]-10-[blueView(==redView)]-10-|", options: .directionMask, metrics: nil, views: ["redView": redView, "blueView": blueView])

        // 设置垂直方向约束
        let v1 = NSLayoutConstraint.constraints(withVisualFormat: "V:[redView(50)]-50-|", options: .directionMask, metrics: nil, views: ["redView": redView])

        let v2 = NSLayoutConstraint.constraints(withVisualFormat: "V:[blueView(==redView)]-50-|", options: .directionMask, metrics: nil, views: ["redView": redView, "blueView": blueView])

        // 往他们的superView添加约束
        view.addConstraints(h)
        view.addConstraints(v1)
        view.addConstraints(v2)
    }
}
