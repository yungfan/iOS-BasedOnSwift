//
//  ViewController.swift
//  plist文件的读写
//
//  Created by 杨帆 on 2018/12/10.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let path = Bundle.main.path(forResource: "cityData", ofType: "plist")

        if let path = path {
            let root = NSDictionary(contentsOfFile: path)

            print(root!.allKeys)

            print(root!.allKeys[31])

            let cities = root![root!.allKeys[31]] as! NSArray

            print(cities)

            let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first

            let filePath = documentDir! + "/123.plist"

            cities.write(toFile: filePath, atomically: true)
        }
    }
}
