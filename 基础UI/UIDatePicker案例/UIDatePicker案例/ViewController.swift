//
//  ViewController.swift
//  UIDatePicker案例
//
//  Created by 杨帆 on 2018/10/17.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var birthday: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 300))

        datePicker.datePickerMode = .dateAndTime

        // 当控件datePicker发生valueChanged事件时 会调用target的action方法
        datePicker.addTarget(self, action: #selector(getBirthday), for: .valueChanged)

        birthday.inputView = datePicker
    }

    @objc func getBirthday(datePicker: UIDatePicker) {
        // 获取日期
        let date = datePicker.date

        // Date转String

        // 2018.10.17 2018/10/17 2018-10-17 2018年10月17日
        let dateFormatter = DateFormatter()

        // 24小时制
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"

        // 复制给birthday
        birthday.text = dateFormatter.string(from: date)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 退键盘的另外一种方式
        birthday.resignFirstResponder()
    }
}
