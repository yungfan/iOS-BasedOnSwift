//
//  ViewController.swift
//  UIAlertController的使用
//
//  Created by 杨帆 on 2018/11/19.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(_ sender: Any) {
        
      let alertVC =   UIAlertController(title: "温馨提示", message: "天气转凉，大家注意保暖，小心感冒", preferredStyle: .alert)
      
      let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            print("点击了ok")
        }
       
      let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("点击了cancel")
        }
        
       alertVC.addAction(ok)
        
       alertVC.addAction(cancel)
        
       self.present(alertVC, animated: true, completion: nil)
        
    }
    
    @IBAction func showSheet(_ sender: Any) {
        
        
        let alertVC =   UIAlertController(title: "选择头像", message: "请选择合适的方式来处理", preferredStyle: .actionSheet)
        
        let ok = UIAlertAction(title: "相册", style: .default) { (action) in
            print("用户选择了相册")
        }
        
        let des = UIAlertAction(title: "拍照", style: .destructive) { (action) in
            print("用户选择了拍照")
        }
        
        let cancel = UIAlertAction(title: "取消", style: .cancel) { (action) in
            print("点击了取消")
        }
        
        alertVC.addAction(ok)
        
        alertVC.addAction(des)
        
        alertVC.addAction(cancel)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
}

