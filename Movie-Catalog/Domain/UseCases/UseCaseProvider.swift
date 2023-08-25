//
//  UseCaseProvider.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

final class UseCaseProvider {

    // MARK: - Singleton

    private init() {}

    static let instance = UseCaseProvider()

    // MARK: - Private Properties

    private let persistentStorageProvider: PersistentStorageProvider = .init()

    private lazy var tokenProvider: TokenProvider = persistentStorageProvider.credentialsStorage

    private lazy var networkServiceProvider: NetworkServiceProvider = .init(
        tokenProvider: tokenProvider
    )

    private lazy var repositoryProvider: RepositoryProvider = .init(
        serviceProvider: networkServiceProvider,
        persistentStorageProvider: persistentStorageProvider
    )

    // MARK: - Instances

    lazy var loginUserUseCase: LoginUserUseCase = {
        .init(authRepository: repositoryProvider.authRepository)
    }()

    lazy var emptyFieldValidationUseCase: EmptyFieldValidationUseCase = {
        .init()
    }()

    lazy var emailValidationUseCase: EmailValidationUseCase = {
        .init()
    }()

    lazy var passwordsEqualityValidationUseCase: PasswordsEqualityValidationUseCase = {
        .init()
    }()

    lazy var getLoginErrorUseCase: GetLoginErrorUseCase = {
        .init(
            emptyFieldValidationUseCase: emptyFieldValidationUseCase,
            passwordsEqualityValidationUseCase: passwordsEqualityValidationUseCase
        )
    }()
}
