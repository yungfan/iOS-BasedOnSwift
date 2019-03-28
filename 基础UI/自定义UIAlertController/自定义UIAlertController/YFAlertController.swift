//
//  YFViewController.swift
//  自定义UIAlertController
//
//  Created by 杨帆 on 2019/3/28.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class YFAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //标题字体样式
        let titleFont = UIFont.systemFont(ofSize: 20)
        let titleAttribute = NSMutableAttributedString(string: self.title!)
        titleAttribute.addAttributes([NSAttributedString.Key.font:titleFont,
                                      NSAttributedString.Key.foregroundColor:UIColor.purple],
                                     range:NSMakeRange(0, (self.title?.count)!))
        self.setValue(titleAttribute, forKey: "attributedTitle")
        
        
        
        //消息内容样式
        let messageFontDescriptor = UIFontDescriptor(fontAttributes: [
            UIFontDescriptor.AttributeName.family:"Arial"])
        let messageFont = UIFont(descriptor: messageFontDescriptor, size: 15.0)
        let messageAttribute = NSMutableAttributedString(string: self.message!)
        messageAttribute.addAttributes([NSAttributedString.Key.font:messageFont,
                                        NSAttributedString.Key.foregroundColor:UIColor.blue],
                                       range:NSMakeRange(0, (self.message?.count)!))
        self.setValue(messageAttribute, forKey: "attributedMessage")
        
    }
    

    //改变按钮的颜色
    override func addAction(_ action: UIAlertAction) {
        super.addAction(action)
        //1.通过tintColor统一修改按钮颜色
        //self.view.tintColor = UIColor.orange
        
        //2.根据不同按钮设置
        //设置确定按钮图标和样式
        if action.style == .default {
           
            let iconImage = UIImage(named:"ok")
            
            action.setValue(iconImage, forKey: "image")
            
            action.setValue(UIColor.green, forKey:"titleTextColor")
            
        }
            
        else if  action.style == .cancel {
            
            let iconImage = UIImage(named:"error")
            
            action.setValue(iconImage, forKey: "image")
            
            action.setValue(UIColor.red, forKey:"titleTextColor")
        }
       
    }
    
    

}
