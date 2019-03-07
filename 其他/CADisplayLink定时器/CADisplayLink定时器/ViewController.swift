//
//  ViewController.swift
//  CADisplayLink定时器
//
//  Created by 杨帆 on 2019/3/7.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //CADisplayLink是一个和屏幕刷新率同步的定时器类
    var cadTimer:CADisplayLink?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cadTimerTest()
    }


    
    func cadTimerTest(){
        
        cadTimer = CADisplayLink(target: self, selector: #selector(cadTimerAction))
        
        // iOS设备屏幕的刷新率60次/秒, CADisplayLink默认每秒运行60次, 但是通过它的preferredFramesPerSecond属性可以改变每秒运行帧数，如设置为2, 意味CADisplayLink每秒运行2次.
        cadTimer?.preferredFramesPerSecond = 1
        // 添加到RunLoop
        cadTimer?.add(to: RunLoop.current, forMode: .default)
        
    }
    
    @objc func cadTimerAction(){
        
        print("Hello World")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 关闭
        cadTimer?.invalidate()
        cadTimer = nil
    }
}

