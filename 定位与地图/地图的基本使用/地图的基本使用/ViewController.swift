//
//  ViewController.swift
//  地图的基本使用
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!

    lazy var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupMapView()
    }

    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        locationManager.requestWhenInUseAuthorization()

        locationManager.requestAlwaysAuthorization()

        // 不需要发起定位
    }

    func setupMapView() {
        setupManager()

        // 地图类型
        mapView.mapType = .hybridFlyover

        // 显示兴趣点
        mapView.showsPointsOfInterest = true

        // 显示指南针
        mapView.showsCompass = true

        // 显示交通
        mapView.showsTraffic = true

        // 显示建筑
        mapView.showsBuildings = true

        // 显示级别
        mapView.showsScale = true

        // 用户跟踪模式
        mapView.userTrackingMode = .followWithHeading
    }
}
