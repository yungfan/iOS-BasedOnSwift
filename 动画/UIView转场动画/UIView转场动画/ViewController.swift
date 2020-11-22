//
//  ViewController.swift
//  UIView转场动画
//
//  Created by 杨帆 on 2018/12/29.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /**
          //方式一
         UIView.transition(with: self.redView, duration: 2.0, options: .transitionCurlUp, animations: {

             let orangeView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

             orangeView.backgroundColor = UIColor.orange

             self.redView .addSubview(orangeView)

         }, completion: nil)
         */

        /**
         //方式二
         let orangeView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

         orangeView.backgroundColor = UIColor.orange

         UIView.transition(from: self.redView, to: orangeView, duration: 2.0, options: .transitionFlipFromRight, completion: nil)
          */
    }
}
