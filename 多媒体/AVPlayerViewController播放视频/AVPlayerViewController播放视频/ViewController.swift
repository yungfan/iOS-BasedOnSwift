//
//  ViewController.swift
//  AVPlayerViewController播放视频
//
//  Created by 杨帆 on 2019/2/14.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        playLocalVedio()
    }

    
    func playLocalVedio(){
        
        //视频文件
        let filePath = Bundle.main.path(forResource: "yungfan", ofType: "mp4")
        
        let videoURL = URL(fileURLWithPath: filePath!)
        
        //定义一个视频播放器
        let player = AVPlayer(url: videoURL)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            
            playerViewController.player!.play()
        }
    }
    
    func playNetworkVedio(){
        
        //视频文件
        let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8")!
        
        //定义一个视频播放器
        let player = AVPlayer(url: videoURL)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            
            playerViewController.player!.play()
        }
    }
}

