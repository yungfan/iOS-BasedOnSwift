//
//  ViewController.swift
//  URLSession-get和post
//
//  Created by 杨帆 on 2019/1/26.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        get()
    }

    /**
       1.创建一个URL对象，设置请求资源的路径
       2.通过URL创建一个URLRequest对象，设置请求头和请求体
       3.定义URLSessionConfiguration用于创建URLSession时设置工作模式和网络设置
       4.创建URLSession
       5.构建一个URLSessionTask，共有三种任务
           URLSessionDataTask：请求数据的Task
           URLSessionUploadTask：上传用的Task
           URLSessionDownloadTask：下载用的Task
       6.启动任务
       7.使用Delegate或者CompletionHandler处理任务执行过程的事件
     */
    func post() {
        let url = URL(string: "http://v.juhe.cn/toutiao/index")

        var urlRequest = URLRequest(url: url!)

        urlRequest.httpMethod = "POST"

        let params = "type=top&key=d1287290b45a69656de361382bc56dcd"

        urlRequest.httpBody = params.data(using: .utf8)

        let config = URLSessionConfiguration.default

        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        /**
         let task = session.dataTask(with: urlRequest) { (data, response, error) in

             if error != nil {

                 print(error!)
             }

             else {

                 print(Thread.current)

                 print(response!)

                 if let data = data{

                     print(String(data: data, encoding: .utf8)!)

                 }
             }

         } */

        let task = session.dataTask(with: urlRequest)

        task.resume()
    }

    func get() {
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")

        let urlRequest = URLRequest(url: url!)

        let config = URLSessionConfiguration.default

        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) { data, response, error in

            if error != nil {
                print(error!)
            } else {
                print(Thread.current)

                print(response!)

                if let data = data {
                    print(String(data: data, encoding: .utf8)!)
                }
            }
        }

        task.resume()
    }
}

extension ViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        completionHandler(URLSession.ResponseDisposition.allow)
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("Delegate\(Thread.current)")

        let result = String(data: data, encoding: .utf8)

        if let result = result {
            print(result)
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print(error)
        } else {
            print("=======成功=======")
        }
    }
}
