//
//  NewsViewModel.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/4/1.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit


//引入ViewModel 在这里完成网络数据的请求
class NewsViewModel {
    
    //这个数据是给TableView做数据源
    var tableViewData:[DataItem]?
    
    
    // 请求推荐数据
    func requestData(_ finishCallback : @escaping () -> ()) {
        
        //1.创建网络URL
        //用的是聚合数据的URL
        //由于不是HTTPS的 所以必须在info.plist中设置ATS
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")
        
        //2.创建网络请求
        let request = URLRequest(url: url!)
        
        //3.创建管理的Session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        //4.创建任务
        let task = session.dataTask(with: request) { (data, response, error) in
            
            //任务开始会开启子线程，所以必须回到主线程进行UI操作
            DispatchQueue.main.async {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    //json转模型
                    let news =  try decoder.decode(NewsModel.self, from: data!)
                    
                    //如果没有错误信息
                    if 0 == news.error_code {
                        
                        self.tableViewData = news.result?.data
                        
                        //调用闭包
                        finishCallback()
                        
                    }
                    
                } catch  {
                    
                    print(error)
                }
                
            }
            
        }
        
        
        //5.开启任务
        task.resume()
    }
    
}
