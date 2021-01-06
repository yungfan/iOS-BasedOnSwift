//
//  Model.swift
//  多Section处理
//
//  Created by 杨帆 on 2021/1/3.
//

import UIKit

// MARK: - ModelElement

struct ModelElement: Codable {
    let 时间: String
    let 金额: Double
    let 明细: [明细]
}

// MARK: - 明细

struct 明细: Codable {
    let id: Int
    let 事项: String
    let 金额: Double
}

// 定义错误
enum NetworkError: Error {
    case LoadingError
}

// 泛型网络工具类
class NetworkTools<T> {
    // 异步回调的结果，Result类型
    var result: Result<T, Error>?
    // 获取Result包裹的真正的值
    var value: T? { try? result?.get() }
    // 网络URL
    var url: URL
    // 网络成功时的回调
    private var completionHandler: (Data) -> T?

    init(url: URL, completionHandler: @escaping (Data) -> T?) {
        self.url = url
        self.completionHandler = completionHandler
    }

    // 网络加载
    func load() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let data = data, let val = self.completionHandler(data) {
                    // 成功
                    self.result = .success(val)
                } else {
                    // 失败
                    self.result = .failure(NetworkError.LoadingError)
                }

                // 打印处理后的结果
                print(self.value ?? "unknown")
            }
        }.resume()
    }
}
