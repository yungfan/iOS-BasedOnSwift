//
//  ViewController.swift
//  WKWebView案例
//
//  Created by 杨帆 on 2018/10/17.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {
    
    var webView:WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webView = WKWebView(frame: self.view.bounds)
        
        self.view.addSubview(self.webView!)
        
        //self.loadFromWeb()
        
        self.loadFromLoacal()
        
    }
        
        func loadFromWeb(){
            
            
            // 1. 创建一个网页的地址
            let url = URL(string: "https://www.baidu.com")
            
            // 2. 通过网址创建一个请求
            
            if let url = url {
                
                let request = URLRequest(url: url)
                
                // 3. 加载请求
                self.webView?.load(request)
            }
            
        }
    
    func loadFromLoacal(){
        
        
         //1.通过包找到我们的本地html
         let url = Bundle.main.url(forResource: "sample", withExtension: "html")
        
         // 2. 通过url创建一个请求
        
         if let url = url {
            
            let request = URLRequest(url: url)
            
            // 3. 加载请求
            self.webView?.load(request)
        }
    }
    

}

