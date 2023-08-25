//
//  GetLoginErrorUseCase.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class GetLoginErrorUseCase {

    // MARK: - Private Properties

    private let emptyFieldValidationUseCase: EmptyFieldValidationUseCase

    private let passwordsEqualityValidationUseCase: PasswordsEqualityValidationUseCase

    // MARK: - Init

    public init(
        emptyFieldValidationUseCase: EmptyFieldValidationUseCase,
        passwordsEqualityValidationUseCase: PasswordsEqualityValidationUseCase
    ) {
        self.emptyFieldValidationUseCase = emptyFieldValidationUseCase
        self.passwordsEqualityValidationUseCase = passwordsEqualityValidationUseCase
    }

    // MARK: - UseCase

    public func invoke(
        username: String,
        password: String
    ) -> Error? {
        if emptyFieldValidationUseCase.invoke(username) {
            return AppError.message(R.string.localizable.username_empty_error())
        }

        if emptyFieldValidationUseCase.invoke(password) {
            return AppError.message(R.string.localizable.password_empty_error())
        }

        return nil
    }

}
