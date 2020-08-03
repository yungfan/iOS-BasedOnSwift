//
//  SnapKitViewController.swift
//  一个完整的网络请求案例
//
//  Created by stu1 on 2019/1/11.
//  Copyright © 2019年 ABC. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {
    
    lazy var redView = UIView()
    
    lazy var blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redView.backgroundColor = UIColor.red
        
        blueView.backgroundColor = UIColor.blue
        
        self.view.addSubview(redView)
        
        /**
        
        self.view.addSubview(blueView)
        
        redView.snp.makeConstraints { (make) in
            
            make.width.height.equalTo(100)
            
            //make.center.equalTo(self.view)
            
            make.right.bottom.equalTo(-10)
            
        }
        
        blueView.snp.makeConstraints { (make) in
            
            make.height.width.bottom.equalTo(redView)
            
            make.right.equalTo(redView.snp.left).offset(-10)
            
            
        }
        */
        
        redView.snp.makeConstraints { (make) in
            
//            make.top.equalTo(self.view).offset(20)
//            make.left.equalTo(self.view).offset(20)
//            make.bottom.equalTo(self.view).offset(-20)
//            make.right.equalTo(self.view).offset(-20)
            
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            
        }
   
    }

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        redView.snp.updateConstraints { (make) in
            
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 100, left: 100, bottom: 100, right:100))

        }
        
        
        //必须写在外面才会产生动画
        UIView.animate(withDuration: 1.5, animations: {
            
            self.view.layoutIfNeeded()
            
        })
        
    }
}
