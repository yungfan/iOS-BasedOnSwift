//
//  ViewController.swift
//  JSON解析之JSONSerialization
//
//  Created by 杨帆 on 2019/3/23.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getWheather()
    }
    
    
    
    func getWheather(){
        
        //聚合数据API，服务器返回的数据示例已经放在工程里面了——weather.json
        let urlString = "http://v.juhe.cn/weather/index?format=2&cityname=芜湖&key=2d2e6e836dbdffac56814bc4d449d507"
        
        //由于API中有中文，必须转码
        let encodeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        print(encodeUrlString!)
        
        //创建url
        let url = URL(string: encodeUrlString!)
        
        //创建request
        let request = URLRequest(url: url!)
        
        //创建session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        //创建task
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                
                print("网络访问出现错误")
                
            }
                
            else {
                
                //针对服务器返回的数据，也可以用JSONSerialization进行JSON数据的解析，针对希望只取部分数据的情况可以使用
                
                //把Data对象转换回JSON对象，这时候需要看返回的json数据是什么格式，就as转换成具体的格式，这里转成字典
                let jsonData = try? JSONSerialization.jsonObject(with: data!,
                                                                 options:.allowFragments) as! [String: Any]
                
                
                //然后层层递进取到未来7天天气的数组，这里需要一步一步as转换
                let future = (jsonData?["result"] as! [String: Any])["future"] as! [Any]
                
                //遍历天气
                for w in future {
                    
                    //天气里面又是一个个的字典
                    let weather = w as! [String: Any]
                    
                    //获取具体的天气信息
                    print(weather["temperature"]!)
                    
                }
            }
            
        }
        
        //启动任务
        task.resume()
        
    }
}




