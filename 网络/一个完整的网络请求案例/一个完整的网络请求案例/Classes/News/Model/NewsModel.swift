//
//  NewsModel.swift
//  Dmeo
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

// 服务器返回的数据对应的Model
struct NewsModel: Codable {
    var reason: String
    var error_code: Int
    var result: Result
}

struct Result: Codable {
    var stat: String
    var data: [DataItem]
}

// 实现Hashable，List中的数据必须实现
struct DataItem: Codable, Hashable {
    var title: String
    var date: String
    var category: String
    var author_name: String
    var url: String
    var thumbnail_pic_s: String
}
