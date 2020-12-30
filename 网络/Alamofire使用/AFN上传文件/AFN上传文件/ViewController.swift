//
//  ViewController.swift
//  AFN上传文件
//
//  Created by 杨帆 on 2020/12/30.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func upload(_ sender: Any) {
        uploadImage(param: nil, img: UIImage(named: "掘金：致iOSer的一封信.png")!, fileName: "掘金：致iOSer的一封信.png")
    }

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
