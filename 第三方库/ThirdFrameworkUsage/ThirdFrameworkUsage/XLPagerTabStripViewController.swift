//
//  XLPagerTabStripViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class XLPagerTabStripViewController: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        settings.style.selectedBarHeight = 5
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.black
        settings.style.buttonBarItemBackgroundColor = UIColor.cyan
        settings.style.selectedBarBackgroundColor = UIColor.orange

        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonBarView.frame = CGRect(x: 0, y: 88, width: buttonBarView.frame.width, height: buttonBarView.frame.height)
    }

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [XLPagerTabStripVCOne(), XLPagerTabStripVCTwo()]
    }
}
