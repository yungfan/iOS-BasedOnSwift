//
//  WechatTableViewCell.swift
//  UITableViewXIB方式自定义Cell
//
//  Created by 杨帆 on 2018/11/5.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class WechatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    var wechat:WeChat?
    
    func configUI(){
        
        self.pic.image = UIImage(named:(wechat?.picImage)!)
        self.title.text = wechat?.titleText
        self.time.text = wechat?.timeText
        self.content.text = wechat?.contentText
        
        
    }
    
}
