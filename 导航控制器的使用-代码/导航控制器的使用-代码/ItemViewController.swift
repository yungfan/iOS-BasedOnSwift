//
//  ItemViewController.swift
//  导航控制器的使用-代码
//
//  Created by 杨帆 on 2018/11/27.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Item"
        
        
        self.navigationItem.rightBarButtonItem =   UIBarButtonItem(title:  "详情", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightClick))
        
    }
    
    
    @objc func rightClick(button:UIBarButtonItem){
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}
