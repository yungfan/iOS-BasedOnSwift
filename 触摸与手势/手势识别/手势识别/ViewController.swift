//
//  ViewController.swift
//  手势识别
//
//  Created by 杨帆 on 2019/1/19.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var blueView: UIView!

    @IBAction func tap(_ sender: Any) {
        print("tap")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        let gestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(gesture))

//        let gestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(gesture))

//        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gesture))

//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gesture))

//        let gestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(gesture))
//
//        gestureRecognizer.edges = UIRectEdge.left

//        self.view.addGestureRecognizer(gestureRecognizer)

        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(gesture))

        gestureRecognizer.delegate = self

        blueView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func gesture(gestureRecognizer: UIGestureRecognizer) {
        print(#function)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    // 手势识别器是否解释此次手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.state == .possible {
            print("手势开始作用")

            return true
        } else if gestureRecognizer.state == .cancelled {
            print("手势结束")

            return true
        }

        return true
    }
}
