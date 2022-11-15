//
//  AppDelegate.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 02.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tableController = TableController()
        let navigationController = UINavigationController(rootViewController: tableController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
