//
//  BaseNavigationCoordinator.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import UIKit

class BaseNavigationCoordinator: Coordinator {

    // MARK: - Properties

    private var _children: [Coordinator] = []

    let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    var children: [Coordinator] {
        _children
    }

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func add(child coordinator: Coordinator) {
        _children.append(coordinator)
    }

    func remove(child coordinator: Coordinator) {
        _children = children.filter { coordinator !== $0 }
    }

    // MARK: - Coordinator Methods

    func start() {
        fatalError("Start method must be overridden")
    }
}
