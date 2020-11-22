//
//  NewsTableViewCell.swift
//  案例
//
//  Created by 杨帆 on 2019/1/26.
//  Copyright © 2019 ABC. All rights reserved.
//

import Kingfisher
import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var date: UILabel!

    func setupCell(item: DataItem) {
        let url = URL(string: item.thumbnail_pic_s!)
        img.kf.setImage(with: url!)
        title.text = item.title
        author.text = item.author_name
        date.text = item.date
    }
}
