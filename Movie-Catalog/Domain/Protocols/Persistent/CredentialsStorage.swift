//
//  CredentialsStorage.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

protocol CredentialsStorage: TokenProvider {

    // MARK: - Properties

    var accessToken: String? { get }

    // MARK: - Methods

    func saveAccessToken(_ token: String)

    func removeAccessToken()

    func cleanStorage()
}
