//
//  ViewController.swift
//  GoToAppStore
//
//  Created by 杨帆 on 2019/3/28.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        // 弹出消息框
        let alertController = UIAlertController(title: "给我个好评吧！",
                                                message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "暂不评价", style: .cancel, handler: nil)

        let okAction = UIAlertAction(title: "好的", style: .default, handler: { _ in

            self.gotoAppStore()
        })

        alertController.addAction(cancelAction)

        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }

    // 跳转到应用的AppStore页页面
    func gotoAppStore() {
        // URL Scheme
        let urlString = "itms-apps://itunes.apple.com/app/id12345678"

        if let url = URL(string: urlString) {
            // 根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
