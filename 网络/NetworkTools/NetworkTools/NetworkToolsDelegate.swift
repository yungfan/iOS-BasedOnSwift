//
//  NetworkToolsDelegate.swift
//  NetworkTools
//
//  Created by 杨帆 on 2019/1/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

//将URLSessionDataDelegate封装起来，这样每个不同的任务可以有不同的实现
typealias HTTPSessionDataTaskCompletionBlock =  ( _  response: URLResponse? ,  _  responseObject: Any?, _ error: Error?) -> ()

class NetworkToolsDelegate: NSObject, URLSessionDataDelegate {

    
    var taskCompletionHandler: HTTPSessionDataTaskCompletionBlock?
    
    var buffer: Data = Data()
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        //缓存接收到的数据
        self.buffer.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
        let responseStr = String(data: self.buffer, encoding: String.Encoding.utf8)
        
        //print("didReceive data =\(String(describing: responseStr))")
        
        if let callback = taskCompletionHandler {
            
            callback(task.response,responseStr,error)
        }
        //释放 session 资源
        session.finishTasksAndInvalidate()
    }
    
}
