//
//  NewsViewController.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    // UITableView的数据源
    var tableViewData: [DataItem]?
    // UITableView
    var newsTableView: UITableView!
    // 刷新控件
    var refreshControl: UIRefreshControl!
    // 点击的时候的索引
    var selectedIndex: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI
        setupUI()

        // 获取新闻
        getNews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 当重新进改界面的时候 刷新选中行的数据
        if let selectedIndex = self.selectedIndex {
            newsTableView.reloadRows(at: [selectedIndex], with: .none)
        }
    }

    fileprivate func setupUI() {
        title = "YF 新闻"

        let tab = UITableView(frame: view.bounds)

        tab.showsVerticalScrollIndicator = false

        tab.delegate = self

        tab.dataSource = self

        // 纯代码方式使用Cell
        tab.register(NewsCodeTableViewCell.self, forCellReuseIdentifier: "newsCell")

        // 行高

        tab.estimatedRowHeight = 135.0

        tab.rowHeight = UITableView.automaticDimension

        // 刷新控件
        let refreshControl = UIRefreshControl()

        refreshControl.addTarget(self, action: #selector(getNews), for: .valueChanged)

        self.refreshControl = refreshControl

        tab.refreshControl = refreshControl

        view.addSubview(tab)

        newsTableView = tab
    }

    @objc fileprivate func getNews() {
        // 1.创建网络URL
        // 用的是聚合数据的URL
        // 由于不是HTTPS的 所以必须在info.plist中设置ATS
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")

        // 2.创建网络请求
        let request = URLRequest(url: url!)

        // 3.创建管理的Session
        let session = URLSession(configuration: URLSessionConfiguration.default)

        // 4.创建任务
        let task = session.dataTask(with: request) { data, _, error in

            // 任务开始会开启子线程，所以必须回到主线程进行UI操作
            DispatchQueue.main.async {
                let decoder = JSONDecoder()

                do {
                    // json转模型
                    let news = try decoder.decode(NewsModel.self, from: data!)

                    // 如果没有错误信息
                    if 0 == news.error_code {
                        self.tableViewData = news.result?.data

                        // 刷新表格
                        self.newsTableView?.reloadData()

                        if self.refreshControl.isRefreshing {
                            self.refreshControl.endRefreshing()
                        }
                    }

                } catch {
                    print(error)
                }
            }
        }

        // 5.开启任务
        task.resume()
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = tableViewData {
            return data.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCodeTableViewCell

        let dataItem = tableViewData?[indexPath.row]

        // 更改Cell的UI
        cell.configUI(dataItem: dataItem)

        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 设置索引
        selectedIndex = indexPath

        let dataItem = tableViewData?[indexPath.row]

        let detailVC = DetailViewController()

        // 传值
        detailVC.selectedDataItem = dataItem

        navigationController?.pushViewController(detailVC, animated: true)
    }
}
