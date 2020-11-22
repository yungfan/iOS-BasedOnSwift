//
//  WechatTableViewCell.swift
//  UITableViewXIB方式自定义Cell
//
//  Created by 杨帆 on 2018/11/5.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

class WechatTableViewCell: UITableViewCell {
    @IBOutlet var pic: UIImageView!

    @IBOutlet var title: UILabel!

    @IBOutlet var time: UILabel!

    @IBOutlet var content: UILabel!

    var wechat: WeChat?

    func configUI() {
        pic.image = UIImage(named: (wechat?.picImage)!)
        title.text = wechat?.titleText
        time.text = wechat?.timeText
        content.text = wechat?.contentText
    }
}
