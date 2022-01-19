//
//  ViewController.swift
//  TomCat案例
//
//  Created by 杨帆 on 2018/10/15.
//  Copyright © 2018 ABC. All rights reserved.
//

import Combine
import UIKit

class ViewController: UIViewController {
    @IBOutlet var tomcat: UIImageView!
    private var index = 0
    var cancellable: AnyCancellable?
    // Combine定时器
    // every: 时间间隔
    // on: 线程
    // in: RunLoop
    let timer = Timer.publish(every: 0.08, on: .main, in: .common)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: 点击动作按钮
    @IBAction func drink(_ sender: Any) {
        // 重复点击时重置
        if cancellable != nil {
            reset()
        }
        // Combine Timer
        cancellable = timer
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tomcat.image = UIImage(contentsOfFile: Bundle.main.path(forResource: String(format: "drink_%02d.jpg", self.index), ofType: nil)!)
                if self.index == 80 {
                    self.reset()
                } else {
                    self.index += 1
                }
            }
    }

    // MARK: 取消定时器与重置图片索引
    func reset() {
        cancellable = nil
        index = 0
    }
}
