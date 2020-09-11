//
//  AppDelegate.swift
//  AppSpSDKDemo
//
//  Created by Black on 2020/9/8.
//  Copyright © 2020 Black. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var reachability: Reachability?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let VC = ViewController()
        VC.view.backgroundColor = UIColor.white
        let Nav = UINavigationController(rootViewController: VC)
        Nav.navigationBar.isTranslucent = false
        self.window?.rootViewController = Nav
        
        observeNetwork()
        
        return true
    }
    
    //=================网络状态监听=========================
    func observeNetwork() {
        
        reachability = try? Reachability(hostname: "baidu.com")
        reachability?.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability?.whenUnreachable = { _ in
            print("Not reachable")
        }

        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
}

