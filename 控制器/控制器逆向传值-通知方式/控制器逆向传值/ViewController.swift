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
        // Do any additional setup after loading the view, typically from a nib.

        // 先监听通知 后发送
        NotificationCenter.default.addObserver(self, selector: #selector(handlerNoti), name: NSNotification.Name("abc"), object: nil)
    }

    @objc func handlerNoti(noti: Notification) {
        let userInfo = noti.userInfo

        infoLb.text = userInfo!["info"] as? String
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let secVC: SecViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! SecViewController

        present(secVC, animated: true, completion: nil)
    }
}
