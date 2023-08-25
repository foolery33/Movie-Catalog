//
//  AuthRepositoryImpl.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class AuthRepositoryImpl {

    // MARK: - Private Properties

    private let authService: AuthService

    private let credentialsStorage: CredentialsStorage

    private let tokenMapper: TokenMapper

    // MARK: - Init

    public init(
        authService: AuthService,
        credentialsStorage: CredentialsStorage,
        tokenMapper: TokenMapper
    ) {
        self.authService = authService
        self.credentialsStorage = credentialsStorage
        self.tokenMapper = tokenMapper
    }

}

// MARK: - AuthRepository

extension AuthRepositoryImpl: AuthRepository {
    func login(
        username: String,
        password: String,
        completion: @escaping (
            (Result<TokenDomain, Error>) -> Void
        )
    ) {
        authService.login(
            body: LoginRequestBody(
                username: username,
                password: password
            )
        ) { [weak self] result in
            switch result {
            case .success(let response):
                self?.credentialsStorage.saveAccessToken(response.token)
                completion(
                    .success(
                        self?.tokenMapper.call(response) ?? .init()
                    )
                )

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
