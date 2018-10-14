//
//  ViewController.swift
//  UILabel、UITextField、UIButton案例
//
//  Created by 杨帆 on 2018/10/14.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginAA(_ sender: Any) {
        
        
        let uname = username.text
        let upwd = password.text
        
        print("用户名为：\(uname!), 密码为：\(upwd!)")
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    //触摸屏幕方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //退键盘的方式之一
        self.view.endEditing(true)
    }
}

