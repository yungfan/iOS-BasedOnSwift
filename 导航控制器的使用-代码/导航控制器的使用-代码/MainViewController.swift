//
//  MainViewController.swift
//  导航控制器的使用-代码
//
//  Created by 杨帆 on 2018/11/27.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Main"
        
        
        self.navigationItem.rightBarButtonItem =   UIBarButtonItem(title:  "列表", style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightClick))
    
    }

    
    @objc func rightClick(button:UIBarButtonItem){
        
        let listVC = ListViewController()
        
        self.navigationController?.pushViewController(listVC, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
