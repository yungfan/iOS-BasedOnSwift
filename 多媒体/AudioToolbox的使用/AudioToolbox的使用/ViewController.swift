//
//  ViewController.swift
//  AudioToolbox的使用
//
//  Created by stu1 on 2019/1/16.
//  Copyright © 2019年 abc. All rights reserved.
//

import AudioToolbox
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        systemVibration()
    }

    // MARK: - 声音播放

    func systemSound() {
        // 建立的SystemSoundID对象
        var soundID: SystemSoundID = 0
        // 获取声音地址
        let path = Bundle.main.path(forResource: "wangzha", ofType: "mp3")
        // 地址转换
        let baseURL = NSURL(fileURLWithPath: path!)
        // 赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        // 播放声音
        AudioServicesPlaySystemSound(soundID)
    }

    // MARK: - 提醒

    func systemAlert() {
        // 建立的SystemSoundID对象
        var soundID: SystemSoundID = 0
        // 获取声音地址
        let path = Bundle.main.path(forResource: "wangzha", ofType: "mp3")
        // 地址转换
        let baseURL = NSURL(fileURLWithPath: path!)
        // 赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        // 提醒（同上面唯一的一个区别）
        AudioServicesPlayAlertSound(soundID)
    }

    // MARK: - 震动

    func systemVibration() {
        // 建立的SystemSoundID对象
        let soundID = SystemSoundID(kSystemSoundID_Vibrate)
        // 振动
        AudioServicesPlaySystemSound(soundID)
    }
}
