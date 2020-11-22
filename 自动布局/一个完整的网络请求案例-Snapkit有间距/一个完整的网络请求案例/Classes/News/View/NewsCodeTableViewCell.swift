//
//  NewsCodeTableViewCell.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/10.
//  Copyright © 2019 ABC. All rights reserved.
//

import Kingfisher
import SnapKit
import UIKit

class NewsCodeTableViewCell: UITableViewCell {
    lazy var pic: UIImageView = UIImageView()

    lazy var title: UILabel = UILabel()

    lazy var author: UILabel = UILabel()

    lazy var date: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .orange

        addSubview(pic)

        addSubview(title)

        addSubview(author)

        addSubview(date)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 18)
        author.textColor = UIColor.gray
        author.font = .systemFont(ofSize: 15)
        date.textColor = UIColor.gray
        date.font = .systemFont(ofSize: 15)

        pic.snp.makeConstraints { make in

            make.top.left.equalTo(20)
            make.width.height.equalTo(80)
        }

        title.snp.makeConstraints { make in

            make.top.equalTo(pic)
            make.left.equalTo(self.pic.snp.right).offset(10)
            // 上左为正、下右为负
            make.right.equalTo(-20)

            // 为什么不设置下？因为下面会设置 距离我的底部 所以不用重复设置
        }

        author.snp.makeConstraints { make in

            make.top.equalTo(self.title.snp.bottom).offset(30)
            make.left.equalTo(self.title)
            make.bottom.equalTo(-10)

            // 为什么不设置下右？因为下面会设置 距离我的右边 所以不用重复设置
        }

        date.snp.makeConstraints { make in

            make.left.equalTo(self.author.snp.right).offset(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(self.author)
        }
    }

    func configUI(dataItem: DataItem?) {
        if let dataItem = dataItem {
            // 图片加载用Kingfisher第三方框架
            pic.kf.setImage(with: URL(string: dataItem.thumbnail_pic_s!))

            title.text = dataItem.title

            author.text = dataItem.author_name

            date.text = dataItem.date
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
