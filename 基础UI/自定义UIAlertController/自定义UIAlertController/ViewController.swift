//
//  ViewController.swift
//  自定义UIAlertController
//
//  Created by 杨帆 on 2019/3/28.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let alertController = YFAlertController(title: "系统提示",
                                                message: "一会要下雨，出门前做好准备",
                                                preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)

        let okAction = UIAlertAction(title: "好的", style: .default, handler: { _ in
            print("点击了确定")
        })

        alertController.addAction(cancelAction)

        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
}
