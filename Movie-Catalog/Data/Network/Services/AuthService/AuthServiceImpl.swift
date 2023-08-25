//
//  AuthServiceImpl.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Moya

final class AuthServiceImpl: BaseNetworkService {

    // MARK: - Private Properties

    private let client: MoyaProvider<AuthEndpoint>

    private let jsonDecoder: JSONDecoder = .init()

    // MARK: - Init

    public init(client: MoyaProvider<AuthEndpoint>) {
        self.client = client
    }
}

// MARK: - AuthService

extension AuthServiceImpl: AuthService {
    func login(
        body: LoginRequestBody,
        completion: @escaping (
            (Result<TokenResponse, Error>) -> Void
        )
    ) {
        client.request(.login(body: body)) { [weak self] moyaResult in
            guard let result = self?.handlerResponse(
                result: moyaResult,
                outputModel: TokenResponse.self
            ) else {
                return
            }

            switch result {
            case .success(let response):
                completion(.success(response))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
