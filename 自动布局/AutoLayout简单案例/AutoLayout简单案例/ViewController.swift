//
//  ViewController.swift
//  AutoLayout简单案例
//
//  Created by stu1 on 2019/1/10.
//  Copyright © 2019年 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redView: UIView!

    @IBOutlet var bottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 设置frame有效果
        // self.redView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        UIView.animate(withDuration: 2.0) {
            // 修改frame可以产生动画
            // self.redView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

            // 直接修改约束 不产生动画
            self.bottom.constant = 200.0
            // 必须调用下面的方法才可以
            self.view.layoutIfNeeded()
        }
    }
}
