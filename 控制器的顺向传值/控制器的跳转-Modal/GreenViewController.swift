//
//  GreenViewController.swift
//  控制器的跳转-Modal
//
//  Created by 杨帆 on 2018/11/19.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    //声明一个属性 用来接受传过来的值
    var passedValue:String?

    @IBOutlet weak var infoLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.infoLb.text = passedValue
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
