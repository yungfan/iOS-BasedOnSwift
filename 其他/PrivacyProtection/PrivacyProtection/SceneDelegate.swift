//
//  SceneDelegate.swift
//  PrivacyProtection
//
//  Created by 杨帆 on 2024/12/11.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    // 增加一个新的隐私UIWindow
    private var privacyWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // 隐藏
        hidePrivacyWindow()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // 显示
        showPrivacyWindow()
    }

    // MARK: 创建并显示隐私UIWindow
    private func showPrivacyWindow() {
        guard let windowScene = window?.windowScene else {
            return
        }

        privacyWindow = UIWindow(windowScene: windowScene)
        // 切换rootViewController为隐藏敏感信息的UIViewController
        privacyWindow?.rootViewController = PrivacyViewController()
        // windowLevel有3个级别，值越大显示的越靠上
        privacyWindow?.windowLevel = .alert + 1
        privacyWindow?.makeKeyAndVisible()
    }

    // MARK: 隐藏隐私UIWindow
    private func hidePrivacyWindow() {
        privacyWindow?.isHidden = true
        privacyWindow = nil
    }
}
