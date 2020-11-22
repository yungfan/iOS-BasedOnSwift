//
//  XLPagerTabStripVCOne.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class XLPagerTabStripVCOne: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
    }
}

extension XLPagerTabStripVCOne: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "头条")
    }
}
