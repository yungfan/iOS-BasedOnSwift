//
//  DKImagePickerControllerViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import DKImagePickerController
import UIKit

class DKImagePickerControllerViewController: UIViewController {
    let pickerController = DKImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.white

        pickerController.singleSelect = true
        // pickerController.maxSelectableCount = 5
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)

            for asset in assets {
                // 拿到图片
                let image = asset.image
            }
        }

        present(pickerController, animated: true) {}
    }
}
