//
//  ViewController.swift
//  导航控制器的基本使用
//
//  Created by 杨帆 on 2018/11/23.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func addClick(_ sender: Any) {
        print("点击了右侧的按钮")
    }

    @IBAction func moveToSecVC(_ sender: Any) {
        let secVC: SecViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! SecViewController

        navigationController?.pushViewController(secVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
