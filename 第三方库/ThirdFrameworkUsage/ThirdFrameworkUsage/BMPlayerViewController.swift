//
//  BMPlayerViewController.swift
//  ThirdFrameworkUsage
//
//  Created by 杨帆 on 2019/12/30.
//  Copyright © 2019 杨帆. All rights reserved.
//

import BMPlayer
import UIKit

class BMPlayerViewController: UIViewController {
    var player: BMPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        BMPlayerConf.shouldAutoPlay = false
        BMPlayerConf.topBarShowInCase = .always
        BMPlayerConf.enableBrightnessGestures = true
        BMPlayerConf.enableVolumeGestures = true

        player = BMPlayer()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        view.addSubview(player)
        player.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(88)
            make.left.right.equalTo(self.view)
            // Note here, the aspect ratio 16:9 priority is lower than 1000 on the line, because the 4S iPhone aspect ratio is not 16:9
            make.height.equalTo(player.snp.width).multipliedBy(9.0 / 16.0).priority(750)
        }

        // local
        // let path = Bundle.main.path(forResource: "yungfan.mp4", ofType: nil)
        // let url = URL(fileURLWithPath: path!)

        // remote

        let url = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8")!

        let resource = BMPlayerResource(url: url)

        player.setVideo(resource: resource)

        // Back button event
        player.backBlock = { [unowned self] isFullScreen in
            if isFullScreen == true { return }
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}
