//
//  CustomTabBarController.swift
//  UITabBarController的使用
//
//  Created by 杨帆 on 2018/12/3.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.delegate  = self
    }
    

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        //item.badgeValue = nil
    }

}

extension CustomTabBarController : UITabBarControllerDelegate{
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        viewController.tabBarItem.badgeValue = nil
        
        viewController.view.backgroundColor = UIColor.red
        
    }
    
}
