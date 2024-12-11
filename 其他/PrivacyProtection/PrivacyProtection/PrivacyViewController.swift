//
//  PrivacyViewController.swift
//  PrivacyProtection
//
//  Created by 杨帆 on 2024/12/11.
//

import UIKit

class PrivacyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = view.bounds
        view.addSubview(visualEffectView)
    }
}
