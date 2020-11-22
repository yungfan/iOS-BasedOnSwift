//
//  ViewController.swift
//  触摸
//
//  Created by 杨帆 on 2019/1/19.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 打印触摸的坐标
        print((touches.first?.location(in: view))!)

        // 打印触摸的次数
        print((touches.first?.tapCount)!)
    }
}
