//
//  SecViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

// 1.定义一个协议
protocol passValueProtocol {
    // 传的是什么参数 就在函数的参数设置成什么
    func passValue(info: String?)
}

class SecViewController: UIViewController {
    // 2. 在被代理对象中声明一个属性delegate 遵循协议

    var delegate: passValueProtocol?

    @IBOutlet var inputTf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func passValueBtnClick(_ sender: Any) {
        // 3.真正传值的时候调用代理完成

        delegate?.passValue(info: inputTf.text)

        dismiss(animated: true, completion: nil)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
