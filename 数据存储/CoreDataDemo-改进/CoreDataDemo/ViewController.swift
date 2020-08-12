//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 杨帆 on 2020/8/3.
//

import UIKit

class ViewController: UIViewController {
    
    
    let stuOp = StudentOp()

    @IBAction func insert(_ sender: Any) {
        stuOp.insert()
    }
    
    @IBAction func query(_ sender: Any) {
        stuOp.queryAll()
    }
    
    @IBAction func update(_ sender: Any) {
        stuOp.update()
    }
    
    
    @IBAction func del(_ sender: Any) {
        stuOp.delete()
    }
    
    
    @IBAction func clear(_ sender: Any) {
        stuOp.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
