//
//  ViewController.swift
//  NetworkTools
//
//  Created by 杨帆 on 2019/1/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        getTest()
    }

    func getTest() {
        let networkTools = NetworkTools()

        let urlString = "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd"

        let url = URL(string: urlString)

        networkTools.get(url!, parameters: nil, success: { (responseObject: Any?) in

            print("post responseObject =\(responseObject!) ")

        }) { (_: Error?) -> Void in
        }
    }

    func postTest() {
        let networkTools = NetworkTools()

        let urlString = "http://v.juhe.cn/toutiao/index"

        let url = URL(string: urlString)

        let params = "type=top&key=d1287290b45a69656de361382bc56dcd"

        networkTools.post(url!, parameters: params, success: { (responseObject: Any?) in

            print("post responseObject =\(responseObject!) ")

        }) { (_: Error?) -> Void in
        }
    }

    func postDictionaryTest() {
        let networkTools = NetworkTools()

        let urlString = "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd"

        let url = URL(string: urlString)

        let params = ["type": "top", "key": "d1287290b45a69656de361382bc56dcd"]

        networkTools.post(url!, parameters: params, success: { (responseObject: Any?) in

            print("post Dictionary responseObject =\(responseObject!) ")

        }) { (_: Error?) -> Void in
        }
    }
}
