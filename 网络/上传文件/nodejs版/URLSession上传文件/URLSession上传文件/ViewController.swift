//
//  ViewController.swift
//  URLSession上传文件
//
//  Created by 杨帆 on 2019/1/25.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let YFBoundary = "AnHuiWuHuYungFan"

    @IBOutlet var uploadInfo: UILabel!

    @IBOutlet var uploadProgress: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        upload()
    }

    func upload() {
        // 1、确定URL
        let url = URL(string: "http://服务器ip地址:3000/upload")

        // 2、确定请求
        var request = URLRequest(url: url!)

        // 3、设置请求头
        let head = "multipart/form-data;boundary=\(YFBoundary)"

        request.setValue(head, forHTTPHeaderField: "Content-Type")

        // 4、设置请求方式
        request.httpMethod = "POST"

        // 5、创建NSURLSession
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)

        // 6、获取上传的数据（按照固定格式拼接）
        var data = Data()

        let header = headerString(mimeType: "image/png", uploadFile: "wall.png")

        data.append(header.data(using: .utf8)!)

        data.append(uploadData())

        let tailer = tailerString()

        data.append(tailer.data(using: .utf8)!)

        // 7、创建上传任务 上传的数据来自getData方法
        let task = session.uploadTask(with: request, from: data) { _, _, error in

            // 上传完毕后
            if error != nil {
                print(error!)

            } else {
                print(Thread.current)

                DispatchQueue.main.async {
                    self.uploadInfo.text = "上传成功"
                }

                // self.uploadInfo.text = "上传成功"
            }
        }
        // 8、执行上传任务
        task.resume()
    }

    // 开始标记
    func headerString(mimeType: String, uploadFile: String) -> String {
        var data = String()

        // --Boundary\r\n
        data.append("--" + YFBoundary + "\r\n")

        // 文件参数名 Content-Disposition: form-data; name="file"; filename="wall.jpg"\r\n
        data.append("Content-Disposition:form-data; name=\"file\";filename=\"\(uploadFile)\"\r\n")

        // Content-Type 上传文件的类型 MIME\r\n\r\n
        data.append("Content-Type:\(mimeType)\r\n\r\n")

        return data
    }

    // 结束标记
    func tailerString() -> String {
        // \r\n--Boundary--\r\n
        return "\r\n--" + YFBoundary + "--\r\n"
    }

    func uploadData() -> Data {
        let image = UIImage(named: "wall.png")

        let imageData = image!.pngData()

        return imageData!
    }
}

extension ViewController: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        uploadProgress.setProgress(Float(totalBytesSent) / Float(totalBytesExpectedToSend), animated: true)

        print("Delegate \(Thread.current)")
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print(error)
        }
    }
}
