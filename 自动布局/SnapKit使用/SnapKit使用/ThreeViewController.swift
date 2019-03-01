//
//  ThreeViewController.swift
//  SnapKit使用
//
//  Created by 杨帆 on 2019/3/1.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import SnapKit


//更新、移除、重做、动画
class ThreeViewController: UIViewController {
    
    lazy var redBox = UIView()
    
    //约束
    var constraint:Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        test()
    }
    
    
    func test(){
        
        redBox.backgroundColor = UIColor.red
        self.view.addSubview(redBox)
        
        
        redBox.snp.makeConstraints { (make) in
            
            //约束为宽高，这句话有两个作用 1.设置约束 2.约束值存储
            self.constraint =  make.width.height.equalTo(100).constraint
            
            make.center.equalTo(self.view)

        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //1.移除约束
        //deactivate() 方法把约束给移除，方块消失（长宽变成0,0）
        //self.constraint?.deactivate()
        
        //2.修改约束
        //update() 方法把约束更新为50（长宽变成50,50）
        //self.constraint?.update(offset: 50)
        
        //3.重做约束
//        redBox.snp.remakeConstraints { (make) -> Void in
//
//            make.width.height.equalTo(self.view).multipliedBy(0.5)
//            make.center.equalTo(self.view)
//        }
        
        //4.动画
        self.constraint?.update(offset: 50)
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }

}
