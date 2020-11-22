//
//  CustomNavigationViewController.swift
//  导航控制器的使用-代码
//
//  Created by 杨帆 on 2018/11/27.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

// 自定义导航控制器
class CustomNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // 统一定制返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        super.pushViewController(viewController, animated: true)
    }
}
