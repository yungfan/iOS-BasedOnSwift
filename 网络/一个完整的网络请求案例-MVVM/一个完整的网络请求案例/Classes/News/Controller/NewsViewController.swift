//
//  NewsViewController.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    //VM：NewsViewModel
    var newsViewModel:NewsViewModel = NewsViewModel()
    //UITableView
    var newsTableView: UITableView!
    //刷新控件
    var refreshControl: UIRefreshControl!
    //点击的时候的索引
    var selectedIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI
        setupUI()
        
        //获取新闻
        getNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //当重新进改界面的时候 刷新选中行的数据 这里仅仅改变的是作者
        if let selectedIndex = self.selectedIndex {
            
            self.newsTableView.reloadRows(at: [selectedIndex], with: .none)
            
        }
    }
    
}

extension NewsViewController {
    
    fileprivate func setupUI(){
        
        self.title = "YF 新闻"
        
        let tab = UITableView(frame: self.view.bounds)
        
        tab.showsVerticalScrollIndicator = false
        
        tab.delegate = self
        
        tab.dataSource = self
        
        //XIB方式使用Cell
        let nib = UINib(nibName: "NewsCellTableViewCell", bundle: nil)
        
        tab.register(nib, forCellReuseIdentifier: "newsCell")
        
        //自动布局计算行高
        
        tab.estimatedRowHeight = 135.0
        
        tab.rowHeight = UITableView.automaticDimension
        
        //刷新控件
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(getNews), for: .valueChanged)
        
        self.refreshControl = refreshControl
        
        tab.refreshControl = refreshControl
        
        self.view.addSubview(tab)
        
        self.newsTableView = tab
        
        
    }
    
    
    @objc fileprivate func getNews(){
        
        //调用VM完成数据的请求
        newsViewModel.requestData {
            
            self.newsTableView.reloadData()
            
            if (self.refreshControl.isRefreshing) {
                
                self.refreshControl.endRefreshing()
            }
            
        }
        
    }
    
}

extension NewsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = self.newsViewModel.tableViewData {
            
            return data.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCellTableViewCell
        
        let dataItem = self.newsViewModel.tableViewData?[indexPath.row]
        
        //更改Cell的UI
        cell.configUI(dataItem: dataItem)
        
        return cell
    }
    
}


extension NewsViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //设置索引
        self.selectedIndex = indexPath
        
        let dataItem = self.self.newsViewModel.tableViewData?[indexPath.row]
        
        let detailVC = DetailViewController()
        
        //传值
        detailVC.selectedDataItem =  dataItem
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
}
