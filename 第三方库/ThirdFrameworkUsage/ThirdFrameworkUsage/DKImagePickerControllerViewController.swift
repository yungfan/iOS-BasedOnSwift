//
//  DKImagePickerControllerViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import DKImagePickerController

class DKImagePickerControllerViewController: UIViewController {
    
    let pickerController = DKImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        pickerController.singleSelect = true
        //pickerController.maxSelectableCount = 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
            
            for asset in assets {
                
                //拿到图片
                let image = asset.image
            }
        }
        
        self.present(pickerController, animated: true) {}
    }

}
