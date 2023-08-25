//
//  SignInScreenViewModel.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import Foundation

final class SignInScreenViewModel: ObservableObject {

    // MARK: - Public Properties

    public weak var sceneDelegate: SignInScreenSceneDelegate?

    @Published public var username: String = .init()
    @Published public var password: String = .init()

    @Published public var isLoading: Bool = .init()
    @Published public var error: String = .init()
    @Published public var isAlertShowing: Bool = .init()

    public var areFieldsValid: Bool {
        return dependencies.getLoginErrorUseCase.invoke(
            username: username,
            password: password
        ) == nil
    }

    // MARK: - Private Properties

    private let dependencies: Dependencies

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Public Methods

    public func loginUser() {
        if let error = dependencies.getLoginErrorUseCase.invoke(
            username: username,
            password: password
        ) {
            handleError(error)
            return
        }
        isLoading = true
        dependencies.loginUserUseCase.invoke(
            username: username,
            password: password
        ) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success:
                self?.goToMainScreen()

            case .failure(let error):
                self?.handleError(error)
            }
        }
    }

    // MARK: - Private Methods

    private func goToMainScreen() {
        sceneDelegate?.goToMainScreen()
    }

    private func goToSignUpScreen() {
        sceneDelegate?.goToSignUpScreen()
    }

    private func handleError(_ error: Error) {
        self.error = error.localizedDescription
        isAlertShowing = true
    }

}

// MARK: - Nested Types

extension SignInScreenViewModel {
    struct Dependencies {
        let loginUserUseCase: LoginUserUseCase
        let getLoginErrorUseCase: GetLoginErrorUseCase
    }
}
