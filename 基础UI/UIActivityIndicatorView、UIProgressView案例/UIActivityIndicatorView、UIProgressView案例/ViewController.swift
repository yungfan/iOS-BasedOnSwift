//
//  ViewController.swift
//  UIActivityIndicatorView、UIProgressView案例
//
//  Created by 杨帆 on 2018/10/16.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var indicator: UIActivityIndicatorView!

    @IBOutlet var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        indicator.stopAnimating()

        // UIView动画
        // 动画执行的时间
        // 动画执行的操作
        UIView.animate(withDuration: 5.0) {
            // 千万不要直接设置progress，因为这样是不会有动画效果的
            // self.progressView.progress = 1.0

            // 必须要用带animated参数的方法来进行设置 才会有动画
            self.progressView.setProgress(1.0, animated: true)
        }
    }
}
