//
//  ViewController.swift
//  WKWebView加载网页
//
//  Created by 杨帆 on 2020/12/25.
//

import SafariServices
import UIKit
import WebKit

class ViewController: UIViewController {
    // 只需要对中文单独处理，不需要针对整个url
    let name = "阿楚姑娘".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

    fileprivate func method1() {
        // 创建URL
        let url = URL(string: "https://music.163.com/#/search/m/?s=\(name)&type=1")
        // 创建URLRequest
        let request = URLRequest(url: url!)
        // 创建WKWebView
        let webView = WKWebView(frame: UIScreen.main.bounds)
        // 加载网页
        webView.load(request)

        view.addSubview(webView)
    }

    fileprivate func method2() {
        // 创建URL
        let url = URL(string: "https://music.163.com/#/search/m/?s=\(name)&type=1")
        // 创建浏览器控制器
        let sf = SFSafariViewController(url: url!)
        // 弹出新控制器显示
        present(sf, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // method1()
        method2()
    }
}
