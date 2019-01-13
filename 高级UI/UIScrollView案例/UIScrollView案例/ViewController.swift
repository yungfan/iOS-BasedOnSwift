//
//  ViewController.swift
//  UIScrollView案例
//
//  Created by 杨帆 on 2018/10/18.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    //frame
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let img = UIImage(named: "img.jpg")
        
        self.imageView = UIImageView(image: img)
        
        self.scrollView.addSubview(self.imageView!)
        
        //conentSize:内容的大小 CGSize 决定了滚动的范围
        
        self.scrollView.contentSize = CGSize(width: 3264, height: 2448)
        
        //设置代理
        self.scrollView.delegate = self
        
        //contentOffset:内容的偏离 CGPoint
        
        //contentInset
        
        self.scrollView.contentInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        
    }


    @IBAction func go(_ sender: Any) {
        
        let previousContentOffset = self.scrollView.contentOffset
        
        let newContentOffset = CGPoint(x: previousContentOffset.x + 50.0, y: previousContentOffset.y + 50.0)
        
        self.scrollView.setContentOffset(newContentOffset, animated: true)
        
    }
    
    //UIScrollViewDelegate
    
    //只要滚动就会调用
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    //普通拖拽就会调用
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    //猛一拖拽就会调用
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
    
    //缩放的具体是什么控件
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.imageView
    }
}

