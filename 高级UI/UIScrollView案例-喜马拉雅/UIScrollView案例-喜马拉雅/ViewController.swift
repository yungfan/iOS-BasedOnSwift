//
//  ViewController.swift
//  UIScrollView案例-喜马拉雅
//
//  Created by 杨帆 on 2018/10/19.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lastImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //通过获取最后一张图的Y值 然后加一点 就可以不用一个具体的数字 导致下面空白过大或过小的问题
        self.scrollView.contentSize = CGSize(width: 0, height: lastImg.frame.maxY + 10)
    }

    @IBAction func settting(_ sender: Any) {
        
        print("点击了设置按钮")
        
    }
    
}

