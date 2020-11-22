//
//  ViewController.swift
//  Operation的使用
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 普通队列
    let operationQueue = OperationQueue()
    // main队列
    let queue = OperationQueue.main

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - 设置OperationQueue

    func setOperationQueue() {
        // 并发数
        operationQueue.maxConcurrentOperationCount = 2
    }

    // MARK: - 设置Operation

    func setOperation(op: Operation) {
        // 优先级
        op.queuePriority = .high
    }

    // MARK: - Operation使用方式一

    func operationUseOne() {
        operationQueue.addOperation {
            Thread.sleep(forTimeInterval: 2)
            print("\(Thread.current)执行任务一")
        }

        operationQueue.addOperation {
            Thread.sleep(forTimeInterval: 2)
            print("\(Thread.current)执行任务二")
        }

        operationQueue.addOperation {
            Thread.sleep(forTimeInterval: 2)
            print("\(Thread.current)执行任务三")
        }
    }

    // MARK: - Operation使用方式二

    func operationUseTwo() {
        let operation1 = BlockOperation {
            print("\(Thread.current)执行任务一")
            Thread.sleep(forTimeInterval: 3)
        }

        let operation2 = BlockOperation {
            print("\(Thread.current)执行任务二")
            Thread.sleep(forTimeInterval: 3)
        }

        let operation3 = BlockOperation {
            print("\(Thread.current)执行任务三")
            Thread.sleep(forTimeInterval: 3)
        }

        //        operationQueue.addOperation(operation1)
        //        operationQueue.addOperation(operation2)
        //        operationQueue.addOperation(operation3)

        operationQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: false)

        // waitUntilFinished如果为false 不会等任务完成后再执行下面的，否则会等待，阻塞主线程
        print("\(Thread.current)执行其他任务")
    }

    // MARK: - Operation开始

    @IBAction func start(_ sender: Any) {
        setOperationQueue()

        // 能看到演示效果：1.设置并发数 2.waitUntilFinished: false
        operationUseTwo()
    }

    // MARK: - Operation挂起

    // OperationQueue中的那些还没有被CPU调度的线程才会暂停执行，那些已经被CPU调度的程序不会暂停

    @IBAction func suspend(_ sender: Any) {
        if operationQueue.operationCount != 0 && operationQueue.isSuspended == false {
            operationQueue.isSuspended = true
        }
    }

    // MARK: - Operation重启

    // OperationQueue中的那些还没有被CPU调度的线程可以继续执行
    @IBAction func resume(_ sender: Any) {
        if operationQueue.operationCount != 0 && operationQueue.isSuspended == true {
            operationQueue.isSuspended = false
        }
    }

    // MARK: - Operation取消

    // OperationQueue中的那些还没有被CPU调度的线程才会取消执行，无法再次让它们运行
    @IBAction func cancel(_ sender: Any) {
        operationQueue.cancelAllOperations()
    }

    // MARK: - Operation依赖

    func dependent() {
        let operation1 = BlockOperation {
            print("\(Thread.current)执行任务一")
            Thread.sleep(forTimeInterval: 1)
        }

        // 监听Operation完成
        operation1.completionBlock = {
            print("\(Thread.current)完成任务一")
        }

        let operation2 = BlockOperation {
            print("\(Thread.current)执行任务二")
            Thread.sleep(forTimeInterval: 1)
        }

        operation2.completionBlock = {
            print("\(Thread.current)完成任务二")
        }

        // operation2在operation1执行之后执行(通过打印可以看出，并不是等completionBlock完成之后才执行，而是BlockOperation体执行完就开始执行)
        operation2.addDependency(operation1)

        let operation3 = BlockOperation {
            print("\(Thread.current)执行任务三")
            Thread.sleep(forTimeInterval: 2)
        }

        operation3.completionBlock = {
            print("\(Thread.current)完成任务三")
        }

        // operation3在operation2执行之后执行
        operation3.addDependency(operation2)

        operationQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: false)

        print("\(Thread.current)执行其他任务")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // operationUseOne()

        dependent()

        // 串行队列与依赖之间的区别？
        // 1、队列依旧是并发的，并不是串行的
        // 2、执行结果看似一样其实不一样，串行队列是将任务添加到队列以后串行执行，而依赖关系是并行执行的
    }
}
