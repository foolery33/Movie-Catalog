//
//  AppCoordinator.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import UIKit

final class AppCoordinator: BaseNavigationCoordinator {

    // MARK: - Start

    override func start() {
        startAuthFlow()
    }

    // MARK: - Private Methods

    private func startAuthFlow() {
        let coordinator = AuthCoordinator(navigationController: navigationController)

        add(child: coordinator)
        coordinator.start()
    }

}
