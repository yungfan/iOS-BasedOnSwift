//
//  ViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let titles = ["轮播器类", "指示器类", "图片类", "图表类", "播放器类"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "third", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:

            navigationController?.pushViewController(FSPagerViewViewController(), animated: true)

        case 1:
            navigationController?.pushViewController(XLPagerTabStripViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(DKImagePickerControllerViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(ChartsViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(BMPlayerViewController(), animated: true)

        default:
            print("error")
        }
    }
}
