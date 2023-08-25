//
//  NetworkServiceProvider.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class NetworkServiceProvider {

    // MARK: - Private Properties

    private let tokenProvider: TokenProvider

    private lazy var networkClientProvider: NetworkClientProvider = .init(tokenProvider: tokenProvider)

    // MARK: - Init

    public init(
        tokenProvider: TokenProvider
    ) {
        self.tokenProvider = tokenProvider
    }

    // MARK: - Instances

    lazy var authService: AuthService = {
        AuthServiceImpl(client: networkClientProvider.authClient)
    }()

}
