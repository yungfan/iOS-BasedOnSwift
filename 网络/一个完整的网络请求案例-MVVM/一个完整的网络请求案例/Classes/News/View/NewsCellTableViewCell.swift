//
//  NewsCellTableViewCell.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import Kingfisher
import UIKit

class NewsCellTableViewCell: UITableViewCell {
    @IBOutlet var pic: UIImageView!

    @IBOutlet var title: UILabel!

    @IBOutlet var author: UILabel!

    @IBOutlet var date: UILabel!

    func configUI(dataItem: DataItem?) {
        if let dataItem = dataItem {
            // 图片加载用Kingfisher第三方框架
            pic.kf.setImage(with: URL(string: dataItem.thumbnail_pic_s!))

            title.text = dataItem.title

            author.text = dataItem.author_name

            date.text = dataItem.date
        }
    }
}
