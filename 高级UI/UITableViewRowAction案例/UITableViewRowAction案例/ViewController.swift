//
//  ViewController.swift
//  UITableViewRowAction案例
//
//  Created by 杨帆 on 2021/1/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var content: Array<String>?
    var detailContent: Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()

        content = ["iPhone 4", "iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone Xs", "iPhone XR", "iPhone Xs Max", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPhone 12 mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max"]
        detailContent = ["iPhone 4 - iOS 4", "iPhone 4s - iOS 5", "iPhone 5 - iOS 6", "iPhone 5s - iOS 7", "iPhone 6 - iOS 8", "iPhone 6 Plus - iOS 8", "iPhone 6s - iOS 9", "iPhone 6s Plus - iOS 9", "iPhone 7 - iOS 10", "iPhone 7 Plus - iOS 10", "iPhone 8 - iOS 11", "iPhone 8 Plus - iOS 11", "iPhone X - iOS 11", "iPhone Xs - iOS 12", "iPhone XR - iOS 12", "iPhone Xs Max - iOS 12", "iPhone 11 - iOS 13", "iPhone 11 Pro - iOS 13", "iPhone 11 Pro Max - iOS 13", "iPhone 12 mini - iOS 14", "iPhone 12 - iOS 14", "iPhone 12 Pro - iOS 14", "iPhone 12 Pro Max - iOS 14"]
    }
}

extension ViewController: UITableViewDataSource {
    // 有多少分组
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 一个分组中有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content!.count
    }

    // 每一行长什么样
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // storyboard方式实现复用
        let cell = tableView.dequeueReusableCell(withIdentifier: "ABC")
        cell?.textLabel?.text = content?[indexPath.row]
        cell?.detailTextLabel?.text = detailContent?[indexPath.row]
        cell?.imageView?.image = UIImage(named: "iPhone")

        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    // 右滑菜单
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action1 = UIContextualAction(style: .normal, title: "菜单1") { _, _, _ in
            print("右滑菜单1点击")
        }
        // 背景色
        action1.backgroundColor = .blue

        let action2 = UIContextualAction(style: .normal, title: "菜单2") { _, _, _ in
            print("右滑菜单2点击")
        }
        // 背景色
        action2.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [action1, action2])
    }

    // 左滑菜单
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: nil) { _, _, _ in
            print("左滑菜单点击")
        }
        // 图片菜单
        action.image = UIImage(systemName: "heart")
        action.backgroundColor = .green

        return UISwipeActionsConfiguration(actions: [action])
    }
}
