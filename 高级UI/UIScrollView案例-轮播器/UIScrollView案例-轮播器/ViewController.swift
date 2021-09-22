//
//  ViewController.swift
//  UIScrollView案例-轮播器
//
//  Created by 杨帆 on 2018/10/19.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let bannerW = UIScreen.main.bounds.size.width

    let bannerH = 260

    var banner: UIScrollView!

    var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupBanner()

        setupPageControl()
    }

    func setupBanner() {
        banner = UIScrollView(frame: CGRect(x: 0, y: 0, width: Int(bannerW), height: bannerH))

        // 是否显示滚动条
        banner.showsHorizontalScrollIndicator = false
        // 是否需要弹簧效果
        banner.bounces = false
        // 是否分页
        banner.isPagingEnabled = true

        banner.delegate = self

        // 添加图片
        for i in 0 ... 4 {
            let w = Int(bannerW) * i

            let img = UIImageView(frame: CGRect(x: w, y: 0, width: Int(bannerW), height: bannerH))

            img.image = UIImage(named: "img_\(i)")

            banner.addSubview(img)
        }

        banner.contentSize = CGSize(width: bannerW * 5.0, height: 0)

        view.addSubview(banner)
    }

    func setupPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 20))

        // 指示器的颜色
        pageControl.pageIndicatorTintColor = UIColor.red

        // 当前页的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.cyan

        // 总页数
        pageControl.numberOfPages = 5

        pageControl.center = CGPoint(x: bannerW * 0.5, y: 240.0)
        
        pageControl.hidesForSinglePage = true

        // UIPageControl点击时只翻一页解决办法
        var index = 0
        
        // UIPageControl默认的层次结构，找到最里面的subview
        for view in pageControl.subviews[0].subviews[0].subviews {
            // 打开交互
            view.isUserInteractionEnabled = true
            
            // 创建按钮
            let dotBtn = UIButton(type: .custom)
            
            dotBtn.frame = view.bounds
            
            // tag与index绑定
            dotBtn.tag = index
            
            dotBtn.backgroundColor = .clear
            
            // 点击事件
            dotBtn.addTarget(self, action: #selector(dotBtnClick), for: .touchUpInside)
            
            view.addSubview(dotBtn)
            
            index += 1
        }

        // 监听事件
        pageControl.addTarget(self, action: #selector(pageIndicate), for: .valueChanged)

        view.addSubview(pageControl)
    }
    
    @objc func dotBtnClick(button: UIButton) {
        let index = button.tag
        
        pageControl.currentPage = index

        banner.setContentOffset(CGPoint(x: Int(bannerW) * index, y: 0), animated: true)
    }
    

    @objc func pageIndicate(pageControl: UIPageControl) {
        let currentIndex = pageControl.currentPage

        banner.setContentOffset(CGPoint(x: Int(bannerW) * currentIndex, y: 0), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 获取contentOffset
        let contentOffset = scrollView.contentOffset

        // 获取索引
        let index = contentOffset.x / bannerW

        pageControl.currentPage = Int(index)
    }
}
