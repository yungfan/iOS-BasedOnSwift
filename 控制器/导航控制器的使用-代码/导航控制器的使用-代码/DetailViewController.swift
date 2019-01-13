//
//  DetailViewController.swift
//  导航控制器的使用-代码
//
//  Created by 杨帆 on 2018/11/27.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationItem.title = "Detail"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //三种返回样式
        //返回上个界面
        //self.navigationController?.popViewController(animated: true)
        
        //返回导航控制器的根控制器
        //self.navigationController?.popToRootViewController(animated: true)
        
        //返回导航控制器中的任意控制器 注意方式是从children这个数组中取得
        self.navigationController?.popToViewController((self.navigationController?.children[1])!, animated: true)
        
    }

}
