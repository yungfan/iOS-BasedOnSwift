//
//  ViewController.swift
//  UITableView基本使用
//
//  Created by 杨帆 on 2018/10/22.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // 有多少分组
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 一个分组中有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    // 每一行长什么样
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         //纯代码实现复用
         //去重用池子中找cell
         var cell = tableView.dequeueReusableCell(withIdentifier: "abc")

         //池子中没有就创建一个新的
         if cell == nil {

             cell = UITableViewCell(style: .subtitle, reuseIdentifier: "abc")

         }

         cell?.textLabel?.text = "AAA"
         cell?.detailTextLabel?.text = "BBB"
         cell?.imageView?.image = UIImage(named: "setting_about_pic")

         return cell!
          */

        // SB方式实现复用
        let cell = tableView.dequeueReusableCell(withIdentifier: "ABC")

        // default 只显示textLabel和imageView
        // subtitle value1 三个都显示
        // value2 只显示textLabel和detailTextLabel
        cell?.textLabel?.text = "AAA"
        cell?.detailTextLabel?.text = "BBB"
        cell?.imageView?.image = UIImage(named: "setting_about_pic")

        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
