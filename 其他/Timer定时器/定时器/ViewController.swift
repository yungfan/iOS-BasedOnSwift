//
//  ViewController.swift
//  定时器
//
//  Created by 杨帆 on 2019/2/15.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        method1()
    }

    // 方式1 与 方式2 经测试如果调用fire 只会运行一次 必须添加到Runloop里面去
    // 方式1
    func method1() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(ViewController.test), userInfo: nil, repeats: true)

        RunLoop.current.add(timer, forMode: .common)
    }

    // 方式2
    func method2() {
        timer = Timer(timeInterval: 1.0, repeats: true, block: { _ in

            print("Hello World")
        })

        RunLoop.current.add(timer, forMode: .common)
    }

    // 方式3
    func method3() {
        // 这种方式会自动启动定时器 推荐使用这种方式
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in

            print("Hello World")
        }

        // 模式不同 他的运行的状态就不一样
        // 用这种模式 在滑动的时候定时器不会停
        RunLoop.current.add(timer, forMode: .common)
    }

    @objc func test() {
        print("Hello World")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 失效
        timer?.invalidate()

        timer = nil
    }
}
