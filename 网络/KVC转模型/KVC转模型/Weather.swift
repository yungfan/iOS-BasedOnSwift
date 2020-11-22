//
//  Weather.swift
//  KVC转模型
//
//  Created by 杨帆 on 2019/3/27.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

// 第一层
class Weather: NSObject {
    // 所有属性前面要加@objc
    @objc var reason: String!
    @objc var error_code: Int = 0
    @objc var result: Result!

    // 通过字典初始化
    init(dic: [String: Any]?) {
        super.init()

        if let dic = dic {
            // KVC转模型，每一层都需要调用setValuesForKeys
            setValuesForKeys(dic)
        }
    }

    override var description: String {
        return "\(String(describing: reason))" + "\(error_code)" + "\(String(describing: result))"
    }
}

// 第二层
class Result: NSObject {
    @objc var pubTime: String!
    @objc var reqTime: String!
    @objc var data: Model!

    init(dic: [String: Any]?) {
        super.init()

        if let dic = dic {
            setValuesForKeys(dic)
        }
    }

    override var description: String {
        return "\(String(describing: pubTime))" + "\(String(describing: reqTime))" + "\(String(describing: data))"
    }
}

// 第三层
class Model: NSObject {
    @objc var url: String!
    @objc var cw: String!
    @objc var w: String!
    @objc var rh: Int = 0
    @objc var cwd: String!
    @objc var wd: String!
    @objc var wdg: Int = 0
    @objc var tmp: Int = 0
    @objc var airp: Int = 0
    @objc var st: Int = 0

    init(dic: [String: Any]?) {
        super.init()

        if let dic = dic {
            setValuesForKeys(dic)
        }
    }

    override var description: String {
        return "\(String(describing: url))" + "\(String(describing: cw))" + "\(String(describing: w))" + "\(rh)" + "\(String(describing: cwd))" + "\(String(describing: wd))" + "\(wdg))" + "\(tmp)" + "\(airp)" + "\(st)"
    }
}
