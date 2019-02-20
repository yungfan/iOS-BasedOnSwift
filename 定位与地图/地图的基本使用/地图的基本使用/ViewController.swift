//
//  ViewController.swift
//  地图的基本使用
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    lazy var locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        setupMapView()
        
    }
    
    func setupManager(){
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestAlwaysAuthorization()
        
        //不需要发起定位
    }

    
    func setupMapView(){
        
        setupManager()
        
        //地图类型
        self.mapView.mapType = .hybridFlyover
        
        //显示兴趣点
        self.mapView.showsPointsOfInterest = true
        
        //显示指南针
        self.mapView.showsCompass = true
        
        //显示交通
        self.mapView.showsTraffic = true
        
        //显示建筑
        self.mapView.showsBuildings = true
        
        //显示级别
        self.mapView.showsScale = true
        
        //用户跟踪模式
        self.mapView.userTrackingMode = .follow
        
    }

}
