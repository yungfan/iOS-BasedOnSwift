//
//  TwoViewController.swift
//  SnapKit使用
//
//  Created by 杨帆 on 2019/3/1.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

// 多个View
class TwoViewController: UIViewController {
    lazy var redBox = UIView()
    lazy var blueBox = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        test3()
    }

    func test1() {
        redBox.backgroundColor = UIColor.red
        view.addSubview(redBox)

        blueBox.backgroundColor = UIColor.blue
        redBox.addSubview(blueBox)

        redBox.snp.makeConstraints { make in

            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }

        blueBox.snp.makeConstraints { make in

            make.width.height.equalTo(50)
            make.center.equalTo(self.redBox)
        }
    }

    func test2() {
        redBox.backgroundColor = UIColor.red
        view.addSubview(redBox)

        blueBox.backgroundColor = UIColor.blue
        view.addSubview(blueBox)

        redBox.snp.makeConstraints { make in

            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            make.top.equalTo(20)
        }

        blueBox.snp.makeConstraints { make in

            make.width.height.equalTo(redBox)
            make.left.equalTo(redBox) // 等同于 make.left.equalTo(redBox.snp.left)
            make.top.equalTo(redBox.snp.bottom).offset(20)
        }
    }

    func test3() {
        redBox.backgroundColor = UIColor.red
        view.addSubview(redBox)

        blueBox.backgroundColor = UIColor.blue
        redBox.addSubview(blueBox)

        redBox.snp.makeConstraints { make in

            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }

        blueBox.snp.makeConstraints { make in

            make.size.equalTo(self.redBox).multipliedBy(0.2)
            make.center.equalTo(self.redBox)
        }
    }
}
