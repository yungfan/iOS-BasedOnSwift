//
//  ViewController.swift
//  GCD的使用
//
//  Created by stu1 on 2019/1/13.
//  Copyright © 2019年 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var queue:DispatchQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // MARK:- 创建队列
    func create(){
        
        //一、主队列（串行队列）
        let main = DispatchQueue.main
        
        //二、global方式创建全局并发队列
        let defaultGlobalDipatchQueue =  DispatchQueue.global()
        //带qos
        let dipatchQueue = DispatchQueue.global(qos: .default)
        
        //1.创建一个队列, 当除label外的参数都使用默认值时，初始化方法返回的便是串行队列。如果需要返回并发队列，参数attributes传值为.concurrent即可。label：队列的名称
        //2.参数qos（Quality of Service(服务质量)）代表队列执行的优先级，有六种优先级可供选择，优先级从高到低依次为userInteractive>userInitiated>utility>background, 而default与unspecified介于userInteractive与background之间，具体由系统决定。
        //DISPATCH_QUEUE_PRIORITY_HIGH:        .userInitiated
        //DISPATCH_QUEUE_PRIORITY_DEFAULT:      .default
        //DISPATCH_QUEUE_PRIORITY_LOW:          .utility
        //DISPATCH_QUEUE_PRIORITY_BACKGROUND:  .background
        //3.DispatchQueue.Attributes 是一个结构体类型，该结构体提供了两个静态变量：concurrent和initiallyInactive(注意，没有代表串行队列的静态变量)。如果attributes参数传值为initiallyInactive,  任务不会自动执行，而是需要开发者手动调用activate()触发。但是代码依然是串行进行的,如果想要手动触发、并行执行任务,可以指定attributes参数接受一个数组: [.concurrent, .initiallyInactive]
        //4. DispatchQueue.AutoreleaseFrequency有三种属性值.inherit、.workItem和.never，用来设置负责管理任务内对象生命周期的 autorelease pool 的自动释放频率。
        //.inherit：继承目标队列的该属性
        //.workItem：跟随每个任务的执行周期进行自动创建和释放
        //.never：不会自动创建 autorelease pool，需要手动管理
        //一般采用前两项。如果任务内需要大量重复的创建对象，可以使用 never 类型，来手动创建 aotorelease pool
        
        //5.参数target 该参数设置了队列的目标队列，即队列中的任务运行时实际所在的队列。目标队列最终约束了队列的优先级等属性。在程序中手动创建的队列最后都指向了系统自带的主队列或全局并发队列。
        //从 Swift 3 开始，对目标队列的设置进行了约束，只有两种情况可以显示的设置目标队列：
        //（1）在初始化方法中设置目标队列；
        //（2）在初始化方法中，attributes 设定为 initiallyInactive，在队列调用 activate() 之前，可以指定目标队列。
        
        //三、创建一个名为queue001的并行队列
        let queue = DispatchQueue(label: "queue001", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
        
        
        self.queue = defaultGlobalDipatchQueue
    }
    
    
    // MARK:- 同步与异步
    
    //async 异步，async 函数会立即返回, 闭包会在后台异步执行
    //sync 同步，sync 函数不会立即返回，即阻塞当前线程,等待闭包同步执行完成
    func use(){
        
        print("使用之前")
        
        self.queue.async {
            
            Thread.sleep(forTimeInterval: 1)
            
            print("异步")
        }
        
        self.queue.sync {
            
            Thread.sleep(forTimeInterval: 1)
            
            print("同步")
            
        }
        
        print("使用之后")
    }
    
    // MARK:- 并发队列与串行队列
    
    //不管是并发队列还是串行队列，如果是同步执行，不会开辟新线程，只有异步执行才会开辟新线程-通过打印可以得出
    //并发队列在执行多个任务的时候，会开辟多个线程之执行，而串行队列不会，他会执行完一个再去执行另外一个
    func important(){
        
        let queueSerial = DispatchQueue(label: "串行")
        
        let queueConcurrent = DispatchQueue(label: "并发", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        
        queueConcurrent.async {
            
            print(Thread.current)
            
            for i in 0...10{
                
                Thread.sleep(forTimeInterval: 1)
                
                print("1执行任务\(i)")
            }
            
            
        }
        
        
        queueConcurrent.async {
            
            print(Thread.current)
            
            for i in 0...10{
                
                Thread.sleep(forTimeInterval: 1)
                
                print("2执行任务\(i)")
            }
            
            
        }
        
    }
    
    // MARK:- 延迟执行
    func dispatchAfter(){
        
        self.queue.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            print("延迟2s执行")
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            print("延时提交的任务")
        }
        
    }
    
    // MARK:- 任务封装成DispatchWorkItem对象，调用workItem的perform()函数执行任务
    func dispatchWorkItem(){
        
        var value = 10
        //DispatchWorkItem是帮助DispatchQueue来执行队列中的任务的
        let workItem = DispatchWorkItem {
            value += 5
        }
        
        //初始化方法可以传入一个闭包，闭包中就是需要执行的任务，通过perform()方法来唤起该DispatchWorkItem来执行任务
        workItem.perform()
        
        print(value)
    }
    
    
    
    // MARK:- 按指定次数异步执行任务，并且会等待指定次数的任务全部执行完成，即会阻塞线程
    func concurrentPerform(){
        
        self.queue.async {
            
            DispatchQueue.concurrentPerform(iterations: 5) { (i) in
                
                print("第\(i)遍执行任务")
                
            }
            print("任务执行完成")
        }
    }
    
    // MARK:- 多个任务处理全部结束后想执行结束处理，这个时候就可用到DispatchGroup
    func group(){
        
        let group = DispatchGroup()
        
        queue.async(group: group) {
            print("网络请求任务一")
        }
        
        queue.async(group: group) {
            
            print("网络请求任务二")
        }
        
        queue.async(group: group) {
            
            print("网络请求任务三")
        }
        
        group.notify(queue: DispatchQueue.main) {
            
            print("完成任务一、二、三, 更新UI")
        }
        
        queue.async {
            
            print("其他任务四")
        }
    }
    
    // MARK:- 可以通过group的enter()函数和leave()函数显式表明任务是否执行完成,enter()函数和leave()成对出现
    func group2(){
        
        let group = DispatchGroup()
        
        group.enter()
        queue.async(group: group) {
            
            print("网络请求任务一")
            group.leave()
        }
        
        group.enter()
        queue.async(group: group) {
            
            print("网络请求任务二")
            group.leave()
        }
        
        group.enter()
        queue.async(group: group) {
            
            print("网络请求任务三")
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            
            print("完成任务一、二、三, 更新UI")
        }
        
        queue.async {
            
            print("其他任务四")
        }
    }
    
    
    // MARK:- 信号量操作
    func semaphore(){
        
        var arr = [Int]()
        //value表示允许访问资源的线程数量，当value为0时对访问资源的线程没有限制
        let semaphore = DispatchSemaphore.init(value: 1)
        
        for i in 0...100 {
            
            DispatchQueue.global().async {
                
                /*
                 其他并发操作
                 */
                print("下载任务1")
                
                //信号量配套使用wait()函数与signal()函数控制访问资源
                semaphore.wait() // 如果信号量计数>=1,将信号量计数减1；如果信号量计数<1，阻塞线程直到信号量计数>=1
                arr.append(i)
                semaphore.signal() // 信号量计加1
                
                /*
                 其他并发操作
                 */
                print("下载任务2")
                
            }
            
            print(arr)
        }
        
        
    }
    
    
    // MARK:- Test
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.create()
        //self.use()
        //self.dispatchAfter()
        //self.dispatchWorkItem()
        //self.concurrentPerform()
        //self.group()
        //self.group2()
        //self.semaphore()
    }
}

