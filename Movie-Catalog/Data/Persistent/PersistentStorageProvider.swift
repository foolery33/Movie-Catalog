//
//  PersistentStorageProvider.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation
import KeychainSwift

final class PersistentStorageProvider {

    // MARK: - Private Properties

    private let userDefaultsStandard = UserDefaults.standard

    private let keychain = KeychainSwift()

    // MARK: - Instances

    lazy var credentialsStorage: CredentialsStorage = {
        CredentialsStorageImpl(keychain: keychain)
    }()
}
