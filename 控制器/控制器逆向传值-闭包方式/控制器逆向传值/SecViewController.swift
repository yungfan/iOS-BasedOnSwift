//
//  SecViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

// 1. 定义一个闭包类型
typealias Disclosure = (String?) -> Void

class SecViewController: UIViewController {
    @IBOutlet var inputTf: UITextField!

    // 2. 声明一个闭包类型的属性
    var discloure: Disclosure?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func passValueBtnClick(_ sender: Any) {
        // 3. 真正传值的时候调用闭包完成
        discloure?(inputTf.text)

        dismiss(animated: true, completion: nil)
    }
}
