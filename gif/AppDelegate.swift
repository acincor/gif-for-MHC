//
//  AppDelegate.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        return true
    }

}
