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

    @IBAction func drink(_ sender: Any) {
        // 1.加载drink的动画图片
        let imageArrayDrink = (0 ... 80).map {
            UIImage(contentsOfFile: Bundle.main.path(forResource: String(format: "drink_%02d.jpg", $0), ofType: nil)!)!
        }
        // 2.让图片进行动画的播放
        // 图片数组
        tomcat.animationImages = imageArrayDrink
        // 动画时间
        tomcat.animationDuration = 3.0
        // 动画次数
        tomcat.animationRepeatCount = 1
        // 开始动画
        tomcat.startAnimating()
    }

    @IBAction func leftFootClick(_ sender: Any) {
        let imageArrayFootLeft = (0 ... 29).map {
            UIImage(contentsOfFile: Bundle.main.path(forResource: String(format: "footLeft_%02d.jpg", $0), ofType: nil)!)!
        }
        tomcat.animationImages = imageArrayFootLeft

        tomcat.animationDuration = 2.0

        tomcat.animationRepeatCount = 1

        tomcat.startAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
