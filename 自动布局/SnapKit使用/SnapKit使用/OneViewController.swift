//
//  OneViewController.swift
//  SnapKit使用
//
//  Created by 杨帆 on 2019/3/1.
//  Copyright © 2019 杨帆. All rights reserved.
//

import SnapKit
import UIKit

// 单个View
class OneViewController: UIViewController {
    lazy var redBox = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        test1()
    }

    func test1() {
        redBox.backgroundColor = UIColor.red
        view.addSubview(redBox)

        redBox.snp.makeConstraints { make in

            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }
    }

    func test2() {
        redBox.backgroundColor = UIColor.red
        view.addSubview(redBox)

        redBox.snp.makeConstraints { make in

            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
    }
}
