//
//  ViewController.swift
//  FaceID与TouchID
//
//  Created by 杨帆 on 2019/2/14.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        faceIDorTouchID()
    }
    
    //两种方式验证一样
    //FaceID需要在info.plist配置权限，TouchID不需要
    func faceIDorTouchID(){
        
        let context = LAContext()
        //LAContext实例类有个只读属性叫biometryType可以区分FaceID还是TouchID
        
        context.localizedFallbackTitle = "输入密码"
        
        var error: NSError?
        
        //判断是否支持TouchID或FaceID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            //调用授权，如果支持TouchID则弹出指纹识别，支持FaceID则弹出面容识别,以下情况不会弹出识别对话框
            //TouchID、FaceID不可用
            //密码没有被设置到设备的Settings选项中
            //没有使用Touch ID录入指纹、FaceID录入人脸
            //设备不支持Touch ID、FaceID
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "请用FaceID或者TouchID解锁", reply: { success, error in
                
                if success {
                    // 成功之后的逻辑
                    DispatchQueue.main.async {
                        self.view.backgroundColor = UIColor.red
                    }
                    
                }else {
                    
                    DispatchQueue.main.async {
                        self.view.backgroundColor = UIColor.black
                    }
                    
                    let error = error as NSError?
                    
                    if let error = error {
                        
                        switch Int32(error.code) {
                            
                        case kLAErrorPasscodeNotSet:
                            print("身份验证没有设置")
                            
                        case kLAErrorUserCancel:
                            print("用户取消")
                            
                        case kLAErrorUserFallback:
                            print("用户选择了另一种方式")
                            
                        default:
                            print("验证失败")
                        }
                        
                    }
                    
                }
                
            })
            
        }
    }
    
}

