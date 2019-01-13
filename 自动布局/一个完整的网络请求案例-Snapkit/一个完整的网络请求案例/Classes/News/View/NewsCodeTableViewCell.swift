//
//  NewsCodeTableViewCell.swift
//  一个完整的网络请求案例
//
//  Created by 杨帆 on 2019/1/10.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class NewsCodeTableViewCell: UITableViewCell {
    
    lazy var pic: UIImageView = UIImageView()
    
    lazy var title: UILabel = UILabel()
    
    lazy var author: UILabel = UILabel()
    
    lazy var  date: UILabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(pic)
        
        self.addSubview(title)
        
        self.addSubview(author)
        
        self.addSubview(date)
        
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
        
        self.pic.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(20)
            make.width.height.equalTo(80)
        }
        
        
        self.title.snp.makeConstraints { (make) in
            
            make.top.equalTo(pic)
            make.left.equalTo(self.pic.snp.right).offset(10)
            //上左为正、下右为负
            make.right.equalTo(-20)
            
            //为什么不设置下？因为下面会设置 距离我的底部 所以不用重复设置
        }
        
        
        self.author.snp.makeConstraints { (make) in

            make.top.equalTo(self.title.snp.bottom).offset(30)
            make.left.equalTo(self.title)
            make.bottom.equalTo(-10)
           
            //为什么不设置下右？因为下面会设置 距离我的右边 所以不用重复设置
        }

        self.date.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.author.snp.right).offset(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(self.author)
        }
    }
    
    
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
