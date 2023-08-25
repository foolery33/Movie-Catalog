//
//  LoginUserUseCase.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class LoginUserUseCase {

    // MARK: - Private Properties

    private let authRepository: AuthRepository

    // MARK: - Init

    public init(
        authRepository: AuthRepository
    ) {
        self.authRepository = authRepository
    }

    // MARK: - UseCase

    public func invoke(
        username: String,
        password: String,
        completion: @escaping (
            (Result<Void, Error>) -> Void
        )
    ) {
        authRepository.login(
            username: username,
            password: password
        ) { result in
            switch result {
            case .success:
                completion(.success(()))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
