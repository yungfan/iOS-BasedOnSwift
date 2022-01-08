//
//  ViewController.swift
//  TomCat案例
//
//  Created by 杨帆 on 2018/10/15.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tomcat: UIImageView!
    // 图片索引
    private var index = 0
    // 定时器
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: 点击动作按钮
    @IBAction func drink(_ sender: Any) {
        // 重复点击时重置
        if timer != nil {
            reset()
        }
        // 创建Timer，切换图片
        timer = Timer(timeInterval: 0.08, repeats: true) { _ in
            self.tomcat.image = UIImage(contentsOfFile: Bundle.main.path(forResource: String(format: "drink_%02d.jpg", self.index), ofType: nil)!)
            if self.index == 80 {
                self.reset()
            } else {
                self.index += 1
            }
        }

        RunLoop.current.add(timer!, forMode: .common)
    }

    // MARK: 重置定时器与索引

    func reset() {
        timer?.invalidate()
        timer = nil
        index = 0
    }
}
