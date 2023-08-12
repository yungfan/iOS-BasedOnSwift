//
//  SecViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    @IBOutlet var inputTf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func passValueBtnClick(_ sender: Any) {
        // object：消息发送者
        NotificationCenter.default.post(name: NSNotification.Name("abc"), object: nil, userInfo: ["info": inputTf.text!])

        dismiss(animated: true, completion: nil)
    }
}
