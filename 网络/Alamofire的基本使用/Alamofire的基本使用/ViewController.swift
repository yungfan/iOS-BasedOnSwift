//
//  ViewController.swift
//  Alamofire的基本使用
//
//  Created by 杨帆 on 2019/1/27.
//  Copyright © 2019 ABC. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    @IBOutlet var largeImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // download()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        upload()

        // download()
    }

    func get() {
        Alamofire.request("http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd").responseJSON { response in
            print("Request: \(String(describing: response.request))") // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)") // response serialization result

            // JSON数据
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }

            // Data数据（Codable协议需要这种数据）
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }

    func post() {
        // 参数是一个字典
        let parameters: Parameters = ["type": "top", "key": "d1287290b45a69656de361382bc56dcd"]

        Alamofire.request("http://v.juhe.cn/toutiao/index", method: .post, parameters: parameters).responseJSON { response in
            print("Request: \(String(describing: response.request))") // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)") // response serialization result

            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }

    func download() {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in

            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

            let fileURL = documentsURL.appendingPathComponent("pig.png")

            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        Alamofire.download("http://localhost:8080/AppTestAPI/wall.png", to: destination)
            // 下载进度
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .response { response in

                // 获取图片显示出来
                if response.error == nil, let imagePath = response.destinationURL?.path {
                    let image = UIImage(contentsOfFile: imagePath)

                    self.largeImage.image = image
                }
            }
    }

    func upload() {
        let imageData = UIImage(named: "aa")?.pngData()

        // 由于我的服务器是需要这种 所以用这种方式
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                // 注意这里的参数
                multipartFormData.append(imageData!, withName: "myfile", fileName: "aa.png", mimeType: "image/png")
            },
            // url
            to: "http://localhost:8080/AppTestAPI/UploadServlet",
            // 监听
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case let .success(upload, _, _):

                    upload.response { response in

                        print("Request: \(String(describing: response.request))") // original url request
                        print("Response: \(String(describing: response.response))") // http url response
                    }
                    // 进度
                    upload.uploadProgress { progress in // main queue by default
                        print("Upload Progress: \(progress.fractionCompleted)")
                    }

                case let .failure(encodingError):

                    print(encodingError)
                }
            }
        )
    }
}
