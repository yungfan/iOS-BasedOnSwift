//
//  ViewController.swift
//  多线程-临界资源访问
//
//  Created by stu1 on 2019/1/13.
//  Copyright © 2019年 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count:NSInteger = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //窗口1
        let thread1 = Thread(target: self, selector: #selector(buyTicket), object: nil)
        //设置名字
        thread1.name = "窗口1"
        //启动
        thread1.start()
        
        
        //窗口2
        let thread2 = Thread(target: self, selector: #selector(buyTicket), object: nil)
        //设置名字
        thread2.name = "窗口2"
        //启动
        thread2.start()
        
        
        //窗口3
        let thread3 = Thread(target: self, selector: #selector(buyTicket), object: nil)
        //设置名字
        thread3.name = "窗口3"
        //启动
        thread3.start()
    }
    
    //对于临界资源 多线程访问往往会出现问题 加锁可以解决 (互斥锁)
    
    //加锁的结果：每次只有一个线程可以访问临界资源
    //加锁是一个标志，当该资源没有线程访问的时候，🔒标志为0，当第一个线程来的时候，🔒的标志为1，第一个线程开始访问临界资源
    //如果此时有其他线程来访问该临界资源，先要看看🔒是不是为0，如果是1，则阻塞自己，等待上一个线程访问结束。
    //第一个线程访问结束以后，🔒的标志为0，这时候通知那些准备访问该资源的线程可以来访问了，这时候按照顺序（CPU调度）来继续访问
    
    @objc fileprivate func buyTicket(){
        
        
        while true {
            
            //休眠1秒
            Thread.sleep(forTimeInterval: 1)
            
            //互斥锁开始
            objc_sync_enter(self)
            
            count = count - 1
            
            print("\(Thread.current)卖出去一张，还剩\(count)张票")

            if count <= 0 {
                
                print("票卖完了")
                
                break
            }
            
            //互斥锁结束
            objc_sync_exit(self)
        }
        
    }

}

