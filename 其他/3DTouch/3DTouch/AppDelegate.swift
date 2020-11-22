//
//  AppDelegate.swift
//  3DTouch
//
//  Created by 杨帆 on 2019/2/15.
//  Copyright © 2019 杨帆. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        set3DMenu()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    func set3DMenu() {
        // 图标
        let icon1 = UIApplicationShortcutIcon(type: .audio)

        let icon2 = UIApplicationShortcutIcon(type: .alarm)

        let icon3 = UIApplicationShortcutIcon(type: .add)

        // 菜单
        let item1 = UIApplicationShortcutItem(type: "1", localizedTitle: "设置", localizedSubtitle: nil, icon: icon1, userInfo: nil)

        let item2 = UIApplicationShortcutItem(type: "2", localizedTitle: "查找", localizedSubtitle: nil, icon: icon2, userInfo: nil)

        let item3 = UIApplicationShortcutItem(type: "3", localizedTitle: "搜索", localizedSubtitle: nil, icon: icon3, userInfo: nil)

        // 设置
        UIApplication.shared.shortcutItems = [item1, item2, item3]
    }

    // 点击菜单响应
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "1" {
            window?.rootViewController?.view.backgroundColor = UIColor.red
        } else if shortcutItem.type == "2" {
            window?.rootViewController?.view.backgroundColor = UIColor.green
        } else if shortcutItem.type == "3" {
            window?.rootViewController?.view.backgroundColor = UIColor.blue
        }
    }
}
