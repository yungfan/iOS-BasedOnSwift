//
//  ViewController.swift
//  UITableView基本使用
//
//  Created by 杨帆 on 2018/10/22.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var content: Array<String> = ["iPhone 4", "iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone Xs", "iPhone XR", "iPhone Xs Max"]
    var detailContent: Array<String> = ["iPhone 4 - iOS 4", "iPhone 4s - iOS 5", "iPhone 5 - iOS 6", "iPhone 5s - iOS 7", "iPhone 6 - iOS 8", "iPhone 6 Plus - iOS 8", "iPhone 6s - iOS 9", "iPhone 6s Plus - iOS 9", "iPhone 7 - iOS 10", "iPhone 7 Plus - iOS 10", "iPhone 8 - iOS 11", "iPhone 8 Plus - iOS 11", "iPhone X - iOS 11", "iPhone Xs - iOS 12", "iPhone XR - iOS 12", "iPhone Xs Max - iOS 12"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let refresh = UIRefreshControl()

        refresh.attributedTitle = NSAttributedString(string: "下拉刷新")

        refresh.addTarget(self, action: #selector(loadData), for: .valueChanged)

        tableView.refreshControl = refresh
    }

    @objc func loadData() {
        // 延迟执行
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // 增加一条数据
            self.content.insert("iPhone 3GS", at: 0)
            self.detailContent.insert("iPhone 3GS - iOS 3", at: 0)

            // 刷新表格 结束刷新的状态
            self.tableView.reloadData()

            if (self.tableView.refreshControl?.isRefreshing)! {
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    // 一个分组中有多少行
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }

    // 每一行长什么样
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // SB方式实现复用
        let cell = tableView.dequeueReusableCell(withIdentifier: "ABC")

        // default 只显示textLabel和imageView
        // subtitle value1 三个都显示
        // value2 只显示textLabel和detailTextLabel
        cell?.textLabel?.text = content[indexPath.row]
        cell?.detailTextLabel?.text = detailContent[indexPath.row]
        cell?.imageView?.image = UIImage(named: "iPhone")

        return cell!
    }
}
