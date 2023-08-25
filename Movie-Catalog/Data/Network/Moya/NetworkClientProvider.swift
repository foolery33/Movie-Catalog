//
//  NetworkClientProvider.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Moya

private class DefaultAlamofireManager: Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default

        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy

        return DefaultAlamofireManager(configuration: configuration)
    }()
}

final class NetworkClientProvider {

    // MARK: - Private Properties

    private lazy var customPlugins: [PluginType] = [MoyaCustomLogPlugin()]

    private let tokenProvider: TokenProvider

    // MARK: - Init

    public init(
        tokenProvider: TokenProvider
    ) {
        self.tokenProvider = tokenProvider
    }

    // MARK: - Instances

    lazy var authClient: MoyaProvider<AuthEndpoint> = {
        makeClient(endpoint: AuthEndpoint.self)
    }()

    // MARK: - Private Methods

    private func makeClient<T>(endpoint: T.Type) -> MoyaProvider<T> where T: TargetType {
        return .init(
            session: DefaultAlamofireManager.sharedManager,
            plugins: customPlugins
        )
    }
}
