//
//  RepositoryProvider.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class RepositoryProvider {

    // MARK: - Private Properties

    private let serviceProvider: NetworkServiceProvider

    private let persistentStorageProvider: PersistentStorageProvider

    // MARK: - Init

    public init(
        serviceProvider: NetworkServiceProvider,
        persistentStorageProvider: PersistentStorageProvider
    ) {
        self.serviceProvider = serviceProvider
        self.persistentStorageProvider = persistentStorageProvider
    }

    // MARK: - Instances

    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(
            authService: serviceProvider.authService,
            credentialsStorage: persistentStorageProvider.credentialsStorage,
            tokenMapper: .init()
        )
    }()

}
