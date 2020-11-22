//
//  ViewController.swift
//  UITableView基本使用
//
//  Created by 杨帆 on 2018/10/22.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var content: Array<String>?
    var detailContent: Array<String>?

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        content = ["iPhone 4", "iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone Xs", "iPhone XR", "iPhone Xs Max"]
        detailContent = ["iPhone 4 - iOS 4", "iPhone 4s - iOS 5", "iPhone 5 - iOS 6", "iPhone 5s - iOS 7", "iPhone 6 - iOS 8", "iPhone 6 Plus - iOS 8", "iPhone 6s - iOS 9", "iPhone 6s Plus - iOS 9", "iPhone 7 - iOS 10", "iPhone 7 Plus - iOS 10", "iPhone 8 - iOS 11", "iPhone 8 Plus - iOS 11", "iPhone X - iOS 11", "iPhone Xs - iOS 12", "iPhone XR - iOS 12", "iPhone Xs Max - iOS 12"]
    }

    @IBAction func edit(_ sender: Any) {
        tableView.setEditing(true, animated: true)
    }

    @IBAction func done(_ sender: Any) {
        tableView.setEditing(false, animated: true)
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
        // SB方式实现复用
        let cell = tableView.dequeueReusableCell(withIdentifier: "ABC")

        // default 只显示textLabel和imageView
        // subtitle value1 三个都显示
        // value2 只显示textLabel和detailTextLabel
        cell?.textLabel?.text = content?[indexPath.row]
        cell?.detailTextLabel?.text = detailContent?[indexPath.row]
        cell?.imageView?.image = UIImage(named: "iPhone")

        return cell!
    }

    // Section头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "iPhone 大全"
    }

    // Section尾部
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "iOS大全"
    }
}

extension ViewController: UITableViewDelegate {
    // 选中（点击行）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let contentText = content?[indexPath.row]
        let detailText = detailContent?[indexPath.row]
        print("\(contentText!)--\(detailText!)")
    }

    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    // Section头部高
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }

    // Section尾部高
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60.0
    }

    // 允许编辑
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // 提交编辑
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 1.删除数组中对应的数据
            content?.remove(at: indexPath.row)
            detailContent?.remove(at: indexPath.row)

            // 2.TableView显示的那一样删除
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // 1.增加一条数据
            content?.insert("iPhone 1", at: indexPath.row)
            detailContent?.insert("iPhone 1 - iPhone OS", at: indexPath.row)
            // 2.增加一行
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

    // 删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }

    // 编辑的风格（默认是删除）
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }

    // 能否移动
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // 移动表格
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let contentText = content?[sourceIndexPath.row]

        content?.remove(at: sourceIndexPath.row)

        content?.insert(contentText!, at: destinationIndexPath.row)

        let detailContentText = detailContent?[sourceIndexPath.row]

        detailContent?.remove(at: sourceIndexPath.row)

        detailContent?.insert(detailContentText!, at: destinationIndexPath.row)
    }
}
