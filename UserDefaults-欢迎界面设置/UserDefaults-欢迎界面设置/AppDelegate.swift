//
//  AppDelegate.swift
//  UserDefaults-欢迎界面设置
//
//  Created by 杨帆 on 2018/12/11.
//  Copyright © 2018 ABC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var currentVersion : String!
    
    var userDefaults : UserDefaults!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        userDefaults = UserDefaults.standard
        
        //本地版本号
        let localVersion = userDefaults.string(forKey: "localVersion")

        //当前版本号
        self.currentVersion = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)
        
        if localVersion == nil {
            
             self.showNewFeature()
        }
        
        else{
            
            //版本比较
            if(localVersion! < self.currentVersion){
                
              
                 self.showNewFeature()
            }
            
            else{
                
                let vc = UIViewController()
                
                vc.view.backgroundColor = UIColor.red
                
                self.window?.rootViewController = vc
                
            }
            
        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func showNewFeature(){
        
        //显示新特性
        let vc = UIViewController()
        
        vc.view.backgroundColor = UIColor.orange
        
        self.window?.rootViewController = vc
        
        userDefaults.set(self.currentVersion, forKey: "localVersion")
        
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

