//
//  AppDelegate.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        startApp()
        return true
    }
}

// MARK: - Private Methods
private extension AppDelegate {
    func startApp() {
        let controller = HomeController()
        let navigationController = UINavigationController(rootViewController: controller)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
