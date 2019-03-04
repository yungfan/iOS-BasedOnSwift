//
//  ViewController.swift
//  二维码扫描
//
//  Created by 杨帆 on 2019/2/15.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import AVKit


class ViewController: UIViewController {
    
    var device:AVCaptureDevice!
    var input:AVCaptureDeviceInput!
    var output:AVCaptureMetadataOutput!
    var session:AVCaptureSession!
    var preview:AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func scanQRFromAlbum(_ sender: AnyObject){
        
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = .photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: nil)
            
        }else{
            
            print("读取相册错误")
        }
    }
    
    @IBAction func scanQRFromCamera(_ sender: AnyObject){
        
        // 1. 实例化拍摄设
        device =  AVCaptureDevice.default(for: .video)
        // 2. 设置输入设备
        input = try! AVCaptureDeviceInput(device: device!)
        // 3. 设置元数据输出
        output = AVCaptureMetadataOutput()
        //设置代理 获取扫描后的结果
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        // 4. 添加拍摄会话
        session = AVCaptureSession()
        session.addInput(input)
        session.addOutput(output)
        session.sessionPreset = AVCaptureSession.Preset.high
        //设置输出数据类型，需要将元数据输出添加到会话后，才能指定元数据类型，否则会报错
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
         // 5. 视频预览图层
        preview = AVCaptureVideoPreviewLayer.init(session: session)
        preview.videoGravity = AVLayerVideoGravity.resizeAspectFill
        preview.frame = self.view.bounds
        self.view.layer.insertSublayer(preview, at: 10)
       
        // 6. 启动会话
        session.startRunning()
    }

}

extension ViewController : AVCaptureMetadataOutputObjectsDelegate{
    
    //扫描到了就会回调该方法
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        var result:String?
        
        if metadataObjects.count > 0 {
            
            let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            
            //获取内容
            result = metadataObject.stringValue
            
            if let result = result{
               
                self.session.stopRunning()
                
                //输出结果
                let alertController = UIAlertController(title: "二维码扫描结果",
                                                        message: result, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                    self.preview.removeFromSuperlayer()
                    
                })
                
                alertController.addAction(okAction)
                
                present(alertController, animated: true, completion: nil)
            }
        }

    }
    
}


extension ViewController :UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
        
        //获取选择的原图
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            //二维码读取
            let ciImage:CIImage = CIImage(image:image)!
            
            let context = CIContext(options: nil)
            
            let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context,
                                      options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
            
            if let features = detector?.features(in: ciImage) {
                
                print("扫描到二维码个数：\(features.count)")
                
                //遍历二维码
                for feature in features as! [CIQRCodeFeature] {
                    
                    //输出结果
                    let alertController = UIAlertController(title: "图片二维码内容",
                                                            message: feature.messageString, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alertController.addAction(okAction)
                    
                    DispatchQueue.main.async {
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                    
                }
            }
            
            picker.dismiss(animated: true, completion: nil)
        
        }
       
    }
    
}
