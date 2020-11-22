//
//  DetailViewController.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    // 选中条目
    var selectedDataItem: DataItem!

    // WKWebView
    var webView: WKWebView!

    // UIProgressView
    var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        // 为了测试使用
        selectedDataItem.author_name = "YungFan"
    }

    fileprivate func setupUI() {
        title = selectedDataItem.title

        // WKWebView
        let webView = WKWebView(frame: view.bounds)

        webView.scrollView.showsVerticalScrollIndicator = false

        view.addSubview(webView)

        // 放在前面 否则下面访问的时候为nil
        self.webView = webView

        // UIProgressView
        // UIProgressView后于WKWebView，否则被遮盖
        // 主要是y值要根据不同机型计算一下
        progressView = UIProgressView(frame: CGRect(x: 0, y: 89, width: view.frame.size.width, height: 0))

        view.addSubview(progressView)

        // KVO观察estimatedProgress
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)

        // 1. 创建一个网页的地址
        let url = URL(string: selectedDataItem.url)

        // 2. 通过网址创建一个请求
        if let url = url {
            let request = URLRequest(url: url)

            // 3. 加载请求
            webView.load(request)
        }
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            // 根据观察的进度来设置进度条的值
            let progress = Float(webView.estimatedProgress)

            progressView.setProgress(progress, animated: true)

            // 加载完成
            if progress >= 1.0 {
                progressView.alpha = 0.0

                progressView.setProgress(0.0, animated: true)
            }
        }
    }

    deinit {
        print("88")

        // 这里不移除观察者不会引起释放不了的问题
    }
}
