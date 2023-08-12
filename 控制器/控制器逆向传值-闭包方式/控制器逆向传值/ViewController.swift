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
        // 1. 获取需要传值的SecViewController
        let secVC: SecViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! SecViewController

        // 2. 实现SecViewController的闭包
        secVC.discloure = { (info: String?) -> Void in

            // 3. 获取传值
            self.infoLb.text = info
        }

        present(secVC, animated: true, completion: nil)
    }
}
