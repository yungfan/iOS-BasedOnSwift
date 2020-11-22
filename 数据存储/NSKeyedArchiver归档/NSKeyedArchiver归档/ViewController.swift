//
//  ViewController.swift
//  NSKeyedArchiver归档
//
//  Created by 杨帆 on 2018/12/12.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data: Data!
    var origin: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func archiver(_ sender: Any) {
        let p = Person()
        p.age = 20
        p.name = "zhangsan"

        do {
            try data = NSKeyedArchiver.archivedData(withRootObject: p, requiringSecureCoding: true)
        } catch {
            print(error)
        }
    }

    @IBAction func unarchiver(_ sender: Any) {
        do {
            try origin = NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)

            print(origin!.age!)
            print(origin!.name!)

        } catch {
            print(error)
        }
    }
}
