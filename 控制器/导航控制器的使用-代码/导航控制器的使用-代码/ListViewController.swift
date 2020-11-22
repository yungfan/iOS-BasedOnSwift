//
//  ListViewController.swift
//  导航控制器的使用-代码
//
//  Created by 杨帆 on 2018/11/27.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "List"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "条目", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightClick))

        // 有了leftBarButtonItem,backBarButtonItem失效
//        self.navigationItem.leftBarButtonItem =   UIBarButtonItem(title:  "返回", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftClick))
    }

    @objc func rightClick(button: UIBarButtonItem) {
        navigationController?.pushViewController(ItemViewController(), animated: true)
    }

    @objc func leftClick(button: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
