//
//  ViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var infoLb: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1. 获取被代理对象
        let secVC: SecViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! SecViewController

        // 2.将当前的控制器成为SecViewController中的delegate
        secVC.delegate = self

        present(secVC, animated: true, completion: nil)
    }
}

// MARK: - 遵守协议
extension ViewController: passValueProtocol {
    // 3. 遵守协议，实现方法，获取传值
    func passValue(info: String?) {
        infoLb.text = info
    }
}
