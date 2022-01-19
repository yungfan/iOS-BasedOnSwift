//
//  SecViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

// 1. 导入Combine
import Combine
import UIKit

class SecViewController: UIViewController {
    @IBOutlet var inputTf: UITextField!

    // 2. 声明一个PassthroughSubject属性
    var publisher: PassthroughSubject<String, Never>?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func passValueBtnClick(_ sender: Any) {
        // 3. 真正传值的时候调用代理完成
        publisher?.send(inputTf.text ?? "")

        dismiss(animated: true) {
            self.publisher?.send(completion: .finished)
        }
    }
}
