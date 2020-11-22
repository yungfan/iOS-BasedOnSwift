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

        // 代理
        locationManager.delegate = self

        // 第一种：能后台定位但是会在顶部出现大蓝条（打开后台定位的开关）
        // 允许后台定位
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.requestWhenInUseAuthorization()

        // 第二种：能后台定位并且不会出现大蓝条
        // locationManager.requestAlwaysAuthorization()
    }

    /**
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

            if CLLocationManager.locationServicesEnabled() {

                //发起位置更新（定位）会一直轮询，耗电
                self.locationManager.startUpdatingLocation()

                //但是需要合理使用，如果只是定位一次，可以用下面的方法
                //self.locationManager.requestLocation()
            }

            else {

                print("定位不可用")
            }
        }
     */
}

extension ViewController: CLLocationManagerDelegate {
    // 定位成功
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last

        // 地理编码的类
        let gecoder = CLGeocoder()

        if let location = location {
            print(location)

            // 反地理编码 转换成 具体的地址
            gecoder.reverseGeocodeLocation(location) { placeMarks, _ in

                // CLPlacemark －－ 国家 城市 街道
                let placeMark = placeMarks?.first

                if let placeMark = placeMark {
                    print("\(placeMark.country!) -- \(placeMark.region!) -- \(placeMark.name!) -- \(placeMark.locality!)")
                }
            }
        }

        // self.locationManager.stopUpdatingLocation()
    }

    // 定位失败
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    // 弹出定位的对话框只会在第一次安装的时候出现一次，除非重新安装
    // 可以在该方法中监听位置的更新或请求用户的位置
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("授权信息改变成\(status.rawValue)")

        switch status {
        case .authorizedAlways, .authorizedWhenInUse:

            locationManager.startUpdatingLocation()

        case .denied:

            print("拒绝")

        default:
            locationManager.stopUpdatingLocation()
        }
    }
}
