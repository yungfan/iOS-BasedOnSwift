//
//  ViewController.swift
//  手势识别应用
//
//  Created by 杨帆 on 2019/1/19.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pinWheel: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tap = UITapGestureRecognizer(target: self, action: #selector(imgClick))

        tap.numberOfTapsRequired = 2

        pinWheel.isUserInteractionEnabled = true

        pinWheel.addGestureRecognizer(tap)
    }

    @objc func imgClick(gesture: UIGestureRecognizer) {
        print("pinWheel clicked")
    }

    @IBAction func lbClick(_ sender: Any) {
        print("label clicked")
    }
}
