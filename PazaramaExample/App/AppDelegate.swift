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
    private var coordinator: AppCoordinator?
    private lazy var dependencies: AppDependencies = {
       return AppDependencies()
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        if !dependencies.appConfig.isRunningTests {
            startApp()
        }
        return true
    }
}

// MARK: - Private Methods
private extension AppDelegate {
    func startApp() {
        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator = dependencies.makeAppCoordinator(navigationController)
        coordinator?.start()
    }
}
