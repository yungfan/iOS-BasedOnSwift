//
//  ViewController.swift
//  第三方地图的使用-高德
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//  Key：a14d50ad493f05a05df0bce2035c6503

import UIKit

class ViewController: UIViewController {
    var search: AMapSearchAPI!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 配置Key，除了key要一致，还必须保证bundle id与配置的一样
        AMapServices.shared().apiKey = "a14d50ad493f05a05df0bce2035c6503"

        poi()
    }

    func showMap() {
        let mapView = MAMapView(frame: view.bounds)

        view.addSubview(mapView)
    }

    func poi() {
        // 构造主搜索对象 AMapSearchAPI，并设置代理。
        search = AMapSearchAPI()
        search.delegate = self
        // 进行关键字检索的请求，其中 keywords 是必设参数。types 为搜索类型。
        let request = AMapPOIKeywordsSearchRequest()
        request.keywords = "高等院校"
        request.requireExtension = true
        request.city = "北京"
        request.types = "高等院校"
        // 只搜索本城市的POI
        request.cityLimit = true
        request.requireSubPOIs = true

        // 发起关键字检索
        search.aMapPOIKeywordsSearch(request)
    }
}

extension ViewController: AMapSearchDelegate {
    // 当检索成功时，会进到 onPOISearchDone 回调函数
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        if response.count == 0 {
            return
        }

        // 解析response获取POI信息，具体解析见 Demo
        for poi in response.pois {
            print(poi.name)
        }
    }
}
