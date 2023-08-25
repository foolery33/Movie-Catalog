//
//  AuthCoordinator.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

final class AuthCoordinator: BaseNavigationCoordinator {

    // MARK: - Start

    override func start() {
        startSignInScreen()
    }

    // MARK: - Private Methods

    private func startSignInScreen() {
        let viewController = SignInScreenAssembly.make(with: self)

        navigationController.pushViewController(viewController, animated: true)
    }

}

// MARK: - SignInScreenSceneDelegate

extension AuthCoordinator: SignInScreenSceneDelegate {
    func goToSignUpScreen() {

    }

    func goToMainScreen() {

    }
}
