//
//  ViewController.swift
//  拍照与相册
//
//  Created by 杨帆 on 2019/1/15.
//  Copyright © 2019 ABC. All rights reserved.
//

import MobileCoreServices
import UIKit

class ViewController: UIViewController {
    @IBOutlet var showImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnPhotoClicked(_ sender: Any) {
        photoLibrary()
    }

    @IBAction func btnCameraClicked(_ sender: Any) {
        camera()
    }

    func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let myPickerController = UIImagePickerController()

            myPickerController.delegate = self

            myPickerController.sourceType = .photoLibrary

            present(myPickerController, animated: true, completion: nil)
        }
    }

    func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // 1、创建UIImagePickerController对象。
            let myPickerController = UIImagePickerController()

            myPickerController.delegate = self

            // 2、指定拾取源，平时选择照片时使用的拾取源是照片库或者相簿，此刻需要指定为摄像头类型。
            myPickerController.sourceType = .camera

            // 3、指定摄像头，前置摄像头或者后置摄像头。
            myPickerController.cameraDevice = .rear

            // 允许编辑图片 那么代理方法里需要相应地获取编辑后的图片
            myPickerController.allowsEditing = true

            present(myPickerController, animated: true, completion: nil)
        }
    }

    // 选视频
    func vedioLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let myPickerController = UIImagePickerController()

            myPickerController.delegate = self

            myPickerController.sourceType = .photoLibrary

            myPickerController.mediaTypes = [kUTTypeMovie as String]

            present(myPickerController, animated: true, completion: nil)
        }
    }

    // 拍视频
    func vedio() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // 1、创建UIImagePickerController对象。
            let myPickerController = UIImagePickerController()

            myPickerController.delegate = self

            // 2、指定拾取源，平时选择照片时使用的拾取源是照片库或者相簿，此刻需要指定为摄像头类型。
            myPickerController.sourceType = .camera

            // 3、指定摄像头，前置摄像头或者后置摄像头。
            myPickerController.cameraDevice = .rear

            // 4、设置媒体类型mediaType，注意如果是录像必须设置，如果是拍照此步骤可以省略，因为mediaType默认包含kUTTypeImage（注意媒体类型定义在MobileCoreServices.framework中）
            myPickerController.mediaTypes = [kUTTypeMovie as String]

            // 5、指定捕获模式，拍照或者录制视频。（视频录制时必须先设置媒体类型再设置捕获模式
            myPickerController.cameraCaptureMode = .video

            // 最大时长：10秒
            myPickerController.videoMaximumDuration = 10.0

            present(myPickerController, animated: true, completion: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        // 如果是视频
        if info[UIImagePickerController.InfoKey.mediaType] as! String == kUTTypeMovie as String {
            if let videoURL = info[UIImagePickerController.InfoKey.originalImage] as? URL {
                let pathString = videoURL.relativePath

                print("视频地址1：\(pathString)")

                print("视频地址2：\(videoURL.path)")

                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
            }
        } else {
            // 获取原始照片
            // UIImagePickerController.InfoKey.editedImage 编辑图片
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                print("width:\(image.size.width); height:\(image.size.height)")

                showImage.image = image

                // 如果是拍照的
                if picker.sourceType == .camera {
                    // 保存照片到相册
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }

            } else {
                print("image is nil")
            }
        }

        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print(error!)
    }
}
