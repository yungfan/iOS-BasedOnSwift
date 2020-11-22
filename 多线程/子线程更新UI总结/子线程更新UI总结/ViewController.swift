//
//  ViewController.swift
//  子线程更新UI总结
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//  不能在子线程中更新主界面 －－－> 子线程进行耗时操作 主线程进行界面更新的模式 －－－> 线程之间通信问题

import UIKit

class ViewController: UIViewController {
    @IBOutlet var infoLb: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Thread模式

    func threadMode() {
        let thread = Thread {
            print("\(Thread.current)执行任务")

            Thread.sleep(forTimeInterval: 2)

            self.perform(#selector(self.updateUI), on: Thread.main, with: nil, waitUntilDone: false)
        }

        thread.start()
    }

    // MARK: - GCD模式

    func gcdMode() {
        DispatchQueue.global().async {
            print("\(Thread.current)执行任务")

            Thread.sleep(forTimeInterval: 2)

            DispatchQueue.main.async {
                self.infoLb.text = "GCD方式更新UI"
            }
        }
    }

    // MARK: - Operation模式

    func operationMode() {
        OperationQueue().addOperation {
            print("\(Thread.current)执行任务")

            Thread.sleep(forTimeInterval: 2)

            OperationQueue.main.addOperation {
                self.infoLb.text = "Operation方式更新UI"
            }
        }
    }

    @objc fileprivate func updateUI() {
        infoLb.text = "Thread方式更新UI"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // threadMode()
        gcdMode()
        // operationMode()
    }
}
