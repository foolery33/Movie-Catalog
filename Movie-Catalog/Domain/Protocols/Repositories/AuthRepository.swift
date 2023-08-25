//
//  AuthRepository.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

protocol AuthRepository {
    func login(
        username: String,
        password: String,
        completion: @escaping (
            (Result<TokenDomain, Error>) -> Void
        )
    )
}
