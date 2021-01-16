//
//  ViewController.swift
//  定位
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//

import CoreLocation
import UIKit

class ViewController: UIViewController {
    // 定位需要一个CLLocationManager
    lazy var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupManager()
    }

    func setupManager() {
        // 默认情况是这样的,每当位置改变时LocationManager就调用一次代理。通过设置distanceFilter可以实现当位置改变超出一定范围时LocationManager才调用相应的代理方法。这样可以达到省电的目的。
        locationManager.distanceFilter = 300

        // 精度 比如为10 就会尽量达到10米以内的精度
        // kCLLocationAccuracyBest
        // kCLLocationAccuracyBestForNavigation(使用其他传感数据 具有最高的精度)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest


        locationManager.requestAlwaysAuthorization()
        //locationManager.requestWhenInUseAuthorization()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 模糊定位
        print(self.locationManager.accuracyAuthorization.rawValue)
        
        locationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "ExampleUsageDescription") { error in
            // 再次授权精确定位
            print(self.locationManager.accuracyAuthorization.rawValue)
        }
    }
}
