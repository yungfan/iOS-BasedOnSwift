//
//  SecViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

// 1 定义一个闭包
typealias Disclosure = (String?) -> Void

class SecViewController: UIViewController {
    @IBOutlet var inputTf: UITextField!

    // 2.声明一个闭包类型的属性
    var discloure: Disclosure?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func passValueBtnClick(_ sender: Any) {
        // 3.传值
        discloure?(inputTf.text)

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
