//
//  ViewController.swift
//  SQLite操作
//
//  Created by 杨帆 on 2018/12/21.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dbTools:DBTools?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func createDB(_ sender: Any) {
        
        dbTools = DBTools()
    }
    
    @IBAction func createTab(_ sender: Any) {
        
        dbTools?.createTable()
    }
    
    
    @IBAction func insertData(_ sender: Any) {
        
        let p = Person(name: "zhangsan", phone: "18888888888", address: "AnHuiWuhu")
        
        dbTools?.insertPerson(person: p)
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        dbTools?.deletePerson(name: "zhangsan")
    }
    
    
    @IBAction func updateData(_ sender: Any) {
        
        let p = Person(name: "zhangsan", phone: "17777777777", address: "JiangSuNanJing")
        
        dbTools?.updatePerson(person: p)
    }
    
    
    @IBAction func selectData(_ sender: Any) {
        
        let person = dbTools?.selectPerson()
        
        if let person = person {
            for p in person {
                print(p)
            }
        }
        
    }
 
}

