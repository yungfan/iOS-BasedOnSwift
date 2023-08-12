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

        // 监听通知
        // object：与发送时的object对应，只有当通知来指定的发送者时才触发
        // handlerNoti中的代码执行时所在的线程由发出通知的线程决定
        NotificationCenter.default.addObserver(self, selector: #selector(handlerNoti), name: NSNotification.Name("abc"), object: nil)
    }

    // 收到通知处理
    @objc func handlerNoti(noti: Notification) {
        let userInfo = noti.userInfo

        infoLb.text = userInfo!["info"] as? String
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let secVC: SecViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! SecViewController

        present(secVC, animated: true, completion: nil)
    }
}
