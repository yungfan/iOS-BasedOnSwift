//
//  ViewController.swift
//  AVPlayer播放音频
//
//  Created by 杨帆 on 2019/2/14.
//  Copyright © 2019 杨帆. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    // 播放器
    var player: AVPlayer?

    // 歌曲如果不是https的话需要注意ATS问题
    var musics: Array = [
        "http://up.mcyt.net/?down/46969.mp3",
        "http://up.mcyt.net/?down/46973.mp3",
        "http://up.mcyt.net/?down/46960.mp3",
        "http://up.mcyt.net/?down/46954.mp3",
    ]

    // 播放
    @IBAction func play(_ sender: Any) {
        player?.play()
    }

    // 暂停
    @IBAction func pause(_ sender: Any) {
        player?.pause()
    }

    @IBAction func stop(_ sender: Any) {
    }

    // 切换歌曲
    @IBAction func change(_ sender: Any) {
        let index = Int.random(in: 0 ... musics.count - 1)

        let url = URL(string: musics[index])

        let item = AVPlayerItem(url: url!)

        // 切换一个item
        player?.replaceCurrentItem(with: item)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        player = getPlayer()
    }

    // 创建播放器
    func getPlayer() -> AVPlayer {
        let url = URL(string: musics[0])

        let item = AVPlayerItem(url: url!)

        // 获取进度
        let duration: CMTime = item.asset.duration
        // CMTime转Second
        let totalTime: Float64 = CMTimeGetSeconds(duration)

        print(formatTime(second: totalTime))

        let player = AVPlayer(playerItem: item)

        // 监听播放进度
        player.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1),
                                       queue: DispatchQueue.main) { (_) -> Void in

            if self.player!.currentItem?.status == .readyToPlay {
                // 更新进度条进度值
                let currentTime = CMTimeGetSeconds(self.player!.currentTime())

                print(self.formatTime(second: currentTime))
            }
        }

        return player
    }

    // 实现00:00这种格式的播放时间
    func formatTime(second: Float64) -> String {
        let total: Int = Int(second)
        // 秒
        let s: Int = total % 60
        // 分
        let m: Int = Int(total / 60)
        var time: String = ""

        // 判断分
        if m < 10 {
            time = "0\(m):"
        } else {
            time = "\(m)"
        }
        // 判断秒
        if s < 10 {
            time += "0\(s)"
        } else {
            time += "\(s)"
        }

        return time
    }
}
