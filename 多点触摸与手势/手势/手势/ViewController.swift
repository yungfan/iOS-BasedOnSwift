//
//  ViewController.swift
//  手势
//
//  Created by stu1 on 2019/1/13.
//  Copyright © 2019年 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
    }

    
    fileprivate func setupUI(){
        
        //保证可交互 否则无法实现
        self.lb.isUserInteractionEnabled = true
        self.img.isUserInteractionEnabled = true
        
        setGestureRecognizer()
    }
    
    fileprivate func setGestureRecognizer(){
        
        //单击事件
        let lbTap = UITapGestureRecognizer(target: self, action: #selector(lbClick))
        
        self.lb.addGestureRecognizer(lbTap)
        
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(imgClick))
        
        self.img.addGestureRecognizer(imgTap)
    }
    

    
    @objc fileprivate func lbClick(){
        
        print(#function)
        
    }
    
    
    @objc fileprivate func imgClick(){
        
        print(#function)
        
    }
}

