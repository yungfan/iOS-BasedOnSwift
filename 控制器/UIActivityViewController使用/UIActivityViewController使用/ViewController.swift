//
//  ViewController.swift
//  UIActivityViewController使用
//
//  Created by 杨帆 on 2021/1/10.
//

import UIKit

class ViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        diyUsage()
    }

    func diyUsage() {
        let items = ["这是一个系统分享的内容", UIImage(systemName: "heart"), URL(string: "http://www.baidu.com")] as [Any]
        // 第二个参数为自定义服务的数组
        let avc = UIActivityViewController(activityItems: items, applicationActivities: [DIYUIActicity()])
        avc.completionWithItemsHandler = { (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ activityError: Error?) -> Void in
            print(activityType)
            print(completed)
            print(returnedItems)
            print(activityError)
        }
        present(avc, animated: true, completion: nil)
    }

    func usage() {
        // 分享的内容，图片不是所有平台都有用 很多平台都是用URL网址里面的图片，如QQ
        let items = ["这是一个系统分享的内容", UIImage(systemName: "heart"), URL(string: "http://www.baidu.com")] as [Any]

        // activityItems：分享的内容，包括图片、图片、网址
        // applicationActivities：应用程序支持的自定义服务数组
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)

        // 设置不出现的分享选项，可以只保留常用的
        avc.excludedActivityTypes = [.assignToContact, .message, .mail]

        // 分享回调
        // activityType：点击的服务类型
        // completed：是否执行成功
        // returnedItems：包含ExtensionItem对象的数组
        // activityError：错误信息
        avc.completionWithItemsHandler = { (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ activityError: Error?) -> Void in
            print(activityType)
            print(completed)
            print(returnedItems)
            print(activityError)
        }

        present(avc, animated: true, completion: nil)
    }
}

// 自定义服务
class DIYUIActicity: UIActivity {
    // 分享的标题
    override var activityTitle: String? {
        return "iOS开发"
    }

    // 分享的图片Logo
    override var activityImage: UIImage? {
        return UIImage(systemName: "heart")
    }

    // 标识符，一般返回自定义的类名
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(DIYUIActicity.self.description())
    }

    // 分享的类型，action和share
    // share：出现在应用一栏
    // action：出现在操作列表
    override class var activityCategory: UIActivity.Category {
        return .action
    }

    // 点击分享时需要进行的操作
    override func prepare(withActivityItems activityItems: [Any]) {
        activityDidFinish(true)
        print("分享")
    }

    // 是否允许进行分享
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
}
