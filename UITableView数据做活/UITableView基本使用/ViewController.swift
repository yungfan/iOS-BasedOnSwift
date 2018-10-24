//
//  ViewController.swift
//  UITableView基本使用
//
//  Created by 杨帆 on 2018/10/22.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    var content:Array<String>?
    var detailContent:Array<String>?
    
    
    //有多少分组
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //一个分组中有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.content!.count
    }
    
    //每一行长什么样
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //SB方式实现复用
        let cell = tableView.dequeueReusableCell(withIdentifier: "ABC")
        
        //default 只显示textLabel和imageView
        //subtitle value1 三个都显示
        //value2 只显示textLabel和detailTextLabel
        cell?.textLabel?.text = self.content?[indexPath.row]
        cell?.detailTextLabel?.text = self.detailContent?[indexPath.row]
        cell?.imageView?.image = UIImage(named: "iPhone")
        
        return cell!
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.content = ["iPhone 4", "iPhone 4s","iPhone 5","iPhone 5s","iPhone 6","iPhone 6 Plus","iPhone 6s","iPhone 6s Plus","iPhone 7","iPhone 7 Plus","iPhone 8","iPhone 8 Plus","iPhone X", "iPhone Xs","iPhone XR","iPhone Xs Max"]
        self.detailContent = ["iPhone 4 - iOS 4", "iPhone 4s - iOS 5","iPhone 5 - iOS 6","iPhone 5s - iOS 7","iPhone 6 - iOS 8","iPhone 6 Plus - iOS 8","iPhone 6s - iOS 9","iPhone 6s Plus - iOS 9","iPhone 7 - iOS 10","iPhone 7 Plus - iOS 10","iPhone 8 - iOS 11","iPhone 8 Plus - iOS 11","iPhone X - iOS 11", "iPhone Xs - iOS 12","iPhone XR - iOS 12","iPhone Xs Max - iOS 12"]
    }


}

