//
//  SceneDelegate.swift
//  iOS7-HW21-Kholodkov Denis
//
//  Created by Денис Холодков on 02.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainAlamofireViewController = MainAlamofireController()
        let navigationController = UINavigationController(rootViewController: mainAlamofireViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

