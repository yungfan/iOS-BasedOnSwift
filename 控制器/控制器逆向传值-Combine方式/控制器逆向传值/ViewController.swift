//
//  ViewController.swift
//  控制器逆向传值
//
//  Created by 杨帆 on 2018/11/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import Combine
import UIKit

class ViewController: UIViewController {
    @IBOutlet var infoLb: UILabel!

    private var subscription: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1. 获取需要传值的SecViewController
        let secVC: SecViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! SecViewController

        // 2. 创建PassthroughSubject
        let publisher: PassthroughSubject<String, Never> = PassthroughSubject()
        secVC.publisher = publisher

        // 3. 订阅PassthroughSubject
        subscription = publisher.sink { [weak self] info in
            guard let self = self else { return }
            self.infoLb.text = info
        }

        present(secVC, animated: true, completion: nil)
    }
}
