//
//  AppDelegate.swift
//  socrates
//
//  Created by wangjiwei on 2/22/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabbarController = XXTabbarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        return true
    }
}

