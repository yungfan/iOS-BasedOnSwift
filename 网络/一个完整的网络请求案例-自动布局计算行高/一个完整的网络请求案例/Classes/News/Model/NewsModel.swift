//
//  NewsModel.swift
//  Dmeo
//
//  Created by 杨帆 on 2019/1/9.
//  Copyright © 2019 ABC. All rights reserved.
//

import UIKit

// 服务器返回的数据对应的Model

class NewsModel: Codable {
    var reason: String?
    var error_code: Int?
    var result: Result?
}

class Result: Codable {
    var stat: String?
    var data: [DataItem]?
}

class DataItem: Codable {
    var uniquekey: String?
    var title: String?
    var date: String?
    var category: String?
    var author_name: String?
    var url: String?
    var thumbnail_pic_s: String?
    var thumbnail_pic_s02: String?
    var thumbnail_pic_s03: String?
}
