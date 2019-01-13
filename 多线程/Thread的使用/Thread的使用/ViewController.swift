//
//  ViewController.swift
//  Thread的使用
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
        
        
        //当iOS程序运行以后，有一个线程随之启动，主线程（main），这个线程很重要，可以接收用户的交互，更新程序的界面等等，因此它的流畅性必须要保证 －－－> 言外之意，耗时的操作不能放在主线程中来执行，否则会造成界面的卡顿甚至崩溃  －－－> 耗时的操作放在子线程中执行 －－－> 比如线程去服务器加载一段新闻数据，拿到新闻数据以后，我要更新界面（Apple直接规定不能在子线程更新主界面，必须回到主线程才行）？－－－> 子线程执行耗时任务，主线程来刷新界面，他们之间需要进行数据的交互和通信
        print(Thread.main)
        
        printCurrentThread()
        
        
        //方式三(会直接启动线程，不需要手动调用start方法来启动线程执行任务)
        Thread.detachNewThread {
            
            Thread.sleep(forTimeInterval: 3)
            
            self.printCurrentThread()
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //方式一
        let thread1 = Thread(target: self, selector: #selector(runThread), object: nil)
      
        //设置名字
        thread1.name = "thread1"
        
        //启动
        thread1.start()
        
        
        //方式二
        let thread2 = Thread {
            
            for _ in 0...10 {
                
                Thread.sleep(forTimeInterval: 1)
                
                print("线程2报数\(self.count)")
                
                self.count = self.count - 1
                
                if self.count <= 0 {
                    
                    break
                }
            }
            
            //子线程中调用的方法仍然处于子线程
            self.printCurrentThread()
            
            print("线程2方法执行完毕")
        }
        
        
        thread2.name = "thread2"
        
        thread2.start()
        
    }
    
    @objc fileprivate func runThread(){
        
        
        for _ in 0...10 {
            
            //休眠1秒
            Thread.sleep(forTimeInterval: 1)
            
            print("线程1报数\(count)")
            
            count = count - 1
            
            if count <= 0 {
                
                break
            }
        }
        
        printCurrentThread()
        
        print("线程1方法执行完毕")
    }
    

    
    func printCurrentThread(){
        
        print(Thread.current)
        
    }
}

