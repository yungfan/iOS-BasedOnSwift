//
//  ViewController.swift
//  本地通知
//
//  Created by 杨帆 on 2019/2/15.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //一段时间后触发——触发器不一样而已
    @IBAction func timeInterval(_ sender: AnyObject){
        //设置推送内容
        let content = UNMutableNotificationContent()
        content.title = "你好"
        content.body = "这是一条基于时间间隔的测试通知"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "feiji.wav"))
        content.badge = 1
        
        //设置通知触发器
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //设置请求标识符
        let requestIdentifier = "com.abc.testUserNotifications"
        
        //设置一个通知请求
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        //将通知请求添加到发送中心
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    //指定日期时间触发
    @IBAction func dateInterval(_ sender: AnyObject){
        
        //设置推送内容
        let content = UNMutableNotificationContent()
        content.title = "你好"
        content.body = "这是一条基于日期的测试通知"
        
        //设置时间
        var components = DateComponents()
        components.year = 2019
        components.month = 2
        components.day = 15
        
        //每周一上午8点
        //var components = DateComponents()
        //components.weekday = 2 //周一
        //components.hour = 8 //上午8点
        //components.second = 30 //30分
        
        //设置通知触发器
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        
        //设置请求标识符
        let requestIdentifier = "com.abc.testUserNotifications"
        
        //设置一个通知请求
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        //将通知请求添加到发送中心
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    //根据位置触发
    @IBAction func locationInterval(_ sender: AnyObject){
        
        //设置推送内容
        let content = UNMutableNotificationContent()
        content.title = "你好"
        content.body = "这是一条基于位置的测试通知"

        
        let coordinate = CLLocationCoordinate2D(latitude: 31.29, longitude: 118.36)
        let region = CLCircularRegion(center: coordinate, radius: 500, identifier: "center")
        region.notifyOnEntry = true  //进入此范围触发
        region.notifyOnExit = false  //离开此范围不触发
        
        //设置触发器
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        //设置请求标识符
        let requestIdentifier = "com.abc.testUserNotifications"
        
        //设置一个通知请求
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        //将通知请求添加到发送中心
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

