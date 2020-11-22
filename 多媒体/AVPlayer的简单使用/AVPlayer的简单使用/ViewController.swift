//
//  ViewController.swift
//  AVPlayer的简单使用
//
//  Created by 杨帆 on 2019/2/28.
//  Copyright © 2019 杨帆. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    var player: AVPlayer!

    var musics: Array = [
        "http://up.mcyt.net/?down/46969.mp3",
        "http://up.mcyt.net/?down/46973.mp3",
        "http://up.mcyt.net/?down/46960.mp3",
        "http://up.mcyt.net/?down/46954.mp3",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        player = getPlayer()
    }

    @IBAction func change(_ sender: Any) {
        let index = Int.random(in: 0 ... 3)

        let url = URL(string: musics[index])

        let item = AVPlayerItem(url: url!)

        player.replaceCurrentItem(with: item)
    }

    @IBAction func play(_ sender: Any) {
        player.play()
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }

    func getPlayer() -> AVPlayer {
        let name = musics[0]

        let url = URL(string: name)

        let item = AVPlayerItem(url: url!)

        let player = AVPlayer(playerItem: item)

        return player
    }
}
