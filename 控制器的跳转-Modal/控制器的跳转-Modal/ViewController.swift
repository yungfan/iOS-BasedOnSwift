//
//  ViewController.swift
//  控制器的跳转-Modal
//
//  Created by 杨帆 on 2018/11/19.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func gotoGreenVC(_ sender: Any) {
        //原界面 -> 目的界面
        
        //构造想跳转的那个界面（目的界面）
        let desVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc")
        
        //Modal方式的跳转
        self.present(desVC, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //让连线产生作用
        self.performSegue(withIdentifier: "abcd", sender: nil)
    }

}

