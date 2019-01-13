//
//  WeChat.swift
//  UITableView自定义Cell-01
//
//  Created by 杨帆 on 2018/11/5.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class WeChat: NSObject {
    
    var picImage: String
    
    var titleText: String
    
    var timeText: String
    
    var contentText: String
    
    
    init(picImage:String, titleText:String, timeText:String, contentText:String) {
        
        self.picImage = picImage
        self.titleText = titleText
        self.timeText = timeText
        self.contentText = contentText
    }

}
