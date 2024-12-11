//
//  ViewController.swift
//  PrivacyProtection
//
//  Created by 杨帆 on 2024/12/11.
//

import UIKit

class ViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        label.center = view.center
        label.text = "敏感信息，后台不可查看"
        label.font = .monospacedSystemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
    }
}

