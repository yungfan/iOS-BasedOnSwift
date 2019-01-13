//
//  NewsCellTableViewCell.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    func configUI(dataItem : DataItem?){
        
        if let dataItem = dataItem {
            
            //图片加载用Kingfisher第三方框架
            self.pic.kf.setImage(with: URL(string: dataItem.thumbnail_pic_s!))
            
            self.title.text = dataItem.title
            
            self.author.text = dataItem.author_name
            
            self.date.text = dataItem.date
        }
    
    }
    
}
