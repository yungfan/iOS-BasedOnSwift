//
//  ViewController.swift
//  SPPermissionUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let controller = SPPermissions.native([.calendar, .camera, .contacts])

        // Set `DataSource` or `Delegate` if need.
        // By default using project texts and icons.
        //controller.dataSource = self

        // Always use this method for present
        controller.present(on: self)
    }

}


extension ViewController: SPPermissionsDataSource {
    
    func configure(_ cell: SPPermissionTableViewCell, for permission: SPPermission) -> SPPermissionTableViewCell {
        return cell
    }
}
