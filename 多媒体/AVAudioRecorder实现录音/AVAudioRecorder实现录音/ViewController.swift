//
//  ViewController.swift
//  AVAudioRecorder实现录音
//
//  Created by 杨帆 on 2019/2/14.
//  Copyright © 2019 杨帆. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    var recorder: AVAudioRecorder? // 录音器
    var player: AVAudioPlayer? // 播放器
    var recorderSettings: [String: Any]? // 设置录音器参数
    var filePath: String? // 录音存储路径

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化录音器
        let session: AVAudioSession = AVAudioSession.sharedInstance()
        // 设置录音类型
        try! session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
        // 激活Session
        try! session.setActive(true)
        // 获取Document目录
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                         .userDomainMask, true).first!
        // 组合录音文件路径
        filePath = docDir + "/record.aac"
        // 初始化字典并添加设置参数
        recorderSettings =
            [
                AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC), // 录音格式。kAudioFormatLinearPCM- caf
                AVNumberOfChannelsKey: 2, // 录音的声道数，立体声为双声道
                AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
                AVEncoderBitRateKey: 320000, // 设置录音采样率
                AVSampleRateKey: 44100.0, // 录音器每秒采集的录音样本数
            ]
    }

    // 按下录音
    @IBAction func record(_ sender: AnyObject) {
        print("按下")
        // 初始化录音器
        recorder = try! AVAudioRecorder(url: URL(string: filePath!)!,
                                        settings: recorderSettings!)

        if let recorder = recorder {
            // 准备录音
            recorder.prepareToRecord()
            // 开始录音
            recorder.record()
        }
    }

    // 松开按钮，结束录音
    @IBAction func stop(_ sender: AnyObject) {
        print("松开")

        // 停止录音
        recorder?.stop()
        // 录音器释放
        recorder = nil
    }

    // 播放录制的声音
    @IBAction func play(_ sender: AnyObject) {
        // 播放
        player = try! AVAudioPlayer(contentsOf: URL(string: filePath!)!)

        if let player = player {
            // 让音频通过喇叭播放
            try! AVAudioSession.sharedInstance().overrideOutputAudioPort(.speaker)

            player.play()
        }
    }
}
