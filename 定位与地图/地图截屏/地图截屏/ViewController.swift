//
//  ViewController.swift
//  地图截屏
//
//  Created by 杨帆 on 2021/1/18.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    // 地图显示的经纬度
    let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 31.29065118, longitude: 118.3623587)
    // 地图的跨度
    var span: CLLocationDegrees = 0.01
    // 截图后显示
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width * 0.5, height: UIScreen.main.bounds.size.height * 0.5))
        imageView.center = view.center
        view.addSubview(imageView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        generateSnapshot(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
}

extension ViewController {
    func generateSnapshot(width: CGFloat, height: CGFloat) {
        // 设置地图的Region
        let region = MKCoordinateRegion(
            center: location,
            span: MKCoordinateSpan(
                latitudeDelta: span,
                longitudeDelta: span
            )
        )

        // 截屏选项
        let mapOptions = MKMapSnapshotter.Options()
        mapOptions.region = region
        mapOptions.size = CGSize(width: width, height: height)
        mapOptions.showsBuildings = true

        // 开始截屏
        let snapshotter = MKMapSnapshotter(options: mapOptions)
        snapshotter.start { snapshotOrNil, errorOrNil in
            // 出现错误
            if let error = errorOrNil {
                print(error)
                return
            }
            // 显示截屏内容
            if let snapshot = snapshotOrNil {
                self.imageView.image = snapshot.image
            }
        }
    }
}
