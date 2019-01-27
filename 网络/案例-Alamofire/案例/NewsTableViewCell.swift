//
//  NewsTableViewCell.swift
//  案例
//
//  Created by 杨帆 on 2019/1/26.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func setupCell(item:DataItem){
        
        let url = URL(string: item.thumbnail_pic_s!)
        img.kf.setImage(with: url!)
        title.text = item.title
        author.text = item.author_name
        date.text = item.date
        
    }
    
}
