//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 杨帆 on 2020/8/3.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        let stuOp = StudentOp()
        
        //stuOp.deleteAll()
        
        stuOp.delete()
        
        stuOp.printStu()
    }
}
