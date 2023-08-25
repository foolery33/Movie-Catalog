//
//  SignInScreenAssembly.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import SwiftUI

enum SignInScreenAssembly {
    static func make(
        with sceneDelegate: SignInScreenSceneDelegate
    ) -> UIHostingController<SignInScreenView> {
        let viewModel = SignInScreenViewModel(
            dependencies: .init(
                loginUserUseCase: UseCaseProvider.instance.loginUserUseCase,
                getLoginErrorUseCase: UseCaseProvider.instance.getLoginErrorUseCase
            )
        )
        viewModel.sceneDelegate = sceneDelegate

        let viewController = UIHostingController(
            rootView: SignInScreenView(viewModel: viewModel)
        )
        return viewController
    }
}
