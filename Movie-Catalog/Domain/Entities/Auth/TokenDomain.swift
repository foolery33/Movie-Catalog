//
//  TokenDomain.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

struct TokenDomain {
    let token: String

    init(
        token: String
    ) {
        self.token = token
    }

    init() {
        self.token = .init()
    }
}
