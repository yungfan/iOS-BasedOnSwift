//
//  ViewController.swift
//  地图与定位配合使用
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//  同样是在地图显示当前位置，但是用CLLocationManager和MKMapView的代理拿到的CLLocation不一致，比较引入火星坐标

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    //定位管理器
    lazy var locationManager: CLLocationManager = {
        
        var locationManager = CLLocationManager()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestAlwaysAuthorization()
        
        //方式一 通过这种方式在地图显示有偏差
        //locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        return locationManager
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMapView()
    }
    
    
    func setupMapView(){
        
        //方式二 通过这种方式在地图显示正常
        self.mapView.delegate = self
        
        self.mapView.showsUserLocation = true
    }
    
    
    //设置“缩放级别”
    func setRegion(location:CLLocation?){
        
        if let location = location {
            
            //设置范围，显示地图的哪一部分，500宽 500高
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            
            //调整范围
            let adjustedRegion = self.mapView.regionThatFits(region)
            
            //地图显示范围
            self.mapView.setRegion(adjustedRegion, animated: true)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if CLLocationManager.locationServicesEnabled() {
            
            self.locationManager.startUpdatingLocation()
        }
        
         self.locationManager.startUpdatingLocation()
    }
    
}

//火星坐标
//用这种方式显示地图位置会有偏差，必须要转换
extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        if let location = location {
            
            //调整坐标
            let gcjLat =   LocationTransform.wgs2gcj(wgsLat: location.coordinate.latitude, wgsLng: location.coordinate.longitude).gcjLat

            let gcjLng =   LocationTransform.wgs2gcj(wgsLat: location.coordinate.latitude, wgsLng: location.coordinate.longitude).gcjLng

            let newLocation:CLLocation = CLLocation(latitude: gcjLat, longitude: gcjLng)
            
            setRegion(location: newLocation)
        }
        
        
    }
    
}

extension ViewController : MKMapViewDelegate {


    //定位是很准的  这个代理方法必须要求 showsUserLocation = YES; || userTrackingMode = followWithHeading | .follow ，但是前者并不会自动缩放地图的视角到定位的位置
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

        let location = userLocation.location

        setRegion(location: location)

    }
}


