//
//  FSPagerViewViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import FSPagerView

class FSPagerViewViewController: UIViewController {
    var pagerView: FSPagerView = FSPagerView()
    var pageControl: FSPageControl = FSPageControl()
    
    fileprivate let imageNames = ["img_0","img_1","img_2","img_3","img_4"]
    fileprivate let imageTexts = ["img_0","img_1","img_2","img_3","img_4"]
    fileprivate var numberOfItems = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.pagerView.frame = CGRect(x: 0, y: 88, width: self.view.bounds.size.width, height: 250)
        
        self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.pagerView.itemSize = FSPagerView.automaticSize
        self.pagerView.automaticSlidingInterval = 1.0
        self.pagerView.isInfinite = true
        self.pagerView.dataSource = self
        self.pagerView.delegate = self
        self.view.addSubview(self.pagerView)
        
        self.pageControl.frame = CGRect(x: self.view.bounds.size.width * 0.5 - 50, y: 200 + 88, width: 100, height: 40)
        self.pageControl.numberOfPages = self.imageNames.count
        self.pageControl.contentHorizontalAlignment = .center
        self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.view.addSubview(self.pageControl)
    }
    
    
}

extension FSPagerViewViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        return numberOfItems
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        //cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        //cell.textLabel?.text = self.imageTexts[index]
        return cell
        
    }
    
    
    
}

extension FSPagerViewViewController: FSPagerViewDelegate {
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
}
