//
//  ViewController.swift
//  I18NDemo
//
//  Created by 杨帆 on 2019/3/4.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let alert = UIAlertController(title: NSLocalizedString("title", comment: ""), message: NSLocalizedString("message", comment: ""), preferredStyle: .alert)

        let action = UIAlertAction(title: NSLocalizedString("btnTitle", comment: ""), style: .cancel, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
}
