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
        // 原界面 -> 目的界面

        // 构造想跳转的那个界面（目的界面）
        let desVC: GreenViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abc") as! GreenViewController

        desVC.passedValue = "手动present传过来的值"

        // Modal方式的跳转
        present(desVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 让连线产生作用
        performSegue(withIdentifier: "abcd", sender: nil)
    }

    // self.performSegue以调用就会立马调用这个方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "abcd" {
            let greenVC: GreenViewController = segue.destination as! GreenViewController

            greenVC.passedValue = "这是segue跳转方式传过来的值"
        }
    }
}
