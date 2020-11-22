//
//  ViewController.swift
//  URLSession下载
//
//  Created by 杨帆 on 2019/1/26.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var uploadInfoLb: UILabel!

    @IBOutlet var downloadProgress: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        download()
    }

    func download() {
        let url = URL(string: "http://localhost:8080/AppTestAPI/wall.png")

        let urlRequest = URLRequest(url: url!)

        let config = URLSessionConfiguration.default

        // 代理处理比较好
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)

        let task = session.downloadTask(with: urlRequest)

        task.resume()
    }
}

extension ViewController: URLSessionDownloadDelegate {
    // 计算进度
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        downloadProgress.setProgress(Float(totalBytesWritten / totalBytesExpectedToWrite), animated: true)
    }

    // 下载完成
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(Thread.main)

        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!

        let filePath = docPath + "/123.png"

        print(filePath)

        try? FileManager.default.moveItem(at: location, to: URL(fileURLWithPath: filePath))

        uploadInfoLb.text = "下载成功"
    }
}
