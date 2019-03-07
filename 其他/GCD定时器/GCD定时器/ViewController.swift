//
//  ViewController.swift
//  GCD定时器
//
//  Created by 杨帆 on 2019/3/7.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //不受RunLoop的mode影响
    var gcdTimer: DispatchSourceTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gcdTimerTest()
    }
    
    
    func gcdTimerTest(){
        
        // 方式一: 直接使用默认值初始化
        gcdTimer = DispatchSource.makeTimerSource()
        
        // 方式二: flag(标记) + queue(队列)
        //gcdTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        
        
        gcdTimer?.setEventHandler(handler: {
            // 需要执行的操作
            print("Hello World")
            
        })
        
        //1. 参数leeway, 指的是一个期望的容忍时间，将它设置为1秒，意味着系统有可能在定时器时间到达的前1秒或者后1秒才真正触发定时器。在调用时推荐设置一个合理的 leeway 值。需要注意，就算指定 leeway 值为 0，系统也无法保证完全精确的触发时间，只是会尽可能满足这个需求。
        //2. 关于deadline和wallDeadline, 大部分文章中的说法是这样的: 使用 deadline, 系统会使用默认时钟来进行计时, 然而当系统休眠的时候, 默认时钟是不走的, 也就会导致计时器停止; 而使用 wallDeadline可以让计时器按照真实时间间隔进行计时; 但是经过反复测试, 并没有体现出两者的区别
        
        gcdTimer?.schedule(wallDeadline: DispatchWallTime.now(), repeating: DispatchTimeInterval.seconds(1), leeway: DispatchTimeInterval.seconds(0))
        
        gcdTimer?.resume()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //DispatchSourceTimer处于暂停状态下不可以直接关闭,如果想关闭一个执行了suspend()操作的计时器, 需要先执行resume(), 再执行cancel(), 最后置nil. 否则会崩溃
        //gcdTimer?.suspend()
        
        gcdTimer?.cancel()
        gcdTimer = nil
    }
    
}

