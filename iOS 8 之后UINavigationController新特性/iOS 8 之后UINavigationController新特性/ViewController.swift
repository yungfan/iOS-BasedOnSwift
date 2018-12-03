//
//  ViewController.swift
//  iOS 8 之后UINavigationController新特性
//
//  Created by 杨帆 on 2018/12/3.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.navigationController?.hidesBarsWhenVerticallyCompact = true
        
        
        //self.navigationController?.hidesBarsOnTap = true
        
        //self.navigationController?.hidesBarsWhenKeyboardAppears = true
        
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}



