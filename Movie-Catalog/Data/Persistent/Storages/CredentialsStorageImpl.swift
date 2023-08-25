//
//  CredentialsStorageImpl.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import KeychainSwift

final class CredentialsStorageImpl {

    // MARK: - Private Properties

    private let keychain: KeychainSwift

    // MARK: - Init

    init(keychain: KeychainSwift) {
        self.keychain = keychain
    }
}

// MARK: - CredentialsStorage

extension CredentialsStorageImpl: CredentialsStorage {

    // MARK: - Public Properties

    public var accessToken: String? {
        keychain.get(StorageKey.accessToken.rawValue)
    }

    // MARK: - Public  Methods

    public func saveAccessToken(_ token: String) {
        keychain.set(token, forKey: StorageKey.accessToken.rawValue)
    }

    public func removeAccessToken() {
        keychain.delete(StorageKey.accessToken.rawValue)
    }

    public func cleanStorage() {
        keychain.clear()
    }
}
