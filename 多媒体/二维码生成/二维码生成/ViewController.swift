//
//  ViewController.swift
//  二维码生成
//
//  Created by 杨帆 on 2019/2/15.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let qrImageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
        
        qrImageView.center = self.view.center
        
        qrImageView.image = createQRForString(qrString: "Hello YungFan")
        
        self.view.addSubview(qrImageView)
        
    }
    
    //创建二维码图片
    func createQRForString(qrString: String) -> UIImage{
        
        
        let stringData = qrString.data(using: .utf8)
        // 创建一个二维码的滤镜
        let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
        //inputMessage：二维码中所包含的信息
        qrFilter.setValue(stringData, forKey: "inputMessage")
        //inputCorrectionLevel：二维码的“精度”，就影响二维码生成的图片的“粗细”
        qrFilter.setValue("H", forKey: "inputCorrectionLevel")
        //输出图片
        let qrCIImage = qrFilter.outputImage
        
        // 返回二维码image，scale放大会清楚一点
        let codeImage = UIImage(ciImage: qrCIImage!
            .transformed(by: CGAffineTransform(scaleX: 5, y: 5)))
        
        return codeImage
        
    }
    
}

