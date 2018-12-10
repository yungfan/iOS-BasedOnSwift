//
//  ViewController.swift
//  数据存取的目录
//
//  Created by 杨帆 on 2018/12/10.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(Bundle.main.bundlePath)
        
        print(Bundle.main.path(forResource: "Info", ofType: "plist")!)
        
        //沙盒的入口
        print(NSHomeDirectory())
        //tmp文件夹
        print(NSTemporaryDirectory())
        
    
        //Documents文件夹
        let documentDir =   NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        print(documentDir!)
        
        
        //Library文件夹
        let libraryDir =   NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
        
        print(libraryDir!)
        
    }


}

