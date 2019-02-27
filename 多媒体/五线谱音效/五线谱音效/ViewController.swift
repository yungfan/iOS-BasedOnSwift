//
//  ViewController.swift
//  五线谱音效
//
//  Created by 杨帆 on 2019/2/26.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        
        //根据触摸的View来播放不同的音符声音
        let view = sender.view
        
        if let view = view {
            
            switch view.tag {
                
                case 1 :
                    systemSound(name: "do1")
                case 2:
                    systemSound(name: "re2")
                case 3:
                    systemSound(name: "mi3")
                case 4:
                    systemSound(name: "fa4")
                case 5:
                    systemSound(name: "sol5")
                case 6:
                    systemSound(name: "la6")
                case 7:
                    systemSound(name: "si7")
                default:
                    print("error")
                
            }
            
        }
    }
    
    
    // MARK:- 声音播放
    func systemSound(name:String){
        
        
        //建立的SystemSoundID对象
        var soundID:SystemSoundID = 0
        //获取声音地址
        let path = Bundle.main.path(forResource: name, ofType: "wav")
        //地址转换
        let baseURL = NSURL(fileURLWithPath: path!)
        //赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        //播放声音
        AudioServicesPlaySystemSound(soundID)
        
    }
}

