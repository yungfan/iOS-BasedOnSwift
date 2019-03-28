//
//  ViewController.swift
//  下划线UITextField
//
//  Created by 杨帆 on 2019/3/28.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let textField = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 25))
        
        //弄一个和输入框一样宽的View
        let line = UIView(frame: CGRect(x: 0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 0.5))
        
        line.backgroundColor = UIColor.red
        
        //关键是添加到输入框中去
        textField.addSubview(line)
        
        self.view.addSubview(textField)
        
    }


}

