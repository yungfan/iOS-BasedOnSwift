//
//  ViewController.swift
//  多Section处理
//
//  Created by 杨帆 on 2021/1/3.
//

import UIKit

class ViewController: UIViewController {
    var data = [ModelElement]()

    var tools: NetworkTools<[ModelElement]>!

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建网络工具类
        tools = NetworkTools<[ModelElement]>(url: URL(string: "http://112.44.127.7:8082/person")!) {
            let decoder = JSONDecoder()
            if let models = try? decoder.decode([ModelElement].self, from: $0) {
                self.data = models
                // 网络数据回来时刷新表格
                self.tableView.reloadData()
                return models
            }

            return nil
        }

        // 进行网络加载
        tools.load()

        // 去掉多余的单元格
        tableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].明细.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc") as! MyTableViewCell
        cell.setData(model: data[indexPath.section].明细[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    // Section头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let str = data[section].时间

        let index = str.index(str.endIndex, offsetBy: -7)

        return "\(str[str.startIndex ..< index])            合计金额 \(data[section].金额)"
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
}
