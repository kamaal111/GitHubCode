//
//  AppDelegate_iOS.swift
//  iOS (App)
//
//  Created by Kamaal M Farah on 13/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
