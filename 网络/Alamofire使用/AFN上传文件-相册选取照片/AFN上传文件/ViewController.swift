//
//  ViewController.swift
//  AFN上传文件
//
//  Created by 杨帆 on 2020/12/30.
//

import Alamofire
import PhotosUI
import UIKit

class ViewController: UIViewController {
    // 新的多选图片控制器
    private var picker: PHPickerViewController!

    // 存放图片
    var images: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func configPicker() {
        var configuration = PHPickerConfiguration()
        // 0表示不限制
        configuration.selectionLimit = 3
        // 设置能选择的类型
        configuration.filter = PHPickerFilter.any(of: [.images])
        picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
    }

    // 先选择照片
    @IBAction func selectP(_ sender: Any) {
        configPicker()
        present(picker, animated: true, completion: nil)
    }

    // 再上传照片
    @IBAction func upload(_ sender: Any) {
        for index in 0 ..< images.count {
            uploadImage(param: nil, img: images[index], fileName: "image\(index).png")
        }
    }
}

extension ViewController {
    func uploadImage(param: [String: Any]?, img: UIImage, fileName: String) {
        let headers: HTTPHeaders = ["Content-type": "multipart/form-data",
                                    "Content-Disposition": "form-data"]
        AF.upload(multipartFormData: { multipartFormData in
                      // 其他参数
                      if let param = param {
                          for (key, value) in param {
                              multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                          }
                      }
                      // 图片
                      guard let imgData = img.pngData() else { return }
                      multipartFormData.append(imgData, withName: "file", fileName: fileName, mimeType: "image/png")
                  },
                  to: "http://192.168.0.97:3000", // 网址
                  usingThreshold: UInt64(),
                  method: .post, // 方法
                  headers: headers) // header
            .response { response in
                if response.error != nil {
                    if let jsonData = response.data {
                        print(String(data: jsonData, encoding: .utf8))
                    }
                }
            }.uploadProgress { progress in // 进度
                print("Upload Progress: \(progress.fractionCompleted)")
            }
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        guard !results.isEmpty else { return }

        // 获取选中的图片
        for result in results {
            let itemProvider = result.itemProvider

            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { object, _ in

                    guard let image = object as? UIImage else { return }

                    self.images.append(image)
                }
            }
        }
    }
}
