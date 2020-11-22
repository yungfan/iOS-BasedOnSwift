//
//  ViewController.swift
//  控制器View的加载问题
//
//  Created by 杨帆 on 2018/11/14.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 该方法的优先级极高 有了它 其他加载view的方式都失效
//    override func loadView() {
//
//        //不要调用其父类方法
//
//        print("loadView")
//        // 必须在这里给控制器的view赋值
//        self.view = UIView(frame: UIScreen.main.bounds)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        print("viewDidLoad")

        // 有了loadView之后 只要调用self.view就会去调用loadView
        view.backgroundColor = UIColor.orange
    }
}
