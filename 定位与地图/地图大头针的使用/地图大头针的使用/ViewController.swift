//
//  ViewController.swift
//  地图大头针的使用
//
//  Created by stu1 on 2019/1/14.
//  Copyright © 2019年 abc. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!

    // 定位管理器
    lazy var locationManager: CLLocationManager = {
        var locationManager = CLLocationManager()

        locationManager.requestWhenInUseAuthorization()

        locationManager.requestAlwaysAuthorization()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        return locationManager

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMapView()
    }

    func setupMapView() {
        // 调用一下 否则不能定位
        _ = locationManager

        mapView.delegate = self

        mapView.userTrackingMode = .follow

        mapView.showsUserLocation = true
    }

    // 点击地图的任一位置 都可以插入一个大头针，大头针的标题和副标题显示的是大头针的具体位置
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first?.location(in: mapView)

        // 将坐标转换成为经纬度,然后赋值给大头针
        let coordinate = mapView.convert(touchPoint!, toCoordinateFrom: mapView)

        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        let gecoder = CLGeocoder()

        // 反地理编码 转换成 具体的地址
        gecoder.reverseGeocodeLocation(location) { placeMarks, _ in

            // CLPlacemark －－ 国家 城市 街道
            let placeMark = placeMarks?.first

            if let placeMark = placeMark {
                let flag = MapFlag(title: placeMark.locality, subtitle: placeMark.subLocality, coordinate: coordinate, url: "https://www.abc.edu.cn")

                self.mapView.addAnnotation(flag)
            }
        }
    }

    // 点击跳转到Note
    @objc func click(_ sender: Any) {
        print("click")
    }
}

extension ViewController: MKMapViewDelegate {
    /*

     * 大头针分三种
     * 1. MKPinAnnotationView：系统自带的大头针，继承于MKAnnotationView，形状跟棒棒糖类似，可以设置糖的颜色，和显示的时候是否有动画效果 （Swift不推荐使用）
     * 2. MKMarkerAnnotationView（iOS 11.0后，建议使用）
       3. MKAnnotationView：可以用指定的图片作为大头针的样式，但显示的时候没有动画效果，如果没有给图片的话会什么都不显示（自定义时使用）
     */

    /**
     *  每当添加一个大头针 该方法被调用。如果该方法没有实现, 或者返回nil, 那么就会使用系统默认的大头针视图
     *  如果我希望自定义，怎么办？该方法的返回值就是你自定义的的大头针
     *  该方法非常类似 cellForRowAtIndex（返回的是用户定义的一个cell）
     *  参数中的annotation就是自己添加的MyAnnotation对象 自动会传递过来
     *  第一次定位成功以后也会调用一次该方法 显示用户位置 此时传进来的annotation参数是MKUserLocation
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapFlag else {
            return nil
        }

        // 大头针的标识符
        let identifier = "marker"
        // 大头针视图
        let annotationView: MKAnnotationView

        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeueView.annotation = annotation

            annotationView = dequeueView
        } else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)

            // 显示气泡
            annotationView.canShowCallout = true

            // 弹出的位置偏移
            annotationView.calloutOffset = CGPoint(x: -5.0, y: 5.0)

            // 右边显示的辅助视图
            let button = UIButton(type: .detailDisclosure)

            button.addTarget(self, action: #selector(click), for: .touchUpInside)

            annotationView.rightCalloutAccessoryView = button
        }

        return annotationView
    }
}
