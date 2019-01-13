//
//  RootTabBarController.swift
//  微信界面-纯代码
//
//  Created by 杨帆 on 2018/12/3.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
         addChildViewController(vcName: "WechatViewController", title: "微信", image: "tabbar_mainframe", selectedImage: "tabbar_mainframeHL")
         addChildViewController(vcName: "ContactsViewController", title: "联系人", image: "tabbar_contacts", selectedImage: "tabbar_contactsHL")
         addChildViewController(vcName: "FoundViewController", title: "发现", image: "tabbar_discover", selectedImage: "tabbar_discoverHL")
         addChildViewController(vcName: "MeViewController", title: "我", image: "tabbar_me", selectedImage: "tabbar_meHL")
        
      
        print(WechatViewController())
    }
    
    func addChildViewController(vcName:String, title:String, image:String, selectedImage:String) {
        //1. 创建控制器
        let wechat = stringToVC(vcName: vcName)!
        wechat.navigationItem.title = title
        wechat.tabBarItem.title = title
        wechat.tabBarItem.image = UIImage(named: image)
        wechat.tabBarItem.selectedImage = UIImage(named: selectedImage)
        wechat.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 34.0/255.0, green: 172.0/255.0, blue: 37.0/255.0, alpha: 1.0)], for: UIControl.State.highlighted)
        // 2. 嵌套导航控制器
        let nvc = RootNavigationViewController(rootViewController: wechat)
        nvc.navigationBar.barTintColor = UIColor(displayP3Red: 51.0/255.0, green: 49.0/255.0, blue: 54.0/255.0, alpha: 1.0)
        nvc.navigationBar.tintColor = UIColor.white
        nvc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // 3. 添加到标签栏控制器
        self.addChild(nvc)
    }
    
    //创建一个函数来将控制器的名字转成具体的类
    func stringToVC(vcName:String) -> UIViewController? {
        
        //获取命名空间
        guard let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有命名空间")
            return nil
        }
        
        //拼接完整的类
        guard let vcClass = NSClassFromString(namespace + "." + vcName) else {
            print("拼接失败")
            return nil
        }
        
        //转换成UIViewController
        guard let vcType = vcClass as? UIViewController.Type else {
            print("类型转换失败")
            return nil
        }
        
        //根据类型创建对应的控制器
        let vc = vcType.init()

        return vc
    }
}
