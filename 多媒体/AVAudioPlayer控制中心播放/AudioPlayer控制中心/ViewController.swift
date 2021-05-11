//
//  ViewController.swift
//  AudioPlayer控制中心
//
//  Created by 杨帆 on 2021/5/11.
//

import AVFoundation
import MediaPlayer
import UIKit

class ViewController: UIViewController {
    @IBOutlet var playPauseButton: UIButton!

    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPlayer()
        setupRemoteTransportControls()
        setupNowPlaying()
        setupNotifications()
    }
}

// 设置播放器
extension ViewController {
    func setUpPlayer() {
        do {
            let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
            player = try AVAudioPlayer(contentsOf: url!)
            player.delegate = self
            player.prepareToPlay()
        } catch let error as NSError {
            print("Failed to init audio player: \(error)")
        }
    }
}

// 设置远程控制
// https://developer.apple.com/documentation/avfoundation/media_playback_and_selection/creating_a_basic_video_player_ios_and_tvos/controlling_background_audio
extension ViewController {
    func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [unowned self] _ in
            if !self.player.isPlaying {
                self.play()
                return .success
            }
            return .commandFailed
        }

        commandCenter.pauseCommand.addTarget { [unowned self] _ in
            if self.player.isPlaying {
                self.pause()
                return .success
            }
            return .commandFailed
        }
    }

    func setupNowPlaying() {
        var nowPlayingInfo = [String: Any]()
        // 标题
        nowPlayingInfo[MPMediaItemPropertyTitle] = "奥特曼主题曲"
        // 图片
        if let image = UIImage(named: "artist") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { _ in
                image
            }
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = player.duration
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate

        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }

    func updateNowPlaying(isPause: Bool) {
        var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo!

        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = isPause ? 0 : 1

        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}

// https://developer.apple.com/documentation/avfaudio/avaudiosession/responding_to_audio_session_interruptions
// https://developer.apple.com/documentation/avfaudio/avaudiosession/responding_to_audio_session_route_changes

extension ViewController {
    func setupNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(handleInterruption),
                                       name: AVAudioSession.interruptionNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(handleRouteChange),
                                       name: AVAudioSession.routeChangeNotification,
                                       object: nil)
    }

    @objc func handleRouteChange(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
              let reason = AVAudioSession.RouteChangeReason(rawValue: reasonValue) else {
            return
        }
        switch reason {
        case .newDeviceAvailable:
            let session = AVAudioSession.sharedInstance()
            for output in session.currentRoute.outputs where output.portType == AVAudioSession.Port.headphones {
                DispatchQueue.main.sync {
                    self.play()
                }
                break
            }
        case .oldDeviceUnavailable:
            if let previousRoute =
                userInfo[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription {
                for output in previousRoute.outputs where output.portType == AVAudioSession.Port.headphones {
                    DispatchQueue.main.sync {
                        self.pause()
                    }
                    break
                }
            }
        default: ()
        }
    }

    @objc func handleInterruption(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }

        if type == .ended {
            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    play()
                }
            }
        }
    }
}

// IBAction
extension ViewController {
    @IBAction func togglePlayPause(_ sender: Any) {
        if player.isPlaying {
            pause()
        } else {
            play()
        }
    }

    func play() {
        player.play()
        playPauseButton.setTitle("暂停", for: UIControl.State.normal)
        updateNowPlaying(isPause: false)
    }

    func pause() {
        player.pause()
        playPauseButton.setTitle("播放", for: UIControl.State.normal)
        updateNowPlaying(isPause: true)
    }

    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
        playPauseButton.setTitle("播放", for: UIControl.State.normal)
    }
}

// AVAudioPlayerDelegate代理
extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            updateNowPlaying(isPause: true)
            playPauseButton.setTitle("播放", for: UIControl.State.normal)
        }
    }
}

