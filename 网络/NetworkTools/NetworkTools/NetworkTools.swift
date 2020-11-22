//
//  NetworkTools.swift
//  NetworkTools
//
//  Created by 杨帆 on 2019/1/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class NetworkTools: NSObject {
    // URLSessionConfiguration
    var sessionConfiguration = URLSessionConfiguration.default

    // OperationQueue
    lazy var operationQueue: OperationQueue = {
        let operationQueue = OperationQueue()

        operationQueue.maxConcurrentOperationCount = 1

        return operationQueue
    }()

    // URLSession
    lazy var session: URLSession = {
        URLSession(configuration: self.sessionConfiguration, delegate: self, delegateQueue: self.operationQueue)

    }()

    // 代理缓存，每个请求都对应一个代理
    var taskDelegates = [AnyHashable: NetworkToolsDelegate?]()

    // 资源保护锁，多线程临界资源访问的另外一种方式
    var lock = NSLock()

    func get(_ url: URL, parameters: Any?, success: @escaping (_ responseData: Any?) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        var request: URLRequest

        // get基本上都返回nil 所以不会进行参数的拼接 这样写便于和post看上去一样
        let getStr = formatParas(params: parameters)

        if let params = getStr {
            let baseURLString = url.path + "?" + params

            request = URLRequest(url: URL(string: baseURLString)!)
        } else {
            request = URLRequest(url: url)
        }

        let task = dataTask(with: request, success: success, failure: failure)

        task.resume()
    }

    func post(_ url: URL, parameters: Any?, success: @escaping (_ responseData: Any?) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        var request = URLRequest(url: url)

        request.httpMethod = "POST"

        let postStr = formatParas(params: parameters)

        if let str = postStr {
            let postData = str.data(using: String.Encoding.utf8)!

            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")

            request.httpBody = postData
        }

        let task = dataTask(with: request, success: success, failure: failure)

        task.resume()
    }

    // 参数格式化
    func formatParas(params parameters: Any?) -> String? {
        var postStr: String?

        if parameters is String {
            postStr = parameters as? String
        }

        if parameters is [AnyHashable: Any] {
            let keyValues = parameters as! [AnyHashable: Any]

            var tempStr = String()

            var index = 0

            for (key, obj) in keyValues {
                if index > 0 {
                    tempStr += "&"
                }

                let kv = "\(key)=\(obj)"

                tempStr += kv

                index += 1
            }

            postStr = tempStr
        }

        return postStr
    }

    // 创建任务
    func dataTask(with request: URLRequest, success: @escaping (_ responseData: Any?) -> Void, failure: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask {
        let dataTask = session.dataTask(with: request)

        let completionHandler = { (_: URLResponse?, responseObject: Any?, error: Error?) -> Void in

            if error != nil {
                failure(error)
            } else {
                success(responseObject)
            }
        }

        add(completionHandler, for: dataTask)

        return dataTask
    }

    func add(_ completionHandler: @escaping HTTPSessionDataTaskCompletionBlock, for task: URLSessionDataTask) {
        let sessionDelegate = NetworkToolsDelegate()

        sessionDelegate.taskCompletionHandler = completionHandler

        // 数据加锁
        lock.lock()

        // 代理添加进数组
        taskDelegates[task.taskIdentifier] = sessionDelegate

        // 数据解锁
        lock.unlock()
    }
}

// 代理协议
// 不执行具体的逻辑处理，它仅仅起一个路由功能，根据每个Task 的 identifer 来分发到具体的代理类去执行代理方法
extension NetworkTools: URLSessionDataDelegate {
    // 数据接收
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        // 取出对应的代理
        let sessionDelegate = taskDelegates[dataTask.taskIdentifier]

        // 真正的逻辑交给代理去完成
        if let delegate = sessionDelegate {
            delegate?.urlSession(session, dataTask: dataTask, didReceive: data)
        }
    }

    // 请求完成
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        // 取出对应的代理
        let sessionDelegate = taskDelegates[task.taskIdentifier]

        // 真正的逻辑交给代理去完成
        if let delegate = sessionDelegate {
            delegate?.urlSession(session, task: task, didCompleteWithError: error)
        }
    }
}
