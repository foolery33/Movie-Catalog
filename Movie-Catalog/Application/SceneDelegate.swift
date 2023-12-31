//
//  SceneDelegate.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    lazy var coordinator: Coordinator = {
        AppCoordinator(navigationController: self.rootViewController)
    }()

    let rootViewController = UINavigationController()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: windowScene)
        rootViewController.isNavigationBarHidden = true
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        coordinator.start()
    }

}
