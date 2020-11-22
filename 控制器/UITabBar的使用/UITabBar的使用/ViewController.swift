//
//  ViewController.swift
//  UITabBar的使用
//
//  Created by 杨帆 on 2018/11/28.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tabBar.selectedItem = tabBar.items?[1]

        tabBar.items?.last?.badgeValue = "4"

        tabBar.delegate = self
    }
}

extension ViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title!)

        item.badgeValue = nil
    }
}
