//
//  ViewController.swift
//  NSUserDefaults-记住密码
//
//  Created by 杨帆 on 2018/12/11.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var swit: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let name = UserDefaults.standard.string(forKey: "name")
        let pwd = UserDefaults.standard.string(forKey: "pwd")
        let isOn = UserDefaults.standard.bool(forKey: "isOn")

        username.text = name
        password.text = pwd
        swit.isOn = isOn
    }

    @IBAction func login(_ sender: Any) {
        print("密码已经记住")
    }

    @IBAction func remember(_ sender: Any) {
        let swit = sender as! UISwitch

        if swit.isOn {
            let name = username.text
            let pwd = password.text

            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(pwd, forKey: "pwd")
            UserDefaults.standard.set(true, forKey: "isOn")

            UserDefaults.standard.synchronize()
        }
    }
}
