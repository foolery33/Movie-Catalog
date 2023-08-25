//
//  AuthService.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

protocol AuthService {
    func login(
        body: LoginRequestBody,
        completion: @escaping (
            (Result<TokenResponse, Error>) -> Void
        )
    )
}
