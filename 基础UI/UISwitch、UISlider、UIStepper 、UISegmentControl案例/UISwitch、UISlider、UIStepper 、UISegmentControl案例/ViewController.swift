//
//  ViewController.swift
//  UISwitch、UISlider、UIStepper 、UISegmentControl案例
//
//  Created by 杨帆 on 2018/10/16.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var light: UIImageView!

    @IBOutlet var voice: UIImageView!

    @IBOutlet var product: UILabel!

    @IBOutlet var flower: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // sender 谁触发这个事件 就将谁传进来
    @IBAction func valueChanged(_ sender: Any) {
        // UISwitch
        // as?可选转换
        let switchUI = sender as? UISwitch

        if let switchUI = switchUI {
            if switchUI.isOn {
                light.image = UIImage(named: "light.png")
            } else {
                light.image = UIImage(named: "nomal.png")
            }
        }

        // UISlider
        let slider = sender as? UISlider

        if let slider = slider {
            if slider.value < 0.3 {
                voice.image = UIImage(named: "low.png")
            } else if slider.value < 0.7 {
                voice.image = UIImage(named: "middle.png")
            } else {
                voice.image = UIImage(named: "high.png")
            }
        }

        // UIStepper
        let stepper = sender as? UIStepper

        if let stepper = stepper {
            let value = stepper.value

            if value < stepper.maximumValue {
                product.text = "您购买了\(Int(value))件商品"
            }

            if value == stepper.minimumValue {
                product.text = "您未购买任何商品"
            }
        }

        // UISegmentedControl
        let segment = sender as? UISegmentedControl

        if let segment = segment {
            if segment.selectedSegmentIndex == 0 {
                flower.image = UIImage(named: "red.png")
            } else if segment.selectedSegmentIndex == 1 {
                flower.image = UIImage(named: "purple.png")
            }
        }
    }
}
