//
//  SecViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

// 1. 定义一个协议
protocol passValueProtocol {
    func passValue(info: String?)
}

class SecViewController: UIViewController {
    @IBOutlet var inputTf: UITextField!

    // 2. 在被代理对象中声明一个遵守协议的delegate属性
    var delegate: passValueProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func passValueBtnClick(_ sender: Any) {
        // 3. 真正传值的时候调用代理完成
        delegate?.passValue(info: inputTf.text)

        dismiss(animated: true, completion: nil)
    }
}
